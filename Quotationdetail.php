<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quotationdetail extends Model
{
    protected $fillable = ['quotationid','unit_of_measure','quantity','rate','pdt_code'];
}
