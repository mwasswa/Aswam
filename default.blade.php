<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ASWAM</title>
    <script type="text/javascript" src="{{URL::to('js/date.js')}}"></script>
    <link href="{{URL::to('js/jquery-ui/jquery-ui.min.css')}}" type="text/css" rel="stylesheet" />
    <link href="{{URL::to('styles/bootstrap.min.css')}}" type="text/css" rel="stylesheet" />
    <link href="{{URL::to('styles/lightness_jquery-ui.css')}}" type="text/css" rel="stylesheet" />
    <link href="{{URL::to('styles/style.css')}}" type="text/css" rel="stylesheet" />
    <link href="{{ URL::to('fa/css/font-awesome.min.css') }}" type="text/css" rel="stylesheet" />


    <script type="text/javascript" src="{{URL::to('js/CollapsibleLists.js')}}"></script>
    <script type="text/javascript" src="{{URL::to('js/jquery.js')}}"></script>
    <script type="text/javascript" src="{{URL::to('js/jquery-live-search.js')}}"></script>
    <script type="text/javascript" src="{{URL::to('js/typehead.js')}}"></script>
    <script type="text/javascript" src="{{URL::to('js/bootstrap.min.js')}}"></script>

    <script type="text/javascript" src="{{URL::to('js/jquery-ui.js')}}"></script>

    <script type="text/javascript" src="{{URL::to('js/javascript.js')}}"></script>
    <script type="text/javascript" src="{{URL::to('js/jquery-table-addrow.js')}}"></script>


    <script>
        $(function () {
            $("#accordion-2").accordion({
                collapsible: true
            });

        });
        function loadSelectedForm(x){
            var htmlform = '<fieldset>'+
                    '<legend><font color="green"><i class="fa fa-user-plus"></i>Register'+ x + ' </font></legend>'+
                    '{!! Form::open(array("action" => "Hello@register_client","class"=>"form-inline")) !!}
            <div class="form-group margin-10">'+
                    '<input type="text" class="form-control" id="email" placeholder="Client Name" name="name"/>'+
                    '</div><div class="form-group margin-10"><input type="text" class="form-control" id="pwd" placeholder="Client Location" name="location"/>'+
                    '</div> <div class="form-group margin-10">'+
                    '<input type="text" class="form-control" id="pwd" placeholder="Client Contact" name="contact"/></div>'+

                    '<div class="form-group margin-10"><select name="category" class="form-control">'+
                    '<option value=""><b>-Select Category-</b></option><option value="acc_holder">Account Holder</option>'+
                    '<option value="one_off">One Off</option>'+'</select></div><div class="form-group margin-10">'+
                    '<select name="status" class="form-control"><option value=""><b>-Select Status-</b></option><option value="1">Active</option>'+
                    '<option value="0">Inactive</option></select></div><div class="form-group margin-10">'+
                    '<input type="submit" class="btn btn-primary" value="Save" name="add_clients"/>'+'</div>{!! Form::close() !!}</fieldset>';
            document.getElementById("forms").text(htmlform);
        }

    </script>
    <style type="text/css">
        body{
            margin: 0px;
        }
        b{
            font-size: 20px;
        }
    </style>
