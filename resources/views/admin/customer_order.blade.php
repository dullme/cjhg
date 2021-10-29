<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">创建</h3>

        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="/admin/customer-orders" class="btn btn-sm btn-default" title="列表"><i
                        class="fa fa-list"></i><span class="hidden-xs">&nbsp;列表</span></a>
            </div>
        </div>
    </div>
    <div class="box-body" style="margin-top: 20px;padding-left: 10%;padding-right: 10%">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">
                        <p>订单编号：{{ $customerOrders->no }}</p>
                        <p>客户名称：{{ $customerOrders->customer->name }}</p>
                        <p>下单时间：{{ substr($customerOrders->order_time, 0, 10) }}</p>
                        <p>物流公司：{{ $customerOrders->logistics }}</p>
                        <p>发票：
                            @foreach($customerOrders->customerInvoiceDetails as $item)
                            <a class="btn btn-info btn-xs" href="{{ url('/admin/customer-invoices/'.$item->customer_invoice_id) }}">{{ $item->customerInvoice->no }}</a>
                            @endforeach
                        </p>
                        <p>备注：{{ $customerOrders->remarks }}</p>
                    </div>
{{--                    <div class="col-md-6">--}}
{{--                        <div style="display: flex;justify-content: flex-end">--}}
{{--                            @if($yl = bigNumber($customerOrders->solds->sum('sales_total'))->subtract($customerOrders->solds->sum('purchase_total'))->subtract($customerOrders->freight)->getValue() > 0 )--}}
{{--                            <div style="background-color: #f44336;border-radius: 4px" >--}}
{{--                                <div style="padding: 0 40px;line-height: 100px;font-size: 40px;color: white;">--}}
{{--                                    ¥{{ bigNumber($customerOrders->solds->sum('sales_total'))->subtract($customerOrders->solds->sum('purchase_total'))->subtract($customerOrders->freight)->subtract($customerOrders->commission)->getValue() }}--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            @else--}}
{{--                                <div style="background-color: #00a65a;border-radius: 4px" >--}}
{{--                                    <div style="padding: 0 40px;line-height: 100px;font-size: 40px;color: white;">--}}
{{--                                        ¥{{ bigNumber($customerOrders->solds->sum('sales_total'))->subtract($customerOrders->solds->sum('purchase_total'))->subtract($customerOrders->freight)->subtract($customerOrders->commission)->getValue() }}--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            @endif--}}
{{--                        </div>--}}
{{--                    </div>--}}
                </div>

            </div>

            <div class="col-md-12" style="margin-top: 20px;margin-bottom:20px;">
                <table class="table table-hover" id="table-fields" style="margin-bottom: 30px;">
                    <tbody>
                    <tr style="background-color: #D0DBE4">
                        <th>产品</th>
                        <th style="width: 100px;text-align: end">含量</th>
                        <th style="width: 100px;text-align: end">数量</th>
                        <th style="width: 100px;text-align: end">单价</th>
                        <th style="width: 100px;text-align: end">合计</th>
                    </tr>
                    @foreach($customerOrders->orderInfoes as $info)
                        <tr>
                            <td>{{ $info['item']['name'] }}【{{ $info['item']['origin']['name'] }} {{ $info['item']['weight'] }} kg/{{ $info['item']['unit'] }}】</td>
                            <td style="text-align: end">{{ $info['content'] }}</td>
                            <td style="text-align: end">{{ $info['quantity'] }}</td>
                            <td style="text-align: end">¥{{ $info['unit_price'] }}</td>
                            <td style="text-align: end;color: #969696">¥{{ $info['total'] }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>


                <table class="table table-hover" id="table-fields" style="margin-bottom: unset;">
                    <tbody>
                    <tr style="background-color: rgba(218,217,217,0.56)">
                        <th>产品</th>
                        <th style="width: 100px;text-align: end">数量</th>
                        <th style="width: 100px;text-align: end">单价</th>
                        <th style="width: 100px;text-align: end;color: #969696">总成本</th>
                        <th style="width: 100px;text-align: end;color: #969696">总利润</th>
                        <th style="width: 100px;text-align: end">合计</th>
                    </tr>
                    @foreach($customerOrders->solds as $sold)
                        <tr>
                            <td>{{ $sold['name'] }}【{{ $sold['origin'] }} {{ $sold['weight'] }} kg/{{ $sold['unit'] }}】</td>
                            <td style="text-align: end">{{ $sold['quantity'] }}</td>
                            <td style="text-align: end">¥{{ $sold['sales_price'] }}</td>
                            <td style="text-align: end;color: #969696">¥{{ $sold['purchase_total'] }}</td>
                            <td style="text-align: end;color: #969696">¥{{ $sold['profit'] }}</td>
                            <td style="text-align: end">¥{{ $sold['sales_total'] }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                <hr style= "border:1px dashed #d8d8d8" />

                <div style="display: flex;justify-content: flex-end;">
                    <div style="width: 420px">
                        <div style="display:flex;justify-content: space-between;">
                            <div style="color: #969696">
                                <p style="margin-bottom: 20px">销售总金额</p>
                                <p style="margin-bottom: 20px">采购总金额</p>
                                <p style="margin-bottom: 20px">运费</p>
                                <p style="margin-bottom: 20px">佣金</p>
                                <p style="margin-bottom: 20px">增值税({{ $customerOrders->vat * 100 }}%)</p>
                            </div>
                            <div style="padding-right: 8px;text-align: end">
                                <p style="margin-bottom: 20px;font-weight: bold">¥{{ $sales_total = bigNumber(round($customerOrders->solds->sum('sales_total'), 2))->getValue() }}</p>
                                <p style="margin-bottom: 20px">¥{{ $purchase_total = bigNumber(round($customerOrders->solds->sum('purchase_total'), 2))->getValue() }}</p>
                                <p style="margin-bottom: 20px">¥{{ bigNumber($customerOrders->freight)->getValue() }}</p>
                                <p style="margin-bottom: 20px">¥{{ bigNumber($customerOrders->commission)->getValue() }}</p>
                                <p style="margin-bottom: 20px" title="{{ $vat = round(($sales_total-$purchase_total)/($customerOrders->vat+1)*$customerOrders->vat, 2) }}">¥{{ $vat = $vat > 0 ? $vat : '0.00' }}</p>
                            </div>
                        </div>
                        <hr style= "border:1px dashed #d8d8d8" />
                        <div style="display:flex;justify-content: space-between;">
                            <div style="color: #969696">
                                <p title="销售金额-采购金额-运费-佣金-（销售金额-采购金额）/1.13*0.13">利润</p>
                            </div>
                            @if(($res = $sales_total-$purchase_total-$customerOrders->freight-$customerOrders->commission) > 0)
                            <div style="font-weight: bold;padding-right: 8px;text-align: end;font-size: 16px">
                                <p>¥{{ bigNumber($res-$vat)->getValue() }}</p>
                            </div>
                            @else
                                <div style="font-weight: bold;padding-right: 8px;text-align: end;font-size: 16px">
                                    <p>¥{{ bigNumber($res)->getValue() }}</p>
                                </div>
                            @endif
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
