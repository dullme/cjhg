<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\PurchaseOrder;
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

        $warehouses = Warehouse::all();
        $warehouses = $warehouses->map(function ($item){
            $item['amount'] = $item->unit_price * $item->quantity;

            return $item;
        });

        $po_amount = $warehouses->sum('amount');
        $so_amount = $warehouses->where('sales_order_id', null)->sum('amount');

        $content->row(function ($row) use ($so_amount, $po_amount) {
            $row->column(3, new InfoBox('客户', 'users', 'aqua', '/admin/customers', Customer::count()));
            $row->column(3, new InfoBox('供应商', 'book', 'yellow', 'admin/suppliers', Supplier::count()));
            $row->column(3, new InfoBox('累计销售 '.PurchaseOrder::count(), 'shopping-cart', 'green', '/admin/purchase-orders', $so_amount));
            $row->column(3, new InfoBox('累计销售 ', 'file', 'red', '/admin/purchase-orders', $po_amount));
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
