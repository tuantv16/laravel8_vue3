<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $productId = 1;
        $storeId = 2;
      
        // Thêm dữ liệu vào bảng pivot 
        // $store = Store::find($storeId);
        // $store->products()->attach($productId);

         // Thêm dữ liệu vào bảng pivot 
        // $product = Product::find($productId);
        // $product->stores()->attach($storeId);

        // Xóa tất cả sản phẩm có id = 1 trong bảng pivot
        // $store = Store::find($productId);
        // $store->products()->detach();
        
        // đồng bộ sync
        $store = Store::find($storeId);
        $store->products()->sync([8, 7]);

        echo 'them du lieu thanh cong'; die;
    }

    public function sendEmail() {
        $username   = 'Trần Văn Tuấn';
        $from_email = 'abc@gmail.com';
        $to_email   = 'tuantran.adnetplus@gmail.com';
        //$to_email   = 'dieple1609@gmail.com';
        $info = [
            'username'       => $username,
            'from_email'     => $from_email,
            'to_email'       => $to_email
        ];

        Mail::send('template_email.advertisement', ['info' => $info], function ($m) use ($info) {
            $m->from($info['from_email'], 'Akabot');
            $m->to($info['to_email'])->subject('Order successfully! Amount you need to pay 420$');
        });


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        echo 11122222;die;
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
