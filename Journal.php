<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Journal extends Model
{
    protected $fillable = ['account_dr','account_cr','currency','amount','journal_type','description','invoice_id','po_id'];
}
