<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class RootCategory extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function middleCategories(){
        return $this->hasMany(MiddleCategory::class,'root_id','id');
    }
}
