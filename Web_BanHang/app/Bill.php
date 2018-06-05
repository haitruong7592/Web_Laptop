<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    protected $table ="bills";
    //1 hóa đơn có nhiều chi tiets hóa đơn
    public function bill_detail(){
    	return $this->hasMany('App/BillDetail', 'id_bill', 'id');
    }
    //1 hóa đơn của 1 khách hàng
    public function customer(){
    	return $this->belongsTo('App/Customer', 'id_customer', 'id');
    }
}
