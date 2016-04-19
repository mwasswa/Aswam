<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
   protected $fillable = [
                'name',
                'category',
                'category_id',
                'description',
                'contact_person',
                'contact_phones',
                'physical_address',
                'status'
   ];

    //public $timestamps = false;
}
