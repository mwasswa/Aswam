@extends('default')

@section('content')
    <div class="col-xs-12 margin-10">
    <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i> Add Supplier</font></legend>
        {!! Form::open(array('action' => 'Hello@register_supplier','class'=>'form-inline')) !!}
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="email" placeholder="Supplier Name" name="name"/>
        </div>
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="pwd" placeholder="Supplier Location" name="location"/>
        </div>
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="pwd" placeholder="Supplier Contact" name="contact"/>
        </div>
        <div class="form-group margin-10">
            <?php
            $select = "<select name='accountid' class='form-control'><option value=''>-Select Account-</option>";
            foreach($accounts as $k=>$val){
                extract($val);
                $select .= "<option value='$id'>".ucfirst($name)."</option>";
            }
            $select .= "</select>";
            echo $select;
            ?>
        </div>
        <div class="form-group margin-10">
            <select name="status" class="form-control">
                <option value=""><b>-Select Status-</b></option>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>
        <div class="form-group margin-10">
            <input type="submit" class="btn btn-primary" value="Save" name="add_suppliers"/>
        </div>
        {!! Form::close() !!}
    </fieldset>
        </div>

    <div class="col-xs-12">
        <fieldset>
            <legend></legend>
        <?php
        $users_arr = $suppliers;
        if (is_array($users_arr) && count($users_arr)) {
            $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
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
                <td>$location</td>
                <td>$contact</td>
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
