@extends('default')

@section('content')
    <?php extract($invoice_details_id);$inv_id = $id;?>
    <div class="col-xs-12 margin-10">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i> Invoice Details for Client: {{$clientid}} created on: {{$created_at}}</font></legend>
        </fieldset>
    </div>
    <div class="col-xs-12 margin-10">
        <?php
        $users_arr = $details;
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
            //print_r($invoice_details_id);exit;
        if (is_array($users_arr) && count($users_arr)) {
            $i = 1;
            $total = 0;
            foreach ($users_arr as $pos => $info) {
                extract($info);
                $rate = ($rate + $discount);
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
            $modal = '<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal">Record Payment</button>';

            $users .= "<tr><th colspan='5' style='text-align: right'>".$modal." "."TOTAL</th><th colspan='1' style='text-align: left'>".number_format($total)."</th></tr>";
            $users .="</tbody></table>";
            echo $users;
        }else{
            $total = 0;
        }
        ?>
    </div>

    <div class="col-xs-12 margin-10">
        <fieldset>
            <legend><font color="green"><i class="fa fa-list"></i> Payment Details</font></legend>
        <?php
        $paid = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Date Paid</th>
                <th>Journal Code</th>
                <th>Amount Paid</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>';
        if(is_array($payments) && count($payments)){
            $total_payment = 0; $i =1;
            foreach($payments as $ke=>$value){
                extract($value);
                    $total_payment += $amount_paid;
                $paid .= "<tr>
                <td>$i</td>
                <td>$created_at</td>
                <td>$journal_id</td>
                <td>".number_format($amount_paid)."</td>";
                $url = action('Hello@print_receipt',['id'=>$id]);
                $paid .="<td><a href='".$url."'>Print Receipt</a></td>
            </tr>";

                $i++;
                }
            $paid .= "<tr><th colspan='3'>TOTAL</th><td>".number_format($total_payment)."</td></tr>";
            $paid .="</tbody></table>";
            $balance = ($total - $total_payment);
            echo $paid;
        }else{
            $balance = $total;
        }


        ?>
        </fieldset>
    </div>

    <div class="col-xs-12 margin-10">
        <b>BALANCE: </b>{{number_format($balance)}}
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Record Payment for Invoice Number: {{$inv_id}}</h4>
                </div>
                <div class="modal-body">
                    {!! Form::open(array('action' => 'Hello@record_invoice_payment','class'=>'form-inline')) !!}
                    <div class="form-group margin-10">
                        <input type="text" class="form-control" id="email" placeholder="Amount Paid" name="amount_paid"/>
                    </div>
                    <div class="form-group margin-10">
                        <input type="text" class="form-control" id="email" placeholder="Currency" name="currency"/>
                    </div>
                    <div class="form-group margin-10">
                        <input type="text" class="form-control" id="email" value="{{$inv_id}}" name="invoice_no" readonly="readonly"/>
                    </div>
                    <div class="form-group margin-10">
                        <input type="text" class="form-control" id="email" value="{{number_format($total)}}" name="invoice_amount" readonly="readonly"/>
                    </div>
                    <div class="form-group margin-10">
                        <input type="submit" class="btn btn-success" value="Save" name="record_payment"/>
                    </div>
                    {!! Form::close() !!}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

@stop
