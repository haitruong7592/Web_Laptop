<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table ="customer";
    //1 khách hàng có nhiều hóa đơn
    public function bill(){
    	return $this->hasMany('App/Bill', 'id_customer', 'id');
    }
}
