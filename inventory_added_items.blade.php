@extends('default')

@section('content')
    <div class="col-lg-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Newly Added Inventory Items</font></legend>

            <?php
                $users_arr = $new_items;
            $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Code</th>
                <th>Name</th>
                <th>Purchase Date</th>
                <th>Unit</th>
                <th>Size</th>
                <th>Quantity Purchased</th>
                <th>Expiry Date</th>
            </tr>
        </thead>
        <tbody>';
            $i = 1;
            foreach ($users_arr as $pos => $info) {
                extract($info);
                $users .= "<tr>
                <td>$i</td>
                <td>$pdt_code</td>
                <td>$name</td>
                <td>$purchase_date</td>
                <td>$unit</td>
                <td>$size</td>
                <td>$qty_purchased</td>
                <td>$expiry_date</td>
            </tr>";
                $i++;
            }
            $users .="</tbody></table>";
            echo $users;
            ?>
        </fieldset>
    </div>
@stop
