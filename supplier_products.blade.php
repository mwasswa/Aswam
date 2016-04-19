@extends('default')

@section('content')
    <div class="col-xs-12 margin-10">
        <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i> Assign Products to Supplier</font></legend>
        {!! Form::open(array('action' => 'Hello@assign_supplier_products','class'=>'form-inline')) !!}
        <div class="form-group margin-10">
            <?php
                $select = "<select name='supplierid' class='form-control'><option value=''>-Select Supplier-</option>";
                foreach($suppliers as $k=>$val){
                    extract($val);
                    $select .= "<option value='$id'>".ucfirst($name)."</option>";
                }
                $select .= "</select>";
                echo $select;
            ?>
        </div>
        <div class="form-group margin-10">
            <?php
            $select = "<select name='productid' class='form-control'><option value=''>-Select Product-</option>";
            foreach($products as $k=>$val){
                extract($val);
                $select .= "<option value='$id'>".ucfirst($name)."</option>";
            }
            $select .= "</select>";
            echo $select;
            ?>
        </div>
        <div class="form-group margin-10">
            <input type="submit" class="btn btn-primary" value="Save" name="add_suppliers"/>
        </div>
        {!! Form::close() !!}
    </fieldset>
        </diV>

    <div class="col-xs-12">
        <fieldset>
            <legend></legend>
        <?php
        $users_arr = $supplier_products;
        if (is_array($users_arr) && count($users_arr)) {
            $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Supplier</th>
                <th>Product</th>
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
                <td>$supplierid</td>
                <td>$productid</td>
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
