<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Schema;

class Privillege extends Model
{
    protected $fillable = ['profile_id','all_routes','acc_categories',
        'hello','accounts','author','contact','products',
        'register_product','suppliers','clients','invoices','save_invoice','supplier_products','register_supplier',
        'register_client','assign_supplier_products','add_invoice_item','account_category_enteries','inv_details',
        'proceed_account_entries','record_income','record_income_save','record_invoice_payment','print_receipt',
        'login_form','logout','users','register_users','create_user_profile','user_profiles','created_at','updated_at'
    ];

    public function getColumnListing($table_name){
        $columns = Schema::getColumnListing($table_name);
        return $columns;

    }
}
