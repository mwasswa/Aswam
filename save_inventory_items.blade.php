@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Allocate Profit Margin</font></legend><div class="col-xs-12">
            {!! Form::open(array('action'=>'Hello@save_price_floor','class'=>'form-inline')) !!}
            <?php
            $users_arr = $computed;
            if (is_array($users_arr) && count($users_arr)) {
                $users = '<table class="table table-responsive table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Batch Number</th>
                        <th>Costs</th>
                        <th>Margin</th>
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
                                    <td>$cost</td>
                                    <td><input type='text' name='".$batch_no."_".$cost."' class='form-control'/></td>
                               </tr>";
                    $i++;

                }
                $users .="<tr><input type='submit' name='submit' value='Submit' class='btn btn-primary'/></tr></tbody></table></form>";
                echo $users;
            }
            ?>

        </div></fieldset>
    </div>
@stop