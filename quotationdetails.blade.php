@extends('default')

@section('content')
    <?php
        extract($quotation_details_id);$inv_id = $id;
    ?>
    <div class="col-xs-12 margin-10">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i> quotation Details for Client: {{$clientid}} created on: {{$created_at}}</font></legend>
        </fieldset>
    </div>
    <div class="col-xs-12">
        <table class="table">
            <tr>
                <td>
                    <h3>PL Hardware</h3><span><i>We help you build</i></span>
                </td>
                <td>
                    <h2>Quotation</h2><br/>
                    Date: {{$created_at}}<br/>
                    Quotation #: {{$id}}<br/>
                    Customer Name: {{$clientid}}<br/>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>Quotation For:</h3>
                    Name:{{$clientid}}<br/>
                    Company:{{$clientid}}<br/>
                    Address:<br/>
                    City, State, Zip:<br/>
                    Phone:<br/>
                </td>
                <td>
                    <h3>Quotation Valid until: {{$created_at}}</h3></br>
                    Prepared by: {{ Session::get('username') }}
                </td>
            </tr>
        </table>
    </div>
    <div class="col-xs-12 margin-10">
        <?php
        $users_arr = $details;
        if (is_array($users_arr) && count($users_arr)) {
            $users = '<table class="table table-responsive table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Product Code</th>
                    <th>Unit of measure</th>
                    <th>Quantity</th>
                    <th>Rate</th>
                    <th>Amount</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>';
            //print_r($quotation_details_id);exit;

                $i = 1;
                $total = 0;
                foreach ($users_arr as $pos => $info) {
                    extract($info);
                    $amount = ($rate * $quantity);
                    $total += $amount;
                    $users .= "<tr>
                    <td>$i</td>
                    <td>$pdt_code</td>
                    <td>$unit_of_measure</td>
                    <td>$quantity</td>
                    <td>$rate</td>
                    <td>".number_format($amount)."</td>
                    <td class='green-font'><a href='index.php/welcome/edit_user/$id'><i class='fa fa-edit'></i></a></td>
                    <td class='red-font'><a href='index.php/welcome/delete_user/$id'><i class='fa fa-trash'></i></a></td>
                </tr>";

                    $i++;
                }
                $url = action('Hello@test_pdf',['id'=>$inv_id]);
                $users .= "<tr><th colspan='5' style='text-align:right;' >TOTAL</th><th>".number_format($total)."</th><td colspan='2'><a href='".$url."'>Print Quotation</a></td></tr>";
                $users .="</tbody></table>";
                echo $users;
        }
        ?>
    </div>


@stop
