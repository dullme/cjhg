<template>
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建</h3>

            <div class="box-tools">
                <div class="btn-group pull-right" style="margin-right: 5px">
                    <a href="/admin/customer-invoices" class="btn btn-sm btn-default" title="列表"><i
                        class="fa fa-list"></i><span class="hidden-xs">&nbsp;列表</span></a>
                </div>
            </div>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form class="form-horizontal" @submit.prevent="submit">
            <div class="box-body">
                <div class="fields-group">

                    <div class="col-md-12">
                        <div class="form-group ">
                            <label class="col-sm-2  control-label">客户</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <select class="form-control" id="customer">
                                        <option value="">请选择</option>
                                        <option v-for="customer in customers" :value="customer.id">{{ customer.name }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="col-sm-2  control-label">开票日期</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <input id="date" v-model="form_data.date" type="text" class="form-control datetime-picker" placeholder="开票日期">
                                </div>
                            </div>
                        </div>



                        <div class="form-group ">
                            <label class="col-sm-2  control-label">no</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <input id="freight" v-model="form_data.no" type="text" class="form-control" placeholder="发票号">
                                </div>
                            </div>
                        </div>




                        <div class="form-group  ">
                            <label class="col-sm-2  control-label">选择订单</label>
                            <div class="col-sm-8">
                                <table class="table table-hover" id="table-fields">
                                    <tbody>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>下单时间</th>
                                        <th>总金额</th>
                                        <th>已开票金额</th>
                                        <th style="width: 200px">待开票金额</th>
                                    </tr>
                                    <tr v-for="(order) in form_data.orders">
                                        <td>{{ order.no }}</td>
                                        <td>{{ order.order_time }}</td>
                                        <td>{{ order.amount }}</td>
                                        <td>{{  order.invoiced }}</td>
                                        <td><input type="text" class="form-control numeric" v-model="order.invoice" placeholder="数量" ></td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="btn-group pull-right">
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </div>
            </div>

            <!-- /.box-footer -->
        </form>
    </div>
</template>

<script>
    require('../../../public/vendor/datejs/date-zh-CN')

    export default {
        data() {
            return {
                customers:[],
                form_data:{
                    customer_id:'',
                    date:'',
                    no:'',
                    orders:[],
                }
            }
        },

        created() {
            axios.get('/admin/api/customers').then(response => {
                this.customers = response.data
            });
        },

        mounted() {
            $('.datetime-picker').datetimepicker({
                'format': 'YYYY-MM-DD',
                'locale': 'zh-CN',
                'allowInputToggle': true
            });
            $('#date').on('dp.change', (e) => {
                this.form_data.date = e.currentTarget.value;
            });

            $('#customer').select2().on('change', (e) => {
                this.form_data.customer_id = e.target.value
                axios.get('/admin/api/customer-orders/' + e.target.value).then(response => {
                    if(response.data.length == 0){
                        swal(
                            "INFO",
                            '该公司暂无待开金额',
                            'info'
                        )
                    }
                    this.form_data.orders = response.data
                });
            });

        },

        methods: {

            submit(){
                axios({
                    method: 'post',
                    url: '/admin/api/customer-invoice-orders/save',
                    data: this.form_data
                }).then(response => {
                    if (response.data.status) {
                        swal(
                            "SUCCESS",
                            response.data.message,
                            'success'
                        ).then(function () {
                            location.href="/admin/customer-invoices/" + response.data.data;
                        });
                    }else{
                        toastr.error(response.data.data.message);
                    }

                }).catch(error => {
                    toastr.error(error.response.data.message);
                });

            }

        }
    }
</script>

<style>
    .select2-container{
        width: 100% !important;
    }

    td {
        vertical-align: middle !important;
    }
</style>
