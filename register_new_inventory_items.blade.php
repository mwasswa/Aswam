@extends('default')

@section('content')
    <div class="col-xs-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Register Inventory Items</font></legend>
            {!! Form::open(array('action'=>'Hello@save_items_inventory')) !!}
            <?php
            //print_r($cgroups);exit;
                if(is_array($cgroups) && count($cgroups)){
                    $acc_dr = "<select name='cgname_selected' class='form-control'><option value=''>-ADD TO EXISTING GROUP-</option>";

                    foreach ($cgroups as $key => $val) {
                        extract($val);
                        $acc_dr .= "<option value='$id'>" . strtoupper($name) . "</option>";
                    }
                    $acc_dr .= "</select>";
                }else{
                    $acc_dr = "";
                }
            $table = "<div class='col-xs-12 margin-10'><div class='col-xs-6'>EITHER <input type='text' name='cgname' class='form-control' placeholder='Enter Cost Group Name or Description'/></div>  <div class='col-xs-6'>OR ".$acc_dr."</div></div>";
            $table .= '<div class="col-xs-12"><table class="table table-responsive table-bordered table-striped"><tr>';
            $table .= "<th>Product</th><th>Purchase Date</th><th>Quantity</th><th>Expiry Date</th></tr>";
            foreach($prods as $k=>$va){
                $table .= "<tr><th>$va</th>";

                $table .= "<td><input type='text' name='purchase_date-".$k."' class='form-control'/></td>
                            <td><input type='text' name='qty_purchased-".$k."'  class='form-control'/></td>
                            <td><input type='text' name='expiry_date-".$k."'  class='form-control'/></td>";
                $table .= "</tr>";
            }

            $table .= "<tr><td><input type='submit' name='submit' class='btn btn-primary' value='Save'/></td></tr></table></div></form>";

            echo $table;

            ?>

        </fieldset>
    </div>
@stop