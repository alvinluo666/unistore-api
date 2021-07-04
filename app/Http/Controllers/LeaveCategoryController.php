<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\LeaveCategoryRepository;

class LeaveCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $repo;

    public function __construct(LeaveCategoryRepository $repo){
        $this->repo = $repo;
    }

    public function index()
    {
        $categories = $this->repo->getLeaveCategory();

        return response()->json(['body'=>$categories],200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name'=>'required|max:6',
            'middle_id'=>"required|exists:middle_categories,id",
            'image'=>"required"
        ]);
        $category = $this->repo->newLeaveCategory($data);
        return response()->json(['body'=>$category],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'name'=>'required|max:6',
            'middle_id'=>"required|exists:middle_categories,id",
            'image'=>"required"
        ]);
        $category = $this->repo->updateLeaveCategory($data,$id);
        return response()->json(['body'=>$category],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = $this->repo->deleteLeaveCategory($id);
        return response()->json(['body'=>$category],200);
    }
}
