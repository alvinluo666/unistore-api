<?php
namespace App\Repositories;

use App\Models\RootCategory;


class RootCategoryRepository {

    public function getRootCategoryWithMiddleAndLeave(){
        return RootCategory::with('middleCategories')->get();
    }

    public function newRootCategory($data){
        $category = RootCategory::create($data);
        return $category;
    }

    public function updateRootCategory($data,$id){
        $category = RootCategory::findOrFail($id);
        $category->name = $data['name'];
        $category->save();
        return $category;
    }

    public function deleteRootCategory($id){
        $category = RootCategory::findOrFail($id)->delete();
        return $category;
    }
}