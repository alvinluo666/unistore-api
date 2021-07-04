<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\RootCategoryRepository;

class RootCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $repo;

    public function __construct(RootCategoryRepository $repo){
        $this->repo = $repo;
    }


    public function index()
    {
        $categories = $this->repo->getRootCategoryWithMiddleAndLeave();

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
            'name'=>'required|max:6'
        ]);
        $category = $this->repo->newRootCategory($data);
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
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       
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
            'name'=>'required|max:6'
        ]);
        $category = $this->repo->updateRootCategory($data,$id);
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
        $category = $this->repo->deleteRootCategory($id);
        return response()->json(['body'=>$category],200);
    }
}
