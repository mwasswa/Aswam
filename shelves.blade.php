@extends('default')

@section('content')
    <div class="col-lg-12 bpm-bottom">
        <fieldset>
            <legend><font color="green"><i class="fa fa-user-plus"></i>Register new shelf</font></legend>

            {!! Form::open(array('action'=>'Hello@save_new_shelf','class'=>'form-inline')) !!}
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="Shelf Name" name="name"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="section/Department" name="section"/>
            </div>
            <div class="form-group margin-10">
                <input type="text" class="form-control" id="email" placeholder="Description" name="description"/>
            </div>
            <div class="form-group margin-10">
                <select name='status' class='form-control'>
                    <option value=''>-Status-</option>
                    <option value='active'>Active</option>
                    <option value='inactive'>Inactive</option>
                </select>
            </div>
            <div class="margin-10 form-group">
                <input type="submit" class="btn btn-primary" value="Save" />
            </div>
            {!! Form::close() !!}
        </fieldset>
    </div>
    <div class="col-xs-12">
        <?php
        if(is_array($shelves) && count($shelves)){
            $users = '<table class="table table-responsive table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Section</th>
                <th>Description</th>
                <th>Date Created</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>';

            $i = 1;
            foreach ($shelves as $id => $info) {
                extract($info);
                $users .= "<tr>
                <td>$i</td>
                <td>$name</td>
                <td>$section</td>
                <td>$description</td>
                <td>$created_at</td>
                <td class='green-font'><a href='#'><i class='fa fa-edit'></i></a></td>
                <td class='red-font'><a href='#'><i class='fa fa-trash'></i></a></td>
            </tr>";
                $i++;
            }
            $users .="</tbody></table>";
            echo $users;
        }else{
            echo "<div>No Shelves Registered Yet</div>";
        }
        ?>
    </div>
@stop

