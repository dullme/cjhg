<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\CustomerOrder;
use App\Models\PurchaseOrder;
use App\Models\Sold;
use App\Models\Supplier;
use App\Models\Warehouse;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\InfoBox;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        $content->title('Dashboard');
        $content->description('Description...');

        $sold = Sold::all();


        $warehouses = Warehouse::all();
        $warehouses = $warehouses->map(function ($item){
            $item['amount'] = $item->unit_price * $item->quantity;

            return $item;
        });
        

        $sales_total = '¥ '. bigNumber($sold->sum('sales_total'))->getValue();
        $purchase_total = '¥ '. bigNumber($warehouses->sum('amount'))->getValue();

        $content->row(function ($row) use ($sales_total, $purchase_total) {
            $row->column(3, new InfoBox('客户', 'users', 'aqua', '/admin/customers', Customer::count()));
            $row->column(3, new InfoBox('供应商', 'book', 'yellow', 'admin/suppliers', Supplier::count()));
            $row->column(3, new InfoBox('累计销售 '.CustomerOrder::count(), 'shopping-cart', 'green', '/admin/purchase-orders', $sales_total));
            $row->column(3, new InfoBox('累计采购 '.PurchaseOrder::count(), 'file', 'red', '/admin/purchase-orders', $purchase_total));
        });

        return $content;
    }

    public function config()
    {
        return response()->json([
            'vat' => intval(bigNumber(config('VAT'))->multiply(100)->getValue())
        ]);
    }
}
