@extends('default')

@section('content')
    <?php
    $comms = "<select name='pdt_code' class='form-control'>";

    foreach ($products as $key => $val) {
        extract($val);
        $comms .= "<option value='" .$id."-". strtolower($name) . "'>" . strtoupper($name) . "</option>";
    }
    $comms .= "</select>";

    $html = '<form class="form-inline" role="form" method="POST" enctype="multipart/form-data">
        <div class="form-group margin-10">' .
            $comms . '
        </div>
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="email" placeholder="Quantity" name="quantity"/>
        </div>
        <div class="form-group margin-10">
            <input type="submit" class="btn btn-primary" value="Save" name="transactionBtn"/>
        </div>
    </form>';


    ?>
    <div class="col-xs-12 margin-10">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i> Create Quotation</font></legend>
            {!! Form::open(array('action' => 'Hello@save_quotation','class'=>'form-inline')) !!}
            <div class="form-group margin-10">
                <?php
                $select = "<select name='clientid' class='form-control'><option value=''>-Select Client-</option>";
                foreach($clients as $k=>$val){
                    extract($val);
                    $select .= "<option value='$id'>".ucfirst($name)."</option>";
                }
                $select .= "</select>";
                echo $select;
                ?>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="Currency E.g. UGX, USD" name="currency"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="quotation Description" name="description"/>
            </div>
            <div class="form-group margin-10">
                <select name='approval_status' class='form-control'>
                    <option value=''>-Select Approval Status-</option>
                    <option value='approved'>Approved</option>
                    <option value='pending'>Pending</option>
                    <option value='rejected'>Rejected</option>
                    <option value='cancelled'>Cancelled</option>
                </select>
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

            $users_arr = $quotations;
            if (is_array($users_arr) && count($users_arr)) {
            $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Client</th>
                <th>Description</th>
                <th>quotation No</th>
                <th>Status</th>
                <th>Created</th>
                <th>Details</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>';
            $i = 1;
            foreach ($users_arr as $pos => $info) {
            extract($info);
            $users .= "<tr>
                <td>$i</td>
                <td>$clientid</td>
                <td>$description</td>
                <td>$id</td>
                <td>$approval_status</td>
                <td>$created_at</td>
                <td>";
            $html2 = "
        <div class='form-group margin-10'>" .
                    $comms . "
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control' id='email' placeholder='Quantity' name='quantity'/>
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control' id='email' placeholder='Rate' name='rate'/>
        </div>
        <div class='form-group margin-10'>
                <select name='unit_of_measure' class='form-control'>
                    <option value=''>-Unit of Measure-</option>
                    <option value='kg'>Kg</option>
                    <option value='litres'>Litres</option>
                    <option value='bars'>Bars</option>
                    <option value='other'>Other</option>
                </select>
        </div>
        <div class='form-group margin-10'>
            <input type='text' class='form-control' id='email' name='quotationid' value='".$id."' readonly='readonly'/>
        </div>
        <div class='form-group margin-10'>
            <input type='submit' class='btn btn-success' value='Save' name='newquotationItemBtn'/>
        </div>";
            $users .= "<button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-target='#myModal$id'>
                       Add Item
                   </button>";
            $url = action('Hello@quotation_details',['id'=>$id]);
            $users .= '<a href="'.$url.'"> [quotation Details]</a>';
            $users .="</td>
                <td class='green-font'><a href='index.php/welcome/edit_user/$id'><i class='fa fa-edit'></i></a></td>
                <td class='red-font'><a href='index.php/welcome/delete_user/$id'><i class='fa fa-trash'></i></a></td>
            </tr>";

            $modal_start = '<div id="myModal'.$id.'" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><font color="#5cb85c">Add quotation Item</font></h4>
                </div>
                <div class="modal-body">';
            echo $modal_start;
            ?>
            {!! Form::open(array('action' => 'Hello@add_quotation_item','class'=>'form-inline')) !!}
            <?php
            echo $html2;
            echo "</form>";

            $modal_end        =   '</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>';
            echo $modal_end;
            $i++;
            }
            $users .="</tbody></table>";
            echo $users;
            }else{
                $html2 = "";
            }
            ?>
        </fieldset>
    </div>

    <?php

    $modal_start = '<div id="myModal'.$id.'" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add quotation Item</h4>
                </div>
                <div class="modal-body">';
    echo $modal_start;
    ?>
    {!! Form::open(array('action' => 'Hello@save_quotation','class'=>'form-inline')) !!}
    <?php echo $html2; ?>
    {!! Form::close() !!}
    <?php
    $modal_end        =   '</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>';
    echo $modal_end;
    ?>

@stop

