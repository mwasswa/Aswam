<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice_detail extends Model
{
    protected $fillable = ['pdt_code','unit_of_measure','quantity','rate','discount','created_at','updated_at','invoiceid'];
}
