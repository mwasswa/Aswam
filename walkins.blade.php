@extends('default')

@section('content')
    <div class="col-xs-12 margin-10">
    <table class="items-list table table-bordered table-stripped">
        <thead>
            <tr>
                <th>Barcode</th>
                <th>Item Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Amount</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox" value="1" name="barcode" class="form-control"/></td>
                <td><input type="text" name="name" class="form-control"/></td>
                <td><input type="text" name="price" class="form-control" readonly="readonly"/></td>
                <td><input type="text" name="qty" class="form-control"/></td>
                <td><input type="text" name="amount" class="form-control"/></td>
                <td><i class="fa fa-edit"></i></td>
                <td><input type="button" value="Remove" class="del-item" class="btn btn-primary"/></td>
            </tr>
        </tbody>
    </table>
        </div>
    <input type="button" value="Add Item" class="add-item" class="btn btn-primary"/>

@stop