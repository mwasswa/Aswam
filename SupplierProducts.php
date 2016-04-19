<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SupplierProducts extends Model
{
    protected $fillable = ['supplierid','productid'];
}
