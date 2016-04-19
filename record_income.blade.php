@extends('default')

@section('content')
    <div class="col-xs-12 margin-10">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i> Record Income</font></legend>
            {!! Form::open(array('action' => 'Hello@record_income_save','class'=>'form-inline')) !!}
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="Customer Name" name="name"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="Invoice Number" name="invoice_no"/>
            </div>
            <div class="form-group margin-10">
                <input type="submit" class="btn btn-primary" value="Search" name="record_income"/>
            </div>
            {!! Form::close() !!}
        </fieldset>
    </div>

    <div class="col-xs-12">
        <fieldset>
            <legend></legend>
            <?php
            if (is_array($invoices) && count($invoices)) {
                //print_r($invoices);
                $users_arr = $invoices;
                if (is_array($users_arr) && count($users_arr)) {
                    $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Client</th>
                <th>Description</th>
                <th>Invoice Amount</th>
                <th>Approval Status</th>
                <th>Date Created</th>
                <th>Invoice Details</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>';
                    $i = 1;
                    foreach ($users_arr as $pos => $info) {
                        extract($info);
                        $users .= "<tr>
                <td>$i</td>
                <td>$clientid</td>
                <td>$description</td>
                <td>".number_format($invoice_amount)." ".$currency."</td>
                <td>$approval_status</td>
                <td>$created_at</td><td></td>";
                        $url = action('Hello@inv_details',['id'=>$id]);
                    $users .=   "<td><a href='".$url."'>Record Payment</a></td>
                </tr>";
                        }
                    $users .= "</tbody></table>";
                    echo $users;
            }
                }
            ?>
        </fieldset>
    </div>
@stop
