<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">产品库存详情</h3>

        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="/admin/items" class="btn btn-sm btn-default" title="列表"><i
                        class="fa fa-list"></i><span class="hidden-xs">&nbsp;列表</span></a>
            </div>
        </div>
    </div>
    <div class="box-body" style="margin-top: 20px;padding-left: 10%;padding-right: 10%">

        <table class="table table-hover grid-table" style="margin-bottom: 100px">
            <thead>
                <tr>
                    <th>产地</th>
                    <th class="column-name">产品名称</th>
                    <th class="column-weight">重量</th>
                    <th class="column-total_quantity">采购总数</th>
                    <th class="column-sold">已销售总数</th>
                    <th class="column-for_sale">剩余库存</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>{{ $item->origin->name}}</td>
                    <td>{{ $item->name}}</td>
                    <td>{{ $item->weight.' kg/'.$item->unit }}</td>
                    <td>{{ $item->warehouse->sum('quantity') }}</td>
                    <td>{{ $item->warehouse->sum('sold') }}</td>
                    <td>{{ $item->warehouse->sum('for_sale') }}</td>
                </tr>
            </tbody>
        </table>


        <table class="table table-hover grid-table">
            <thead>
            <tr>
                <th class="column-total_quantity">销售时间</th>
                <th class="column-total_quantity">数量</th>
                <th class="column-sold">销售金额</th>
                <th class="column-for_sale">采购金额</th>
                <th class="column-for_sale">利润</th>
            </tr>
            </thead>

            <tbody>
            @foreach($solds as $sold)
                <tr>
                    <td>{{ $sold->created_at }}</td>
                    <td>{{ $sold->quantity }}</td>
                    <td>{{ $sold->sales_price }} * {{ $sold->quantity }} = {{ $amount1 = bigNumber($sold->sales_price)->multiply($sold->quantity) }}</td>
                    <td>{{ $sold->purchase_price }} * {{ $sold->quantity }} = {{ $amount2 =bigNumber($sold->purchase_price)->multiply($sold->quantity) }}</td>
                    @if(bigNumber($amount1)->subtract($amount2)->getValue() < 0)
                        <td style="color: red">{{ bigNumber($amount1)->subtract($amount2)->getValue() }}</td>
                    @else
                        <td>{{ bigNumber($amount1)->subtract($amount2)->getValue() }}</td>
                    @endif

                </tr>
            @endforeach
            </tbody>
        </table>
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
