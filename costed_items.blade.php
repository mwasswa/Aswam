@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Computed Prices</font></legend>
            <?php
            $users_arr = $pdts;
            if (is_array($users_arr) && count($users_arr)) {
                $users = '<table class="table table-responsive table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Batch Number</th>
                        <th>Costs</th>
                        <th>Margin</th>
                        <th>Price Floor</th>
                    </tr>
                </thead>
                <tbody>';
                $i = 1;
                foreach ($users_arr as $pos => $info) {
                    extract($info);
                    $users .= "<tr>
                                    <td>$i</td>
                                    <td>$item_code</td>
                                    <td>$batch_no</td>
                                    <td>$cost</td>
                                    <td>$margin</td>
                                    <td>$floor</td>
                               </tr>";
                    $i++;

                }
                $users .="</tbody></table>";
                echo $users;
            }
            ?>

        </fieldset>
    </div>
@stop