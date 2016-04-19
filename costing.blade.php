@extends('default')

@section('content')

    <?php $pname = $pdetails['name'];?>
    <div class="col-xs-12 margin-10">
    <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i>Cost Item - code #{{$pid}}</font></legend>
        {!! Form::open(array('action' => 'Hello@save_product_cost','class'=>'form-inline')) !!}
        <div class="form-group margin-10">
            <input type="text" class="form-control" value="{{$pid}}" placeholder="Product Name" name="pid" readonly="readonly"/>
        </div>
        <div class="form-group margin-10">
            <input type="text" class="form-control" value="{{$pname}}" placeholder="Product Name" name="pname" readonly="readonly"/>
        </div>

        <div class="form-group margin-10">
            <input type="text" class="form-control" placeholder="Purchase Price" name="purchase_price"/>
        </div>

        <?php
            $parameters = "";
        if(is_array($params) && count($params)){
            foreach($params as $k=>$val){
                extract($val);
                $parameters .= '<div class="form-group margin-10">
                                     <input type="text" id="rg-from" name="'.strtolower($name).'" class="form-control" placeholder="'.$name.'">
                                </div>';
            }

            echo $parameters;
        }
        ?>

        <div class="form-group margin-10">
            <select name="status" class="form-control">
                <option value=""><b>-Select Status-</b></option>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>
        <div class="form-group margin-10">
            <input type="submit" class="btn btn-primary" value="Save" name="add_cost"/>
        </div>
        {!! Form::close() !!}
    </fieldset>
</div>
    <div class="col-xs-12">
        <?php
        $users_arr = $costing;
        $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Product</th>
                <th>Cost Details</th>
                <th>Final Price</th>
                <th>Date Created</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>';
        if (is_array($users_arr) && count($users_arr)) {
            $i = 1;
            foreach ($users_arr as $pos => $info) {
                extract($info);
                $users .= "<tr>
                <td>$i</td>
                <td>$pname</td>
                <td>$pdetails</td>
                <td>".number_format($price)."</td>
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
