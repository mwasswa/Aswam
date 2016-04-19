@extends('default')

@section('content')
    <div class="col-lg-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Select Purchased Items</font></legend>

            {!! Form::open(array('action'=>'Hello@select_purchased_items')) !!}
            <div class="form-group margin-10">
                <?php
                if(is_array($products)&& count($products)){
                    $option = "";
                    foreach($products as $k=>$val){
                        extract($val);
                        $option .= "<div class='checkbox'><label><input type='checkbox' name='".$id."' value='".$name."' /> $name</label></div>";
                    }
                    echo $option;
                }
                ?>
            </div>
            <div class="margin-10 form-group">
                <input type="submit" class="btn btn-primary" value="Save" name="submit"/>
            </div>
            {!! Form::close() !!}
        </fieldset>
    </div>
@stop
