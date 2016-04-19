@extends('default')

@section('content')
    <div class="col-xs-12 margin-10">
        <?php  $acc_cat_name = strtolower($acc_cat); $acc_cat = ucfirst($acc_cat)." Account";?>
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i> Register {{$acc_cat}}</font></legend>
            {!! Form::open(array('action' => 'Hello@register_client','class'=>'form-inline')) !!}
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="{{$acc_cat}} Name" name="name"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="{{$acc_cat}} Location" name="physical_address"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="{{$acc_cat}} Contact" name="contact_phones"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" value="{{$acc_cat_id}}" readonly="readonly" name="category_id"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" value="{{$acc_cat_name}}" readonly="readonly" name="category"/>
            </div>
            <div class="form-group margin-10">
                <select name="status" class="form-control">
                    <option value=""><b>-Select Status-</b></option>
                    <option value="1">Active</option>
                    <option value="0">Inactive</option>
                </select>
            </div>
            <div class="form-group margin-10">
                <input type="submit" class="btn btn-primary" value="Save" name="add_clients"/>
            </div>
            {!! Form::close() !!}
        </fieldset>
    </div>
    <script type="text/javascript">
    </script>
@stop
