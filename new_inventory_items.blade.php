@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
    <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i>Evaluate Selling Price</font></legend>
    {!! Form::open(array('action'=>'Hello@determine_selling_price')) !!}
<?php
        //print_r($params);print_r($prods);exit;
$table = '<table class="table table-responsive table-bordered table-striped"><tr><th></th>';
    foreach($params as $k=>$val){
        extract($val);
        $table .= "<th>$name <input type='text' name='".$name."' class='form-control' placeholder='Total Amount'/></th>";
    }
    $table .= "<th>Cost</th><th>Others</th></tr>";
    foreach($prods as $bno=>$info){
        $i = (count($params[0]));
        foreach($info as $pcode => $name){
        $table .= "<tr><th>$name [$bno]</th>";
        for ($c = 1; $c<$i; $c++){
            $table .= "<td><input type='text' name='".$bno."_".$c."' placeholder='Percentage' class='form-control'/></td>";
        }
        $table .= "<td><input type='text' name='costprice"."_".$bno."' placeholder='Cost Price' class='form-control'/></td>";
        $table .= "<td><input type='text' name='others"."_".$bno."' placeholder='Miscellaneous' class='form-control'/></td>";
        $table .= "</tr>";
            }
    }

        $table .= "<tr><td><input type='submit' name='submit' class='btn btn-primary' value='Compute'/></td></tr></table></form>";

        echo $table;

?>

    </fieldset>
    </div>
@stop