@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Select items to be stocked</font></legend><div class="col-xs-12">
                {!! Form::open(array('action'=>'Hello@move_items_to_stock','class'=>'form-inline')) !!}
                <?php
                $users_arr = $items;
                if (is_array($users_arr) && count($users_arr)) {

                    $users = '<table class="table table-responsive table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Batch No</th>
                        <th>Unit</th>
                        <th>Purchased</th>
                        <th>Available</th>
                        <th>Size</th>
                        <th>Move</th>
                        <th>Required Units</th>
                        <th>Shelf No</th>
                    </tr>
                </thead>
                <tbody>';
                    $i = 1;

                    foreach ($users_arr as $pos => $info) {
                        extract($info);

                        if(is_array($shelves) && count($shelves)){
                            $shelf = "<select name='shelf_".$batch_no."' class='form-control'><option value=''>-SELECT SHELF-</option>";

                            foreach ($shelves as $key => $val) {
                                extract($val);
                                $shelf .= "<option value='$id'>" . strtoupper($name) . "</option>";
                            }
                            $shelf .= "</select>";
                        }else{
                            $acc_dr = "";
                        }

                        $users .= "<tr>
                                    <td>$i</td>
                                    <td>$name</td>
                                    <td>$batch_no</td>
                                    <td>$unit</td>
                                    <td>$qty_purchased</th>
                                    <td>$qty_in_store</th>
                                    <td>$size</td>
                                    <td><input type='checkbox' name='move_".$batch_no."' value='".$id."' /></td>
                                    <td><input type='text' name='units_".$batch_no."' class='form-control'/></td>
                                    <td>".$shelf."</td>
                               </tr>";
                        $i++;

                    }
                    $users .="</tbody></table>";

                    $users .="<div class='form-group margin-10'><input type='submit' name='submit' value='Submit' class='btn btn-primary'/></div>";
$users .="</form>";
                    echo $users;
                }
                ?>

            </div></fieldset>
    </div>
@stop