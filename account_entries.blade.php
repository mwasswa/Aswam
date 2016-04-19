@extends('default')

@section('content')
    <div class="col-xs-12 margin-10">
        <fieldset>
            {!! Form::open(array("action" => "Hello@proceed_account_entries","class"=>"form-inline")) !!}
            <div class="form-group margin-10">
                <?php
                    //print_r($accounts);exit;
                $select = '<select name="account_cat_id" class="form-control" id="selectedAccount"><option value="">-Select Account-</option>';
                foreach($accounts as $k=>$val){
                    extract($val);
                    $select .= "<option value='".strtolower($name)."-".$id."'>".ucfirst($name)."</option>";
                }
                $select .= "</select>";
                echo $select;
                ?>
            </div>
            <div class="form-group margin-10">
                <input type="submit" class="btn btn-success" value="Proceed" name="add_content"/>
            </div>
            {!! Form::close() !!}
        </fieldset>
    </div>

    <div class="col-xs-12">
        <fieldset>
            <legend></legend>
            <?php
            $users_arr = $entries;
            if (is_array($users_arr) && count($users_arr)) {
                $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Account Name</th>
                <th>Account Category</th>
                <th>Location</th>
                <th>Contact</th>
                <th>Date Created</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>';
                $i = 1;
                foreach ($users_arr as $pos => $info) {
                    extract($info);
                    $users .= "<tr>
                <td>$i</td>
                <td>$name</td>
                <td>$category_id</td>
                <td>$physical_address</td>
                <td>$contact_phones</td>
                <td>$created_at</td>
                <td class='green-font'><a href='index.php/welcome/edit_user/$id'><i class='fa fa-edit'></i></a></td>
                <td class='red-font'><a href='index.php/welcome/delete_user/$id'><i class='fa fa-trash'></i></a></td>
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