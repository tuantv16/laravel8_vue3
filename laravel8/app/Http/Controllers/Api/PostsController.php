<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Posts;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class PostsController extends Controller
{

    protected $model = 'posts';

    const DEFAULT_PER_PAGE = 5;
    /***
     * @var StoreProduct
     */

    /**
     * Set model
     */
    public function setModel()
    {
        $this->model = app()->make(
            $this->getModel()
        );
    }

    /**
     * get model
     *
     * @return string
     */
    public function getModel()
    {
        return Posts::class;
    }

    public function __construct()
    {
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, array $columns = ['*'])
    {

        // $item_id = [15,14];
      
        // $menus = Posts::whereJsonContains('hobbie', $item_id)->get();
        // return response()->json($menus);
        
        $condition = $request->all();
        $limit = !empty($condition['limit']) ? intval($condition['limit']) : self::DEFAULT_PER_PAGE;
        $page = !empty($condition['page']) ? intval($condition['page']) : 1;
        // $posts = Posts::orderBy('id', 'DESC')
        // ->when(!empty($condition['title']), function($q) use $condition) {

        // });
        $keywordTitle = !empty($condition['title']) ? trim($condition['title']) : '';
        $keywordDescription = !empty($condition['description']) ? trim($condition['description']) : '';

        $query = Posts::query();
        $query->with(['category']);
        $query = $query->when($keywordTitle, function ($q, $keyword) {
            $q->where('title', 'like', "%{$keyword}%");
        })
        ->when($keywordDescription, function ($q, $keyword) {
            $q->where('description', 'like', "%{$keyword}%");
        })
        ->orderBy('id', 'desc');

        $posts = $query->paginate($limit, $columns, 'page', $page);
        return response()->json($posts);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $params = $request->all();
    
        // xử lý param dạng checkbox
        $hobbie = '';
        if (!empty($params['hobbie'])) {

            //return response()->json($params['hobbie']);

          
            $hobbie = implode(",", $params['hobbie']);
            //$hobbie = json_encode($params['hobbie']);
        }

        $posts = Posts::create([
            'title' => $params['title'],
            'description' => $params['description'],
            'hobbie' => $hobbie,
            'gender' => (int)$params['gender'],
            'category_id' => (int)$params['category_id']
        ]);

        return response()->json([
            "success" => true,
            "message" => "Posts created successfully.",
            "data" => $posts
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $posts = Posts::with(['category'])->find($id);   
        if (is_null($posts)) {
            return $this->sendError('Posts not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Posts retrieved successfully.",
            "data" => $posts
        ]);
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
        $params = $request->all();
        // $validator = Validator::make($input, [
        //     'name' => 'required',
        //     'detail' => 'required'
        // ]);
        // if ($validator->fails()) {
        //     return $this->sendError('Validation Error.', $validator->errors());
        // }

        $posts = new Posts();

        $validatedUserData = [];
        if (!empty($params['title'])) {
            $validatedUserData['title'] = $params['title'];
        }
        
        if (!empty($params['description'])) {
            $validatedUserData['description'] = $params['description'];
        }

         // xử lý param dạng checkbox
         $hobbie = '';
         if (!empty($params['hobbie'])) {
             $hobbie = implode(",", $params['hobbie']);
         }
         $validatedUserData['hobbie'] = $hobbie;
         $validatedUserData['gender'] = isset($params['gender']) ? (int) $params['gender'] : 0;
         if (!empty($params['category_id'])) {
            $validatedUserData['category_id'] = (int) $params['category_id'];
         }
         
        $id = (int) $id;
        $posts = Posts::find($id);
        $posts->fill($validatedUserData);
        $posts->save();
        return response()->json([
            "success" => true,
            "message" => "Posts updated successfully.",
            "data" => $posts
        ]);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Posts::where('id',(int)$id)->delete();
        return response()->json([
            "success" => true,
            "message" => "Product deleted successfully.",
            "data" => $item
        ]);
    }
}
