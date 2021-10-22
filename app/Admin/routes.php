<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('suppliers', SupplierController::class);//供应商
    $router->resource('customers', CustomerController::class);//客户
    $router->get('api/customers', 'CustomerController@getCustomers');
    $router->resource('items', ItemController::class);//产品
    $router->get('api/items', 'ItemController@getItems');

    $router->resource('purchase-orders', PurchaseOrderController::class);//销售订单
    $router->post('/purchase-orders/save', 'PurchaseOrderController@save');//保存销售订单
    $router->resource('origins', OriginController::class);//产地
    $router->get('api/origins', 'OriginController@getOrigins');//产地

    $router->resource('customer-invoices', CustomerInvoiceController::class);//客户发票
    $router->resource('supplier-invoices', SupplierInvoiceController::class);
    $router->get('api/supplier', 'SupplierController@supplier');

    $router->resource('customer-orders', CustomerOrderController::class);//客户订单管理
    $router->get('api/can-sales-items', 'CustomerOrderController@getCanSalesItems');//可销售产品
    $router->get('api/customer-orders/{id}', 'CustomerOrderController@getCustomerOrders');
    $router->post('api/customer-invoice-orders/save', 'CustomerInvoiceController@save');
    $router->resource('logistics', LogisticsController::class);//物流公司
    $router->get('api/logistics', 'LogisticsController@getLogistics');//物流公司

    $router->post('/customer-orders/save', 'CustomerOrderController@save');//保存客户订单

    $router->get('configs', 'HomeController@config');

    $router->resource('customer-payments', CustomerPaymentController::class);//客户付款记录
    $router->get('api/payment-method', 'CustomerPaymentController@getPaymentMethod');//客户付款方式

});
