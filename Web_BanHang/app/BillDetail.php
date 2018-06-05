<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BillDetail extends Model
{
    protected $table ="bill_detail";
    //1 chi tiết hóa đơn của 1 sản phẩm
    public function prouct(){
    	return $this->belongsTo('App/Product', 'id_product', 'id');
    }
    //1 chi tiết hóa đơn của 1 hóa đơn
    public function bill(){
    	return $this->belongsTo('App/Bill', 'id_bill', 'id');
    }
}
