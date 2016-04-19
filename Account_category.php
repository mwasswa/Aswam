<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Account_category extends Model
{
    protected $fillable = [
        'name',
        'category',
        'description',
        'contact_person',
        'contact_phones',
        'status'
    ];
}
