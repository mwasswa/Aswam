<?php

namespace App\Http\Controllers;

//use Illuminate\Http\Request;
use App\User;
use Barryvdh\DomPDF\PDF;
use Illuminate\Support\Facades\Input;
use Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Account;
use App\Product;
use App\Supplier;
use App\SupplierProducts;
use App\Client;
use App\Invoice;
use App\Invoice_detail;
use App\Account_category;
use App\Journal;
use App\Transaction;
use Illuminate\Support\Facades\Session;
use App\Profile;
use App\Privillege;
use App\Quotation;
use Barryvdh\DomPDF\Facade as PDF1;
use App\Quotationdetail;
use App\Costparameter;
use App\Cost;
use App\Inventory;
use App\Costgroup;
use App\Stock;
use App\Shelf;

class Hello extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public $restful = true;

    public function select_purchased_items(){
        if(Session::has('username')) {
            $input = Request::all();
            //$input = array_slice($input, 1, -1);
            //print_r($input);exit;
            $products = array();
            foreach($input as $k=>$val) {
                if (is_numeric($k)) {
                    $products[$k] = $val;
                }
                $data['prods'] = $products;
                $data['params'] = Costparameter::latest()->get()->toArray();
                $data['cgroups'] = Costgroup::latest()->get()->toArray();
            }
            //return view('new_inventory_items',$data);
            return view('register_new_inventory_items',$data);
        }else{
            return redirect('/');
        }
    }

    public function walkins(){
        return view('walkins');
    }

    public function shelves(){
        $shelves = Shelf::latest()->get()->toArray();
        $data['shelves'] = $shelves;
        return view('shelves',$data);
    }

    public function save_new_shelf(){
        $input = Request::all();
        Shelf::create($input);
        return redirect('shelves');
    }

    public function stock(){
        $stock = Stock::latest()->get()->toArray();
        foreach($stock as $pos=>$data){
            $code = $data['item_code'];
            $shelf_no = $data['shelf_no'];
            $shelf = Shelf::find($shelf_no)->toArray();
            $shelf_no = $shelf['name'];

            $inv_details = Inventory::whereRaw('batch_no = ?',[$data['batch_no']])->get()->toArray();
            $qty_purchased = $inv_details[0]['qty_purchased'];

            $stock[$pos]['purchased'] = $qty_purchased;
            $stock[$pos]['expiry'] = $inv_details[0]['expiry_date'];


            $pdetails = Product::whereRaw('item_code = ?',[$code])->get()->toArray();
            $stock[$pos]['unit'] = $pdetails[0]['unit_of_measure'];
            $stock[$pos]['size'] = $pdetails[0]['size'];
            $stock[$pos]['name'] = $pdetails[0]['name'];
            $stock[$pos]['shelf_no'] = $shelf_no;
        }
        $data['stock'] = $stock;
        return view('stock',$data);
    }

    public function save_price_floor(){
        $input = Request::all();
        //print_r($input);exit;
        foreach($input as $k=>$v) {
            if (preg_match("/\b-\b/i", $k)){
                if($k != '_token'){
                    $arr = explode("_",$k);
                    $bno = $arr[0];
                    $cost = $arr[1];
                    $margin = $v;
                    $arr1 = explode('-',$bno);
                    $data = array(
                        'batch_no' => $bno,
                        'cost' => $cost,
                        'margin' => $margin,
                        'floor' => ($margin + $cost),
                        'item_code' => $arr1[0]
                    );
                    $data1[] = array(
                        'batch_no' => $bno,
                        'cost' => $cost,
                        'margin' => $margin,
                        'floor' => ($margin + $cost),
                        'item_code' => $arr1[0]
                    );
                   $costs = Cost::create($data);
                    $inserted = $costs->id;
                    if($inserted){
                        Inventory::where('batch_no','=',$bno)->update(array('status'=>'ready_for_sale'));
                    }
                }
            }
        }
        //exit;
        $info['pdts'] = $data1;
        return view('costed_items',$info);

    }

    public function proceed_to_pricing(){
        $data['cgroups'] = Costgroup::latest()->get()->toArray();
        return view('proceed_to_pricing',$data);
    }

    public function cost_inventory_items(){
        $status = "under_review";
        $input = Request::all();
        $cgid = $input['cgid'];
        $pdts = Inventory::whereRaw('status = ? and cgid = ?',[$status, $cgid])->get()->toArray();
        //print_r($pdts);exit;
        if(Session::has('username')) {
            $products = array();
            foreach($pdts as $k=>$val) {
                $item_code = $val['item_code'];
                $batch_no = $val['batch_no'];
                $pdetails = Product::whereRaw('item_code = ?',[$item_code])->latest()->get()->toArray();
                $name = $pdetails[0]['name'];
                $products[$batch_no][$item_code] = $name;
            }
            $data['prods'] = $products;
            $data['params'] = Costparameter::latest()->get()->toArray();
            return view('new_inventory_items',$data);
            //return view('register_new_inventory_items',$data);
        }else{
            return redirect('/');
        }
    }

    public function inventory_to_stock(){
        $status = "ready_for_sale";
        $qty_in_store = 0;
        $pdts = Inventory::whereRaw('status = ? and qty_in_store > ?',[$status,$qty_in_store])->orderBy('expiry_date','ASC')->get()->toArray();
        foreach($pdts as $pos=>$info){
            $pcode = $info['item_code'];
            $pdetails = Product::whereRaw('item_code = ?',[$pcode])->get()->toArray();
            $pdts[$pos]['name'] = $pdetails[0]['name'];
            $pdts[$pos]['size'] = $pdetails[0]['size'];
            $pdts[$pos]['unit'] = $pdetails[0]['unit_of_measure'];
        }
        $data['items'] = $pdts;
        $data['shelves'] = Shelf::latest()->get()->toArray();
        return view('select_items_to_stock',$data);
        //print_r($pdts);exit;
    }

    public function move_items_to_stock(){
        $input = Request::all();
        //print_r($input);exit;
        foreach($input as $ke=>$va){
            if (preg_match("/\b-\b/i", $ke)){
                $arr = explode("_",$ke);
                $vars[$arr[1]][$arr[0]] = $va;
            }
        }

        foreach($vars as $bno=>$arr){
            if(count($arr) == 3){
                $arr1 = explode("-",$bno);
                $pcode = $arr1[0];
                $sdetails = Stock::whereRaw('batch_no = ?',[$bno])->get()->toArray();
                //print_r($sdetails);exit;
                if(is_array($sdetails) && count($sdetails)){
                    $initial_stock = $sdetails[0]['qty_in_stock'];
                    $new_stock = $initial_stock + intval($arr['units']);
                    $orig_shelf = $sdetails[0]['shelf_no'];
                    if(strlen($arr['shelf'])){
                        $shelf_new = $arr['shelf'];
                    }else{
                        $shelf_new = $orig_shelf;
                    }
                    Stock::where('batch_no','=',$bno)->update(array('qty_in_stock'=>$new_stock,'shelf_no'=>$shelf_new));
                    $inv_details = Inventory::whereRaw('batch_no = ?',[$bno])->get()->toArray();
                    $new_inv_qty = (intval($inv_details[0]['qty_in_store']) - intval($arr['units']));
                    Inventory::where('batch_no','=',$bno)->update(array('qty_in_store'=>$new_inv_qty));
                }else{
                    $new_stock = intval($arr['units']);
                    $data = array(
                        'item_code' => $pcode,
                        'batch_no' => $bno,
                        'qty_in_stock' => $new_stock,
                        'shelf_no' => $arr['shelf']
                    );
                    $stocked = Stock::create($data);
                    $stocked_id = $stocked->id;
                    if($stocked_id){
                        $inv_details = Inventory::whereRaw('batch_no = ?',[$bno])->get()->toArray();
                        $new_inv_qty = (intval($inv_details[0]['qty_in_store']) - intval($arr['units']));
                        Inventory::where('batch_no','=',$bno)->update(array('qty_in_store'=>$new_inv_qty));
                    }
                }
            }
        }
        return redirect("inventory_to_stock");
    }

    public function save_items_inventory(){
        $input = Request::all();
        if(strlen($input['cgname']) || strlen($input['cgname_selected'])) {
            if (strlen($input['cgname'])) {
                $cg['name'] = $input['cgname'];
                $cg_id = Costgroup::create($cg);
                $cgid = $cg_id->id;
                $data2['cgid'] = $cgid;
            } elseif (strlen($input['cgname_selected'])) {
                $data2['cgid'] = $input['cgname_selected'];
            }
        }
        foreach($input as $ke=>$va){
            if(preg_match("/\b-\b/i", $ke)){
                $arr = explode("-",$ke);
               $data1[$arr[1]][$arr[0]] = $va;
            }
        }

        foreach($data1 as $id=>$data){
            $pdt = Product::find($id)->toArray();
            $data['item_code'] = $pdt['item_code'];
            $data['batch_no'] = $data['item_code']."-".$data['purchase_date']."-".date("h:i:s");
            $data['status'] = "under_review";
            $data['cgid'] = $data2['cgid'];
            $data['qty_in_store'] = $data['qty_purchased'];
            $data1[$id]['pdt_code'] = $data['item_code'];
            $data1[$id]['name'] = $pdt['name'];
            $data1[$id]['unit'] = $pdt['unit_of_measure'];
            $data1[$id]['size'] = $pdt['size'];
            Inventory::create($data);
        }
        //print_r($data1);exit;
        $inv_items['new_items'] = $data1;
        return view('inventory_added_items',$inv_items);
    }

    public function determine_selling_price(){
        $input = Request::all();
        $input = array_slice($input, 1, -1);
        //print_r($input);exit;
        foreach($input as $k=>$v){
            if(!preg_match("/\b-\b/i", $k)){
                $params[] = $v;
            }else{
                $arr = explode("_",$k);
                if(($arr[0] != "costprice")&&($arr[0]!="others")){
                    $arr2 = explode("-",$arr[0]);
                    $pcode = $arr2[0];
                    $param_allocs[$arr[0]][] = $v;
                }else{
                    $arr3 = explode("-",$arr[1]);
                    $pcode = $arr3[0];
                    $others_cp[$arr[1]][] = $v;
                }
            }
        }
        //print_r($others_cp);exit;
        $c = count($params);

        foreach($param_allocs as $bno=>$ar){
            $i = 0;
            $computed[$bno] = 0;
            while($i < $c){
                $computed[$bno] += (($ar[$i]/100) * $params[$i]);
                $i++;
            }
        }

        foreach($others_cp as $bno=>$info){
                $total[$bno] = $computed[$bno];
                foreach($info as $amount){
                   $total[$bno]  += $amount;
                }
        }

        foreach($total as $bno=>$price){
            $arr5 = explode("-",$bno);
            $pcode = $arr5[0];
            $pdt = Product::whereRaw('item_code = ?',[$pcode])->get()->toArray();
            //$pdt = Product::find($pid)->toArray();
            //print_r($pdt);exit;
            $pname = $pdt[0]['name'];
            $vals[] = array(
                'item_code'=>$pcode,
                'batch_no'=>$bno,
                'cost'=>$price,
                'name'=>$pname
            );
            //Cost::create($vals);
            //$test[] = array($pname=>$price);
        }
        //$data['computed'] = $test;
        $data['computed'] = $vals;
        return view('save_inventory_items',$data);

        //print_r($total);print_r($computed);print_r($params);print_r($param_allocs);print_r($others_cp);exit;
    }

    public function costing_parameters(){
        if(Session::has('username')) {
            $data['parameters'] = Costparameter::latest()->get()->toArray();
            return view('costing_parameters', $data);
        }else{
            return redirect('/');
        }
    }

    public function inventory(){
        //get all products and display them with checkboxes according to department
        //$data['products'] = Product::latest()->get()->toArray();
        $data['products'] = Product::orderBy('name', 'ASC')->get()->toArray();
        return view('inventory_whitelist',$data);
    }

    public function save_product_cost(){
        $input = Request::all();
        $cdetails = ""; $price = 0;
        foreach($input as $k=>$val){
            if(is_numeric($val) && ($k != 'pid' && $k != 'status')){
                $cdetails .= $k." : ".$val. ",";
                $price += intval($val);
            }
        }
        $inputs = array(
            'pid' => $input['pid'],
            'pdetails' => $cdetails,
            'price' => $price
        );
        Cost::create($inputs);
        return redirect('cost_product/'.$input['pid']);
    }

    public function cost_product($pid){
        if(Session::has('username')) {
            $data = array();
            $data['params'] = Costparameter::latest()->get()->toArray();
            $data['pid'] = $pid;
            $data['pdetails'] = Product::find($pid)->toArray();
            $data['costing'] = Cost::whereRaw('pid = ?',[$pid])->get()->toArray();
            return view('costing', $data);
        }else{
            return redirect('/');
        }
    }

    public function save_costing_parameter(){
        $input = Request::all();
        Costparameter::create($input);
        return redirect('costing_parameters');
    }

    public function test_pdf($id){
        $allowed_paths = array('all_routes');
        Session::put('allowed_paths',$allowed_paths);
        //return view('quotation');
        $inv_details['details'] = Quotationdetail::where('quotationid', '=', $id)->get()->toArray();
        $inv_details['quotation_details_id'] = Quotation::find($id)->toArray();

        $pdf = PDF1::loadView('quotation',$inv_details);
        return $pdf->download('quotation.pdf');
    }

    public function quotation_details($id){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $inv_details['details'] = Quotationdetail::where('quotationid', '=', $id)->get()->toArray();
                $inv_details['quotation_details_id'] = Quotation::find($id)->toArray();
                return view('quotationdetails', $inv_details);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function save_quotation(){
        if($this->check_user_paths()) {
            $input = Request::all();
            Quotation::create($input);
            return redirect('quotation');
        }else{
            return view('error_page');
        }
    }

    public function add_quotation_item(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                //print_r($input);exit;
                Quotationdetail::create($input);
                return redirect('quotation');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function quotation(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $clients = Account::where("category", "=", "client")->get()->toArray();
                $data['clients'] = $clients;
                $data['quotations'] = Quotation::latest()->get()->toArray();
                foreach ($data['quotations'] as $k => $val) {
                    extract($val);
                    $client = Account::where("id", "=", $val['clientid'])->get()->toArray();
                    $clientname = $client[0]['name'];
                    $data['quotations'][$k]['clientid'] = $clientname;
                }
                $data['products'] = Product::latest()->get()->toArray();
                $data['accounts'] = Account::latest()->get()->toArray();
                return view('quotation_form',$data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function check_user_paths(){
        $allowed_paths = Session::get('allowed_paths');
        $current_path = Request::path();
        if(strstr($current_path,'/')){
           $arr = explode('/',$current_path);
            $current_path = $arr[0];
        }
        if (in_array($current_path, $allowed_paths) || in_array('all_routes', $allowed_paths)) {
            return 1;
        } else {
            return 0;
        }
    }

    public function index()
    {
        $data=array('error_msg'=>'');
        return view('login',$data);
    }

    public function get_price(){
        $item_id = Post::find( Input::get( 'item_id' ));
        $prods = Product::find($item_id)->toArray();
        return $prods;
    }

    public function welcome(){
        return view('welcome');
    }

    public function users(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $data['profiles'] = Profile::latest()->get()->toArray();
                $data['users'] = User::latest()->get()->toArray();
                return view('users', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function register_users(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                User::create($input);
                return redirect('users');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function user_profiles(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $privs = Privillege::latest()->get()->toArray();
                //print_r($privs);exit;
                foreach($privs as $k=>$info){
                    $profid = $info['profile_id'];
                    $prof = Profile::whereRaw('id = ?',[$profid])->get()->toArray();
                    //print_r($prof);exit;
                    foreach($prof as $kk=>$val){
                        //echo $privs[$k]['profile_id'];exit;
                        $privs[$k]['profile_id'] = $val['name'];
                    }
                    $allowed = "";
                    foreach($info as $ke => $routes) {
                        if (intval($routes) == 1) {
                            $allowed .= $ke . ': ';
                        }
                    }
                    $privs[$k]['allowed_paths'] = $allowed;
                }
                //print_r($privs);exit;
                $data['profiles'] = $privs;
                $priv = new Privillege();
                $data['privs'] = $priv->getColumnListing('privilleges');
                return view('profiles', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function create_user_profile(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                //print_r($input);exit;
                $profile_id = Profile::create($input);
                $prof_id = $profile_id->id;
                $input['profile_id'] = $prof_id;
                Privillege::create($input);
                return redirect('user_profiles');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function login_form(){
        $input = Request::all();
        $uname = $input['username'];
        $psword = $input['password'];
        $exists = User::whereRaw('username = ? and password = ?',[$uname,$psword])->get()->toArray();
        //print_r($exists);exit;
        if(is_array($exists) && count($exists)){
            Session::put('username', $uname);
            foreach($exists as $k=>$val){
                $profileid = $val['profile'];
            }
            //go into privilleges table and get the privilleges

            $privs = Privillege::whereRaw('profile_id = ?',[$profileid])->get()->toArray();
            $privs = $privs[0];

            foreach (array_keys($privs, 0) as $key) {
                unset($privs[$key]);
            }


            unset($privs['id']);unset($privs['created_at']);unset($privs['updated_at']);unset($privs['profile_id']);
            $privs = array_keys($privs);
            $allowed_paths = $privs;
            Session::put('allowed_paths',$allowed_paths);
            if(in_array('all_routes',$allowed_paths)){
                $default = 'acc_categories';
            }else{
                $default = "welcome";
            }
            return redirect($default);
        }else{
            $data['error_msg'] = "This user doesnot exist in the database";
            return view('login',$data);
        }
    }

    public function acc_categories(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $accounts = Account_category::orderBy('id', 'desc')->get()->toArray();
                $data['accounts'] = $accounts;
                $data['username'] = Session::get('username');
                return view('home', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function print_receipt($id){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $transacs = Transaction::where("id", "=", $id)->get()->toArray();
                foreach ($transacs as $k => $trans) {
                    extract($trans);
                    $amount = $trans['amount_paid'];
                    $date = $trans['created_at'];
                    $inv = Journal::where("id", "=", $trans["journal_id"])->get()->toArray();
                    foreach ($inv as $k => $val) {
                        $inv_id = $val['invoice_id'];
                    }
                    $msg = "Invoice Number: $inv_id\n Amount Paid: $amount\n Date Paid: $date";
                    $file = fopen("receipts/test.txt", "w");
                    fwrite($file, $msg);
                    fclose($file);

                }
                return redirect("inv_details/" . $inv_id);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function record_invoice_payment(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                //print_r($input);exit;
                $invoice_id = $input['invoice_no'];
                $journal = Journal::where("invoice_id", "=", $invoice_id)->get()->toArray();
                //print_r($journal);exit;
                if (is_array($journal) && count($journal)) {
                    foreach ($journal as $k => $val) {
                        $jid = $val['id'];
                    }
                } else {
                    $jid = 0;
                }
                $input['journal_id'] = $jid;
                Transaction::create($input);
                return redirect('inv_details/' . $invoice_id);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function account_category_enteries(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $data['accounts'] = Account_category::latest()->get()->toArray();
                $data['entries'] = Account::latest()->get()->toArray();
                foreach ($data['entries'] as $k => $val) {
                    $acc = Account_category::where("id", "=", $val['category_id'])->get()->toArray();
                    $data['entries'][$k]['category_id'] = $acc[0]['name'];
                }
                //print_r($data['entries']);exit;
                return view('account_entries', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function proceed_account_entries(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                $cat = $input['account_cat_id'];
                $cat_arr = explode("-", $cat);
                //print_r($cat_arr);exit;
                $acc_cat = $cat_arr[0];
                $acc_cat_id = $cat_arr[1];
                $data['acc_cat_id'] = $acc_cat_id;
                //$data[$acc_cat.'s'] = Client::latest()->get()->toArray();
                $data[$acc_cat . 's'] = Account::where('category_id', '=', $acc_cat_id)->get()->toArray();
                $data['acc_cat'] = $acc_cat;
                return view('accounts', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }

    }

    public function generate_invoice(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                //$clients = Client::latest()->get()->toArray();
                $clients = Account::where("category", "=", "client")->get()->toArray();
                $data['clients'] = $clients;
                $data['invoices'] = Invoice::latest()->get()->toArray();
                foreach ($data['invoices'] as $k => $val) {
                    extract($val);
                    $client = Account::where("id", "=", $val['clientid'])->get()->toArray();
                    $clientname = $client[0]['name'];
                    $data['invoices'][$k]['clientid'] = $clientname;
                }

                $stock = Stock::latest()->get()->toArray();
                foreach($stock as $ke=>$info){
                    $pdetails = Product::where("item_code", "=", $info['item_code'])->get()->toArray();
                    $name = $pdetails[0]['name'];
                    $stock[$ke]['name'] = $name;
                    $cost = Cost::where("batch_no","=",$info['batch_no'])->get()->toArray();
                    $stock[$ke]['floor'] = $cost[0]['floor'];
                    $stock[$ke]['id'] = $pdetails[0]['id'];
                }

                $data['products'] = $stock;
                //print_r($data['products']);exit;


                /*
                //print_r($data['invoices']);exit;
                $data['products'] = Product::latest()->get()->toArray();
                //print_r($data['products']);exit;
                foreach($data['products'] as $k=>$info){
                    $pcode = $info['item_code'];
                    $status = "active";
                    $costs = Cost::whereRaw('item_code = ? and status = ?',[$pcode,$status])->get()->toArray();
                    if(is_array($costs) && count($costs)){
                        $floor = $costs[0]['floor'];
                        $data['products'][$k]['floor'] = $floor;
                    }else{
                        //$data['products'][$k]['floor'] = 'NIL';
                        unset($data['products'][$k]);
                    }
                }*/
                $data['invoice_details'] = Invoice_detail::latest()->get()->toArray();
                $data['accounts'] = Account::latest()->get()->toArray();
                return view('invoices', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function add_invoice_item(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                //print_r($input);exit;
                $pid = explode("-",$input['pdt_code']);
                $p_id = $pid[0];
                $pdt = Product::find($p_id)->toArray();

                $item_code = $pdt['item_code'];
                //print $item_code;exit;

                Journal::create($input);
                $input['invoiceid'] = $input['invoice_id'];
                $inv_det = Invoice_detail::create($input);
                $ids = $inv_det->id;
                if(strlen($ids)){
                    $qty_sold = $input['quantity'];
                    $stocks = Stock::where("item_code","=",$item_code)->get()->toArray();
                    //print_r($stocks);exit;
                    $bals = 0;
                    foreach($stocks as $k=>$info){

                    }
                }

                return redirect('invoices');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function save_invoice(){
        if($this->check_user_paths()) {
        $input = Request::all();
        Invoice::create($input);
        return redirect('invoices');
        }else{
            return view('error_page');
        }
    }

    public function inv_details($id){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $inv_details['details'] = Invoice_detail::where('invoiceid', '=', $id)->get()->toArray();
                $inv_details['invoice_details_id'] = Invoice::find($id)->toArray();
                $jarr = Journal::where("invoice_id", "=", $id)->get()->toArray();

                if (is_array($jarr) && count($jarr)) {
                    foreach ($jarr as $k => $var) {
                        $jid = $var['id'];
                    }
                } else {
                    $jid = 0;
                }
                $transacs = Transaction::where("journal_id", "=", $jid)->get()->toArray();
                //print_r($transacs);exit;
                $inv_details['payments'] = $transacs;
                return view('invoicedetails', $inv_details);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function suppliers(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $suppliers = Supplier::latest()->get()->toArray();
                $data['suppliers'] = $suppliers;
                $data['accounts'] = Account_category::orderBy('id', 'desc')->get()->toArray();
                return view('suppliers', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function clients(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                //$clients = Client::latest()->get()->toArray();
                $clients = Account::where("category", "=", "client")->get()->toArray();
                $data['clients'] = $clients;
                $data['accounts'] = Account_category::orderBy('id', 'desc')->get()->toArray();
                return view('clients', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function register_supplier(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                Supplier::create($input);
                return redirect('suppliers');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function register_client(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                Account::create($input);
                //$data['acc_cat_id'] = null;
                //$data['clients'] = array();
                //return redirect('clients');
                return redirect('account_category_enteries');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function record_income(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $data["invoices"] = array();
                return view('record_income', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function record_income_save(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                $name = $input['name'];
                $inv_no = $input['invoice_no'];
                if (strlen($name)) {
                    $client = Account::where('name', '=', $name)->get()->toArray();
                    foreach ($client as $k => $arr) {
                        $clientid = $arr['id'];
                    }
                    $invoice = Invoice::where('clientid', '=', $clientid)->get()->toArray();
                    $data['invoices'] = $invoice;
                } elseif (strlen($inv_no)) {
                    $invoice = Invoice::where('id', '=', $inv_no)->get()->toArray();
                    $data['invoices'] = $invoice;
                } else {
                    $data['invoices'] = array();
                }
                return view("record_income", $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function inflows(){
        return "Welcome to inflows page";
    }

    public function products(){
        if(Session::has('username')) {
            if (Session::has('username')) {
                if ($this->check_user_paths()) {
                    $products = Product::latest()->get()->toArray();
                    $data['products'] = $products;
                    return view('products', $data);
                } else {
                    return view('error_page');
                }
            } else {
                return redirect('/');
            }
        }else{
            return redirect('/');
        }
    }

    public function register_product(){
        if(Session::has('username')) {
            if($this->check_user_paths()) {
            $input = Request::all();
            Product::create($input);
            return redirect('products');
            }else{
                return view('error_page');
            }
        }else{
                return redirect('/');
        }
    }

    public function accounts(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                Account_category::create($input);
                return redirect('acc_categories');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function assign_supplier_products(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $input = Request::all();
                SupplierProducts::create($input);
                return redirect('supplier_products');
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    public function supplier_products(){
        if(Session::has('username')) {
            if ($this->check_user_paths()) {
                $products = Product::latest()->get()->toArray();
                //$suppliers = Supplier::latest()->get()->toArray();
                $suppliers = Account::where("category", "=", "supplier")->get()->toArray();
                $data = array(
                    'products' => $products,
                    'suppliers' => $suppliers,
                    'supplier_products' => SupplierProducts::latest()->get()->toArray()
                );
                return view('supplier_products', $data);
            } else {
                return view('error_page');
            }
        }else{
            return redirect('/');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }
    
    public function contact_other(){
        return view('pages.contact');
    }
    
    public function details($name,$role){
        $data = array(
            'name'=>$name,
            'role'=>$role
        );
        return view('hello',$data);
        //return $name."-".$role;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = array('name'=>$id);
        return view('hello',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }
    
    public function contact(){
        return 'Hello world... Contact me here';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    
    public function get_users($uid){
        $results = DB::select('select * from users where id > ?', [$uid]);
        print_r($results);
    }

    public function logout(){
        Session::flush();
        return redirect('/');
    }
}
