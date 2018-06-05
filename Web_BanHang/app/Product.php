<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table ="products";
    //1 sản phẩm thuộc 1 loại sản phẩm
    public function product_type(){
    	return $this->belongsTo('App/ProductType', 'id_type', 'id');
    }
    //1 sản phẩm có nhiều chi tiết hóa đơn
    public function bill_detail(){
    	return $this->hasMany('App/BillDetail', 'id_product', 'id');
    }
}