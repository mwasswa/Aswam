@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-list"></i>Available Stock</font></legend><div class="col-xs-12">
                <?php
                $users_arr = $stock;
                if (is_array($users_arr) && count($users_arr)) {

                    $users = '<table class="table table-responsive table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Batch No</th>
                        <th>Expiry</th>
                        <th>Unit</th>
                        <th>Size</th>
                        <th>Purchased</th>
                        <th>In Stock</th>
                        <th>Sold</th>
                        <th>Shelf</th>
                    </tr>
                </thead>
                <tbody>';
                    $i = 1;

                    foreach ($users_arr as $pos => $info) {
                        extract($info);
                        $users .= "<tr>
                                    <td>$i</td>
                                    <td>$name</td>
                                    <td>$item_code</td>
                                    <td>$batch_no</td>
                                    <td>$expiry</td>
                                    <td>$unit</td>
                                    <td>$size</td>
                                    <td>$purchased</td>
                                    <td>$qty_in_stock</th>
                                    <td>$qty_sold</td>
                                    <td>$shelf_no</td>
                               </tr>";
                        $i++;

                    }
                    $users .="</tbody></table>";
                    echo $users;
                }
                ?>

            </div></fieldset>
    </div>
@stop