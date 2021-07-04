<?php
namespace App\Repositories;

use App\Models\MiddleCategory;

class MiddleCategoryRepository
{
    public function getMiddleCategoryWithLeave(){
        return MiddleCategory::with('leaveCategories')->get();
    }

    public function newMiddleCategory($data){
        $category = MiddleCategory::create($data);
        return $category;
    }

    public function updateMiddleCategory($data,$id){
        $category = MiddleCategory::findOrFail($id);
        $category->name = $data['name'];
        $category->root_id = $data['root_id'];
        $category->save();
        return $category;
    }

    public function deleteMiddleCategory($id){
        $category = MiddleCategory::findOrFail($id)->delete();
        return $category;
    }
}

