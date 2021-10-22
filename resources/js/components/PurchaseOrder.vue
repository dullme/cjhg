<template>
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
        <!-- /.box-header -->
        <!-- form start -->
        <form class="form-horizontal" @submit.prevent="submit">
            <div class="box-body">
                <div class="fields-group">

                    <div class="col-md-12">
                        <div class="form-group ">
                            <label class="col-sm-2  control-label">供应商</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <select class="form-control" id="supplier">
                                        <option value="">请选择</option>
                                        <option v-for="supplier in suppliers" :value="supplier.id">{{ supplier.name }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="col-sm-2  control-label">下单时间</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <input id="order_time" v-model="form_data.order_time" type="text" class="form-control datetime-picker" placeholder="下单时间">
                                </div>
                            </div>
                        </div>


                        <div class="form-group  ">
                            <label class="col-sm-2  control-label">选择产品</label>
                            <div class="col-sm-8">
                                <table class="table table-hover" id="table-fields">
                                    <tbody>
                                    <tr>
                                        <th>产品</th>
                                        <th style="width: 100px">重量</th>
                                        <th style="width: 100px">单价</th>
                                        <th style="width: 100px">数量</th>
                                        <th style="width: 100px">总价</th>
                                        <th style="width: 50px">操作</th>
                                    </tr>
                                    <tr v-for="(item) in form_data.items" :key="item.length" v-if="item.deleted== false">
                                        <td>
                                            <select class="form-control" :id="'item_' + item.id">
                                                <option value="">请选择</option>
                                                <option v-for="select_item in select_items" :value="select_item.id">{{ select_item.name + '【'+ select_item.weight + ' kg/' + select_item.unit + '】' }}</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" value="" @keyup="item.remark = $event.target.value" placeholder="重量" >
                                        </td>
                                        <td>
                                            <input type="text" class="form-control decimal" value="0"
                                                   @keyup="item.unit_price = $event.target.value" placeholder="单价" >
                                        </td>
                                        <td>
                                            <input type="text" class="form-control numeric" value="1"
                                                   @keyup="item.quantity = $event.target.value" placeholder="数量" >
                                        </td>

                                        <td>
                                            <span class="form-control">{{ item.unit_price * item.quantity }}</span>
                                        </td>
                                        <td><a class="btn btn-sm btn-danger table-field-remove" @click="deleteItem(item.id)"><i class="fa fa-trash"></i> 删除</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <hr style="margin-top: 0;">
                                <div class="form-inline margin" style="width: 100%">
                                    <div class="form-group">
                                        <button type="button" @click="addItem" class="btn btn-sm btn-success" id="add-table-field">
                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;添加
                                        </button>
                                        <span class="text-danger" id="product_info_message"></span>
                                    </div>
                                </div>
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
                    <div class="btn-group pull-left">
                        <button type="reset" class="btn btn-warning">重置</button>
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
                suppliers:[],
                select_items:[],
                item_count:0,
                info_length:0,
                form_data:{
                    supplier_id:'',
                    order_time:'',
                    items:[]
                }
            }
        },

        watch: {
            item_count(newVal, oldVal){
                if(newVal > oldVal){
                    this.itemInfoSelect2('l-'+this.info_length)
                }
            }
        },

        created() {
            axios.get('/admin/api/supplier').then(response => {
                this.suppliers = response.data
            });
            axios.get('/admin/api/items').then(response => {
                this.select_items = response.data
            });

            //获取基础数据
        },

        mounted() {
            $('.datetime-picker').datetimepicker({
                'format': 'YYYY-MM-DD',
                'locale': 'zh-CN',
                'allowInputToggle': true
            });
            $('#order_time').on('dp.change', (e) => {
                this.form_data.order_time = e.currentTarget.value;
            });

            $('#supplier').select2().on('change', (e) => {
                this.form_data.supplier_id = e.target.value
            });
        },

        methods: {
            setInfoMessage(id,text){
                $('#'+id+'_message').html(text)
                setTimeout(function () {
                    $('#'+id+'_message').html('');
                },3000);
            },

            deleteItem(length){
                this.form_data.items.forEach((value, index)=>{
                    if(value.id == length){
                        $('#items'+value.id).remove()
                        this.form_data.items[index].deleted = true;
                        // this.$delete(this.form_data.items, index)
                    }
                })
                this.product_info_count = this.form_data.items.length
            },

            addItem(){
                if(this.validate()){
                    this.form_data.items.push({
                        id:'l-' + (++this.info_length),
                        item_id:'',
                        quantity:1,
                        unit_price:0,
                        remark:'',
                        deleted:false
                    });
                    this.item_count = this.form_data.items.length
                }
            },

            validate(){
                let last_item_info = this.form_data.items[this.form_data.items.length -1]
                if(last_item_info && last_item_info['deleted'] == false){
                    if(!last_item_info['item_id']){
                        this.setInfoMessage('product_info', '请选择单品')
                        return false;
                    }

                    if(last_item_info['quantity'] <=0){
                        this.setInfoMessage('product_info', '数量必须大于0')
                        return false;
                    }

                    if(last_item_info['unit_price'] <=0){
                        this.setInfoMessage('product_info', '单价必须大于0')
                        return false;
                    }
                }

                return true;
            },

            itemInfoSelect2(index){
                this.$nextTick( ()=> {
                    $('#item_'+index).select2().on('change', (e) => {
                        this.form_data.items.forEach((value, key)=>{
                            if(value.id == index){
                                this.form_data.items[key]['item_id'] = e.target.value;
                            }
                        })
                    });

                })
            },

            submit(){
                if(this.validate()){
                    axios({
                        method: 'post',
                        url: '/admin/purchase-orders/save',
                        data: this.form_data
                    }).then(response => {
                        console.log(response);
                        if (response.data.status) {
                            swal(
                                "SUCCESS",
                                response.data.message,
                                'success'
                            ).then(function () {
                                location.href="/admin/purchase-orders";
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
    }
</script>

<style>
    .select2-container{
        width: 100% !important;
    }
</style>
