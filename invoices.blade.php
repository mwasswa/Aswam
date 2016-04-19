@extends('default')

@section('content')
    <?php
            /*
        $comms = "<select name='pdt_code' class='form-control selectproduct' id='selectproduct'><option value=''>-Select Item-</option>";

        foreach ($products as $key => $val) {
        extract($val);
        $comms .= "<option value='" .$id."-". strtolower($name) ."-".$floor."'>" . strtoupper($name) . "</option>";
        }
        $comms .= "</select>";
            */

        $acc_dr = "<select name='account_dr' class='form-control'><option value=''>-Debited Account-</option>";

        foreach ($accounts as $key => $val) {
            extract($val);
            $acc_dr .= "<option value='$id'>" . strtoupper($name) . "</option>";
        }
        $acc_dr .= "</select>";

        $acc_cr = "<select name='account_cr' class='form-control'><option value=''>-Credited Account-</option>";

        foreach ($accounts as $key => $val) {
            extract($val);
            $acc_cr .= "<option value='$id'>" . strtoupper($name) . "</option>";
        }
        $acc_cr .= "</select>";
/*
    $html = '<form class="form-inline" role="form" method="POST" enctype="multipart/form-data">
        <div class="form-group margin-10">' .
            $comms . '
        </div>
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="email" placeholder="Quantity" name="quantity"/>
        </div>
        <div class="form-group margin-10">' .
            $acc_dr . '
        </div>
        <div class="form-group margin-10">' .
            $acc_cr . '
        </div>
        <div class="form-group margin-10">
            <input type="submit" class="btn btn-primary" value="Save" name="transactionBtn"/>
        </div>
    </form>';
*/

    ?>
    <div class="col-xs-12 margin-10">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i> Create New Invoice</font></legend>
            {!! Form::open(array('action' => 'Hello@save_invoice','class'=>'form-inline')) !!}
            <div class="form-group margin-10">
                <?php
                $select = "<select name='clientid' class='form-control'><option value=''>-Select Client-</option>";
                foreach($clients as $k=>$val){
                    extract($val);
                    $select .= "<option value='$id'>".ucfirst($name)."</option>";
                }
                $select .= "</select>";
                echo $select;
                ?>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="Currency E.g. UGX, USD" name="currency"/>
            </div>
            <div class="form-group margin-10">
                <select name='billing_method' class='form-control'>
                    <option value=''>-Select Billing Method-</option>
                    <option value='auto'>Auto</option>
                    <option value='manual'>Manual</option>
                </select>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="Invoice Amount E.g. 200000" name="invoice_amount"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="Invoice Description" name="description"/>
            </div>
            <div class="form-group margin-10">
                <select name='payment_status' class='form-control'>
                    <option value=''>-Select Payment Status-</option>
                    <option value='full'>Full</option>
                    <option value='partial'>Partial</option>
                    <option value='none'>None</option>
                </select>
            </div>
            <div class="form-group margin-10">
                <select name='approval_status' class='form-control'>
                    <option value=''>-Select Approval Status-</option>
                    <option value='approved'>Approved</option>
                    <option value='pending'>Pending</option>
                    <option value='rejected'>Rejected</option>
                    <option value='cancelled'>Cancelled</option>
                </select>
            </div>
            <div class="form-group margin-10">
                <input type="submit" class="btn btn-primary" value="Save" name="add_suppliers"/>
            </div>
            {!! Form::close() !!}
        </fieldset>
    </diV>

    <div class="col-xs-12">
        <fieldset>
            <legend></legend>
        <?php
        $users_arr = $invoices;
        if (is_array($users_arr) && count($users_arr)) {
            $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Client</th>
                <th>Description</th>
                <th>Invoice No</th>
                <th>Status</th>
                <th>Date Created</th>
                <th>Invoice Details</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>';
            $i = 1;
            $comms = "<select name='pdt_code' class='form-control selectproduct'><option value=''>-Select Item-</option>";
            //print_r($products);exit;
                foreach($products as $k=>$v){
                    $data[$v['item_code']][] = $v['qty_in_stock'];
                    $data1[$v['item_code']] = $v['floor']."-".$v['name']."-".$v['id'];
                }
            foreach ($data1 as $code => $val) {
                $arr = explode("-",$val);
                $pid  = $arr[2];
                $name = $arr[1];
                $floor = $arr[0];
                //$batchno = $val['batch_no'];
                //$qty = $val['qty_in_stock'];
                $total_qty = array_sum($data[$code]);
                $comms .= "<option value='" .$pid."-". strtolower($name) ."-".$floor."'>" ."Name: ". strtoupper($name)." Qty: ".$total_qty. "</option>";
            }
            $comms .= "</select>";
            foreach ($users_arr as $pos => $info) {
                extract($info);
                $users .= "<tr>
                <td>$i</td>
                <td>$clientid</td>
                <td>$description</td>
                <td>$id</td>
                <td>$approval_status</td>
                <td>$created_at</td>
                <td>";
                $html2 = "
        <div class='form-group margin-10'>" .
                        $comms . "
        </div>
        <div class='form-group margin-10'>" .
            $acc_dr . "
        </div>
        <div class='form-group margin-10'>" .
            $acc_cr . "
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control' id='email' placeholder='Quantity' name='quantity'/>
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control rate' placeholder='Rate' name='rate' readonly='readonly'/>
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control' id='email' placeholder='Adjust price (+ or -)' name='discount'/>
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control' id='email' name='invoice_id' value='".$id."' readonly='readonly'/>
        </div>
        <div class='form-group margin-10'>
            <input type='submit' class='btn btn-success' value='Save' name='newInvoiceItemBtn'/>
        </div>";
                $users .= "<button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-target='#myModal$id'>
                       Add Invoice Item
                   </button>";
                $url = action('Hello@inv_details',['id'=>$id]);
            $users .= '<a href="'.$url.'"> [Invoice Details]</a>';
                $users .="</td>
                <td class='green-font'><a href='index.php/welcome/edit_user/$id'><i class='fa fa-edit'></i></a></td>
                <td class='red-font'><a href='index.php/welcome/delete_user/$id'><i class='fa fa-trash'></i></a></td>
            </tr>";

                $modal_start = '<div id="myModal'.$id.'" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><font color="#5cb85c">Add Invoice Item</font></h4>
                </div>
                <div class="modal-body">';
                echo $modal_start;
        ?>
            {!! Form::open(array('action' => 'Hello@add_invoice_item','class'=>'form-inline')) !!}
        <?php
                echo $html2;
                echo "</form>";

                $modal_end        =   '</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>';
                echo $modal_end;
                $i++;
            }
            $users .="</tbody></table>";
            echo $users;
        }else{
                $html2 = "";
            }
        ?>
        </fieldset>
    </div>

    <?php

  $modal_start = '<div id="myModal'.$id.'" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Invoice Item</h4>
                </div>
                <div class="modal-body">';
            echo $modal_start;
    ?>
                    {!! Form::open(array('action' => 'Hello@save_invoice','class'=>'form-inline')) !!}
                    <?php echo $html2; ?>
                    {!! Form::close() !!}
            <?php
  $modal_end        =   '</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>';
                    echo $modal_end;
    ?>

@stop
