@extends('default')

@section('content')
    <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i> Add Product</font></legend>
        {!! Form::open(array('action' => 'Hello@register_product','class'=>'form-inline')) !!}
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="email" placeholder="Product Name" name="name"/>
        </div>
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="pwd" placeholder="Product Description" name="description"/>
        </div>
        <div class="form-group margin-10">
            <select name="status" class="form-control">
                <option value=""><b>-Select Status-</b></option>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>
        <div class="margin-10">
            <input type="submit" class="btn btn-primary" value="Save" name="add_product"/>
        </div>
        {!! Form::close() !!}
    </fieldset>

    <div class="col-xs-12">
        <?php
        $users_arr = $products;
        $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Description</th>
                <th>Date Created</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>';
        if (is_array($users_arr) && count($users_arr)) {
            $i = 1;
            foreach ($users_arr as $pos => $info) {
                extract($info);
                $url = action('Hello@cost_product',['id'=>$id]);
                $users .= "<tr>
                <td>$i</td>
                <td>$name <a href='".$url."'> [Costing]</a></td>
                <td>$description</td>
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
    </div>
@stop
