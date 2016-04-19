<!DOCTYPE html>
<html>
<head>
    <link href="{{URL::to('styles/bootstrap.min.css')}}" type="text/css" rel="stylesheet" />
    <link href="{{URL::to('styles/style.css')}}" type="text/css" rel="stylesheet" />
    <link href="{{ URL::to('fa/css/font-awesome.min.css') }}" type="text/css" rel="stylesheet" />
</head>
<body class="">
<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6 col-md-offset-2 col-lg-offset-3">
    <div class="with-top-margin-100">
        <?php
        if(strlen($error_msg)){
           echo '<div class="alert alert-danger" role="alert">' . $error_msg . '</div>';
        }
        ?>

        <div class="row">
            <div class="col-xs-12">
                <font color="green"><h2><i class="fa fa-truck"></i> ASWAM</h2></font>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="wrapper">
                    <div class="row">
                        <div class="hidden-xs col-sm-5">
                            <img class="img-responsive" src="{{asset('images/logo.jpg')}}" height="300px;"/>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-xs-12">
                                {!! Form::open(['action'=>'Hello@login_form','class'=>'form-horizontal']) !!}

                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" placeholder="Username" name="username" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" placeholder="Password" name="password" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Login" name="login_btn" class="btn btn-primary"/>
                                        <span class="unlock"><i id='unlock' class="fa fa-unlock"></i></span>
                                    </div>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

