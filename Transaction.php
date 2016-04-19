<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = ['trans_type','trans_type_id','description','amount_paid','status','journal_id','deleted'];
}
