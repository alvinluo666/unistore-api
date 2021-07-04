<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MiddleCategory extends Model
{
    use HasFactory;

    protected $fillable = ['name','root_id'];
    
    protected $with = ['leaveCategories'];

    public function leaveCategories(){
        return $this->hasMany(LeaveCategory::class,'middle_id','id');
    }
}
