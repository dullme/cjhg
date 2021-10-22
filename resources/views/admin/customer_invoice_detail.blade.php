<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">发票详情</h3>

        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="/admin/customer-invoices" class="btn btn-sm btn-default" title="列表"><i
                        class="fa fa-list"></i><span class="hidden-xs">&nbsp;列表</span></a>
            </div>
        </div>
    </div>
    <div class="box-body" style="margin-top: 20px;padding-left: 10%;padding-right: 10%">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">
                        <p>发票编号：{{ $customerInvoice->no }}</p>
                        <p>客户名称：{{ $customerInvoice->customer->name }}</p>
                        <p>开票日期：{{ substr($customerInvoice->date, 0, 10) }}</p>
                    </div>
                </div>

            </div>

            <div class="col-md-12" style="margin-top: 20px;margin-bottom:20px;">
                <table class="table table-hover" id="table-fields" style="margin-bottom: unset;">
                    <tbody>
                    <tr style="background-color: #8BC34A">
                        <th>订单编号</th>
                        <th>下单时间</th>
                        <th>订单总金额</th>
                        <th>开票总金额</th>
                    </tr>
                    @foreach($customerInvoice->customerInvoiceDetails as $item)
                        <tr>
                            <td><a href="{{ url('/admin/customer-orders/'.$item->customerOrder->id) }}">{{ $item->customerOrder->no }}</a></td>
                            <td>{{ substr($item->customerOrder->order_time, 0, 10) }}</td>
                            <td>{{ $item->customerOrder->amount }}</td>
                            <td>{{ $item->invoice }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                <hr style= "border:1px dashed #d8d8d8" />

                <div style="display: flex;justify-content: flex-end;">
                    <div style="width: 320px">
                        <div style="display:flex;justify-content: space-between;">
                            <div style="color: #969696">
                                <p style="margin-bottom: 20px">开票总金额</p>
                            </div>
                            <div style="padding-right: 8px;text-align: end">
                                <p style="margin-bottom: 20px;font-weight: bold; font-size: 18px">¥{{ $customerInvoice->amount }}</p>
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
