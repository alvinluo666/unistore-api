<?php
namespace App\Repositories;

use App\Models\LeaveCategory;

class LeaveCategoryRepository
{
    public function getLeaveCategory(){
        return LeaveCategory::all();
    }

    public function newLeaveCategory($data){
        $category = LeaveCategory::create($data);
        return $category;
    }

    public function updateLeaveCategory($data,$id){
        $category = LeaveCategory::findOrFail($id);
        $category->name = $data['name'];
        $category->image = $data['image'];
        $category->middle_id = $data['middle_id'];
        $category->save();
        return $category;
    }

    public function deleteLeaveCategory($id){
        $category = LeaveCategory::findOrFail($id)->delete();
        return $category;
    }
}

