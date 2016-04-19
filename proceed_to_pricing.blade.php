@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Select Costing Group</font></legend>
            {!! Form::open(array('action'=>'Hello@cost_inventory_items','class'=>'form-inline')) !!}
            <?php
            if(is_array($cgroups) && count($cgroups)){
                $acc_dr = "<div class='form-group'><select name='cgid' class='form-control'><option value=''>-SELECT COST GROUP-</option>";

                foreach ($cgroups as $key => $val) {
                    extract($val);
                    $acc_dr .= "<option value='$id'>" . strtoupper($name) . "</option>";
                }
                $acc_dr .= "</select></div>";
            }else{
                $acc_dr = "";
            }
                echo $acc_dr;
            ?>
            <div class='form-group'><input type='submit' name='submit' class='btn btn-primary' value='Proceed' class="form-control"/></div>
        </fieldset>
    </div>
@stop