@extends('default')

@section('content')
<div class="col-xs-12 bpm-bottom">
    <fieldset>
        <legend><font color="green"><i class="fa fa-user-plus"></i>Create User Profile</font></legend>

        {!! Form::open(array('action'=>'Hello@create_user_profile')) !!}
        <div class="form-group margin-10">
            <input type="text" class="form-control" id="email" placeholder="Profile Name" name="name"/>
        </div>
        <!--
        <div class="form-group margin-10">
            <textarea class="form-control" id="comment" placeholder="Allowed Links - Comma seperated" name="allowed_paths"></textarea>
        </div>
        -->
        <div class="form-group margin-10">
            <?php
                if(is_array($privs)&& count($privs)){
                    unset($privs[0]);unset($privs[1]);unset($privs[31]);unset($privs[32]);
                    $privs = array_values($privs);
                    $option = "";
                    foreach($privs as $val){
                        $option .= "<div class='checkbox'><label><input type='checkbox' name='".$val."' value='1' /> $val</label></div>";
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
<div class="col-xs-12">
    <?php
    $users_arr = $profiles;
        //print_r($profiles);exit;
    if (is_array($users_arr) && count($users_arr)) {
        $profs = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Allowed Paths</th>
                <th>Date Created</th>
                <th colspan="2">Actions</th>
                <!--<th><i class="fa fa-plus-circle"></i></th>-->
            </tr>
        </thead>
        <tbody>';

        //echo $users;exit;

        $i = 1;
        foreach ($users_arr as $id => $info) {
            extract($info);
            $profs .= "<tr>
                <td>$i</td>
                <td>$profile_id</td>
                <td>$allowed_paths</td>
                <td>$created_at</td>
                <td class='green-font'><a href='#'><i class='fa fa-edit'></i></a></td>
                <td class='red-font'><a href='#'><i class='fa fa-trash'></i></a></td>
            </tr>";
            $i++;
        }
        $profs .="</tbody></table>";
        echo $profs;
    }
    ?>
</div>
@stop
