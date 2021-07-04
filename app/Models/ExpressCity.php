<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class ExpressCity extends Model
{
    use HasFactory;
    protected $fillable = ['pid','name'];

    public function children(){
        return $this->hasMany(ExpressCity::class,'pid');
    }
    public function parent(){
        return $this->belongsTo(ExpressCity::class,'pid');
    }
}
