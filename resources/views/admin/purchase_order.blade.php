<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">创建</h3>

        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="/admin/purchase-orders" class="btn btn-sm btn-default" title="列表"><i
                        class="fa fa-list"></i><span class="hidden-xs">&nbsp;列表</span></a>
            </div>
        </div>
    </div>

    <div class="box-body" style="margin-top: 20px;padding-left: 10%;padding-right: 10%">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">
                        <p>采购编号：{{ $purchaseOrders->no }}</p>
                        <p>供应商：{{ $purchaseOrders->supplier->name }}</p>
                        <p>下单时间：{{ substr($purchaseOrders->order_time, 0, 10) }}</p>
                    </div>
                </div>
            </div>


            <div class="col-md-12" style="margin-top: 20px">
                <table class="table table-hover" id="table-fields" style="margin-bottom: unset;">
                    <tbody>
                    <tr style="background-color: #03a9f4;color: white">
                        <th>产品</th>
                        <th style="width: 100px;text-align: end">数量</th>
                        <th style="width: 100px;text-align: end">单价</th>
                        <th style="width: 100px;text-align: end">总价</th>
                        <th style="width: 100px;text-align: end">备注</th>
                    </tr>
                    @foreach($purchaseOrders->warehouses as $warehouse)
                        <tr>
                            <td>{{ $warehouse->item->name }}【{{ $warehouse->item->origin->name }} {{ $warehouse->item->weight }} kg/{{ $warehouse->item->unit }}】</td>
                            <td style="text-align: end">{{ $warehouse->quantity }}</td>
                            <td style="text-align: end">{{ $warehouse->unit_price }}</td>
                            <td style="text-align: end">{{ $warehouse->remark }}</td>
                            <td style="text-align: end">{{ $warehouse->total }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                <hr style= "border:1px dashed #d8d8d8" />

                <div style="display: flex;justify-content: flex-end;">
                    <div style="width: 340px;height: 200px">
                        <div style="display:flex;justify-content: space-between;">
                            <div style="color: #969696">
                                <p>合计</p>
                            </div>
                            <div style="font-weight: bold;padding-right: 8px;text-align: end;font-size: 16px">
                                <p>¥{{ bigNumber($purchaseOrders->warehouses->sum('total'))->getValue() }}</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<style>

    .table>tbody>tr>th{
        padding: 14px 8px;
    }

    .table>tbody>tr>td{
        padding: 20px 8px;
    }

    hr{
        margin-top: unset;
    }
</style>