</head>
<body>
<header class="col-xs-12 navbar-header navbar-fixed-top navbar-inverse">
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <button id="left-menu" style="margin-top: 7px;" class="hidden-lg hidden-md hidden-sm btn btn-primary pull-left">
                <i class="fa fa-th-list"></i>
            </button>
            <button type="button" class="navbar-toggle collapsed pull-right" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">
                <i class="fa fa-truck hidden-xs"></i> <b>ASWAM</b>
            </div>
        </div>
        <div class="col-xs-12 col-sm-9">
            <div class="navbar-header">

            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transact <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <?php
                            $paths = Session::get('allowed_paths');
                            if(in_array('walkins',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('walkins');
                                echo "<li><a href='".$url."'>Walk-Ins</a></li>";
                            }
                            if(in_array('invoices',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('invoices');
                                echo "<li><a href='".$url."'>Generate Invoice</a></li>";
                            }
                            if(in_array('quotation',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('quotation');
                                echo "<li><a href='".$url."'>Generate Quotation</a></li>";
                            }
                            if(in_array('record_income',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('record_income');
                                echo "<li><a href='".$url."'>Record Income</a></li>";
                            }
                            if(in_array('creditnotes',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('creditnotes');
                                echo "<li><a href='".$url."'>Generate Invoice</a></li>";
                            }
                            ?>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Expenditure <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <li>

                                <a href="{{ URL::to('invoices')}}">Generate PO</a>
                            </li>
                            <li>
                                <a href="{{ URL::to('incomes')}}">Record Expenses</a>
                            </li>
                            <li>
                                <a href="{{ URL::to('creditnotes')}}">Generate Debit Note</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="index.php/welcome/theory">
                            Transactions</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Inventory <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <?php
                            $paths = Session::get('allowed_paths');
                            if(in_array('products',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('products');
                                echo "<li><a href='".$url."'>Products</a></li>";
                            }
                            if(in_array('stock',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('inventory_to_stock');
                                echo "<li><a href='".$url."'>Inventory Into Stock</a></li>";
                            }
                                if(in_array('supplier_products',$paths)||in_array('all_routes',$paths)){
                                    $url = URL::to('supplier_products');
                                    echo "<li><a href='".$url."'>Assign Supplier Products</a></li>";
                                }

                            if(in_array('costing_parameters',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('costing_parameters');
                                echo "<li><a href='".$url."'>Costing Parameters</a></li>";
                            }

                            if(in_array('inventory',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('inventory');
                                echo "<li><a href='".$url."'>Add Inventory Items</a></li>";
                            }
                            if(in_array('proceed_to_pricing',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('proceed_to_pricing');
                                echo "<li><a href='".$url."'>Cost Inventory Items</a></li>";
                            }
                                ?>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Users <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <?php
                            $paths = Session::get('allowed_paths');
                            if(in_array('users',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('users');
                                echo "<li><a href='".$url."'>Manage Users</a></li>";
                            }
                            if(in_array('user_profiles',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('user_profiles');
                                echo "<li><a href='".$url."'>User Roles</a></li>";
                            }
                            ?>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Stock <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <?php
                            $paths = Session::get('allowed_paths');
                            if(in_array('stock',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('stock');
                                echo "<li><a href='".$url."'>List Stock</a></li>";
                            }
                            if(in_array('shelves',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('shelves');
                                echo "<li><a href='".$url."'>Manage Shelves</a></li>";
                            }
                            ?>
                        </ul>
                    </li>



                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <?php
                            $paths = Session::get('allowed_paths');
                            if(in_array('acc_categories',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('acc_categories');
                                echo "<li><a href='".$url."'>Categories</a></li>";
                            }
                            if(in_array('account_category_enteries',$paths)||in_array('all_routes',$paths)){
                                $url = URL::to('account_category_enteries');
                                echo "<li><a href='".$url."'>Category Entries</a></li>";
                            }
                            ?>
                        </ul>
                    </li>
                    <!--
                    <li>
                        <a href="{{ URL::to('clients') }}">Clients</a>
                    </li>
                    -->
                    <li>
                        <button class="btn btn-primary btn-xs dropdown-toggle" type="button" id="dropdownMenu1"
                                data-toggle="dropdown" aria-expanded="true">
                            <span><?php echo "Username"; ?></span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><i class="fa fa-user"></i><span><a role="menuitem" tabindex="-1" href='index.php/welcome/change_password'> My Profile</a></span></li>
                            <li role="presentation"><i class="fa fa-power-off"></i><span><a role="menuitem" tabindex="-1" href= "{{ URL::to('logout') }}"> Logout</a></span></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</header>

<div class="col-xs-12">
    <div class="row">

        <div class="col-xs-12 col-sm-3 col-md-2" id="sidebar">
            <div class="content-wrapper" id="">
                <?php

                $videos = array(
                    "Finance" => array(
                        "Invoices" => array(
                                "Test" => array(
                                    "TestItem" => "TestItems"
                                )
                        )
                    ),
                    "Procurement" => array(
                        "Invoices" => array(
                                "Test" => array(
                                    "TestItem" => "TestItems"
                                 )
                        )
                    ),
                    "Legal" => array(
                        "Invoices" => array(
                            "Test" => array(
                                "TestItem" => "TestItems"
                            )
                        )
                    )
                );
                foreach ($videos as $subject => $info) {
                $menu = '<h3>' . strtoupper($subject) . '</h3><div>';
                foreach ($info as $topic => $info2) {
                $menu .= '<ul class="collapsibleList"><li>' . ucfirst($topic) . '<ul>';
                foreach ($info2 as $id => $info3) {
                foreach ($info3 as $desc => $path) {
                $subject = strtolower($subject);
                $video = array("video_selected_" . "$id" => TRUE, "vpath_$id" => $path, "vsub_$id" => $subject, "vdesc_$id" => $desc);
                //$this->session->set_userdata($video);
                $menu .="<li><a href='index.php/welcome/user_login/$id'>" . $path . '</a></li>';
                }
                }
                $menu .= '</ul></li></ul>';
                }
                $menu .='</div>';
                echo $menu;
                }
                ?>
            </div>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-10 content-wrapper">
            <div class="panel panel-primary">
                <div class="panel panel-heading">
                    <h3 class="panel-title">Selected Content</h3>
                </div>
                <div class="panel-body">
                    @yield('content')
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer col-xs-12">
    <p>&copy;<?php echo date('Y'); ?> | <a href="#">Moses Wasswa inc.</a>| <a href="#">Terms & Conditions</a> | Page rendered in seconds</p>
</div>
</body>
<script type="text/javascript" src="{{ URL::asset('js/javascript.js') }}"></script>
<script>
    $(function () {
        //$("#sidebar").hide();
        $("#left-menu").click(function () {
            $("#sidebar").slideToggle('fast');
        });

        $("#sidebar h3").click(function () {
            $("#sidebar > div > div").slideUp();
            $("+ div", this).slideToggle();
        });

        $('#datetimepicker1').datetimepicker();

        $("#selectedAccount").change(function(){
            alert("This is test text");
        });

    });

    $("input:checkbox").on('click', function () {
        // in the handler, 'this' refers to the box clicked on
        var $box = $(this);
        if ($box.is(":checked")) {
            // the name of the box is retrieved using the .attr() method
            // as it is assumed and expected to be immutable
            var group = "input:checkbox[name='" + $box.attr("name") + "']";
            // the checked state of the group/box on the other hand will change
            // and the current value is retrieved using .prop() method
            $(group).prop("checked", false);
            $box.prop("checked", true);
        } else {
            $box.prop("checked", false);
        }
    });



</script>

</html>