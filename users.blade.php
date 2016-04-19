@extends('default')

@section('content')
<?php
if(is_array($profiles)&& count($profiles)){
$roles = "<select name='profile' class='form-control'><option value=''>-Select Profile-</option>";
foreach($profiles as $k=>$val){
    extract($val);
    $roles .= "<option value=".$id.">$name</option>";
}
$roles .= "</select>";
}else{
    $roles = "<select name='profile' class='form-control'><option value=''>-No Profiles Registered-</option></select>";
}
?>

<div class="col-lg-12 bpm-bottom">
    <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i>Register Users</font></legend>

            {!! Form::open(array('action'=>'Hello@register_users','class'=>'form-inline')) !!}
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="First Name" name="fname"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="Last Name" name="lname"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="pwd" placeholder="Username" name="username"/>
            </div>
            <div class="form-group margin-10">
                <?php echo $roles; ?>
            </div>
            <div class="form-group margin-10">
                <input type="password" class="form-control" id="email" placeholder="Password" name="password"/>
            </div>
            <div class="form-group margin-10">
                <input type="password" class="form-control" id="email" placeholder="Confirm Password" name="cpsword"/>
            </div>
            <div class="margin-10 form-group">
                <input type="submit" class="btn btn-primary" value="Save" name="submit"/>
            </div>
        {!! Form::close() !!}
    </fieldset>
</div>

<div class="col-xs-12">
    <?php
    $users_arr = $users;
    //$data[$id][$username][$firstname][$role]= $lastname;
    if (is_array($users_arr) && count($users_arr)) {
    $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Username</th>
                <th>Profile</th>
                <th>Date Created</th>
                <th colspan="2">Actions</th>
                <!--<th><i class="fa fa-plus-circle"></i></th>-->
            </tr>
        </thead>
        <tbody>';

        $i = 1;
        foreach ($users_arr as $id => $info) {
            extract($info);
                        $users .= "<tr>
                <td>$i</td>
                <td>" . ucfirst($fname) . " " . ucfirst($lname) . "</td>
                <td>$username</td>
                <td>$profile</td>
                <td>$created_at</td>
                <td class='green-font'><a href='#'><i class='fa fa-edit'></i></a></td>
                <td class='red-font'><a href='#'><i class='fa fa-trash'></i></a></td>
            </tr>";
            $i++;
        }
        $users .="</tbody></table>";
        echo $users;
    }
    ?>
</div>
@stop