<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quotation extends Model
{
    protected $fillable = ['clientid','currency','description','approval_status'];
}
