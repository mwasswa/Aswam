<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'description',
        'currency',
        'billing_method',
        'invoice_amount',
        'payment_status',
        'created_at',
        'updated_at',
        'approval_status',
        'clientid'
    ];
}
