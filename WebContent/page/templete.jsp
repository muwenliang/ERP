<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <title>vue入门案例</title>
</head>
 
<body>
    <div style="width: 500px;margin:0 auto;" id="app">
            <!-- V-if删除了节点,页面审查不到 -->
        <h1 v-if="status">{{message}}待办事项</h1>
        <!-- V-show隐藏了节点(使用display:none隐藏了节点),页面能够审查到-->
        <h1 v-show="status">{{message}}待办事项</h1>
        <p>即将添加的待办事项： {{title}}</p>
        <table class="table table-hover">
            <tr>
                <th>id</th>
                <th>标题</th>
                <th>操作</th>
            </tr>
            <!-- v-for,使用for循环遍历数据生成节点，遍历对象和数组-->
            <!-- v-bind的缩写 : （冒号）,绑定属性（自定义属性） -->
            <tr :data-id="item.id" v-for="(item,index) in list">
                <td>{{item.id}}</td>
                <td>{{item.title}}</td>
                <td>
                    <button class="btn btn-info" @click="delItem(item.id)">删除</button>
                </td>
            </tr>
            <!-- v-for遍历对象 -->
            <tr  v-for="(value,key) in object">
                <td>{{key}}</td>
                <td>{{value}}</td>
                <td>
                    <button class="btn btn-info">删除</button>
                </td>
            </tr>
        </table>
        <div class="form-group">
            <label for="exampleInputEmail1">添加待办事项</label>
            <!--V-model与表单元素的value值的双向数据绑定 -->
            <!-- 1 将表单中input的值value和data中值绑定起来
               2  data改变input[value]改变
               3  Input[value]改变data改变 -->
            <input v-model="title"  type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入待办事项">
        </div>
        <button @click="addItem()"  type="submit" class="btn btn-default">添加</button>
        <div>
            <p>作者信息：{{author}}</p>
            <p>来源: <a :href="url">点击打开</a></p>
        </div>
    </div>
    <!-- <template id="clearApp">
        <h1>清空app</h1>
    </template> -->
    <script src="../js/vue.js"></script>
    <script>
        //VUE是一个构造函数
        //1 实现数据的渲染 删除 添加
 
        var vm=new Vue({
            //节点挂载，用来限定vue的语法范围
            el: "#app",
            // template:"#clearApp",
            //data为需要渲染的数据
            //模板渲染{{ obj }}
            //（data中的数据可以直接在html中显示,让js变量直接在html中使用）
            data: function () {
                console.log(this);
                return {
                    author:'xiean',
                    status:false,
                    url:'http://www.baidu.com',
                    message: '小明的: ',
                    title:'默认值',
                    list: [
                        { id: 0, title: "羽毛球" },
                        { id: 1, title: "乒乓球" },
                        { id: 2, title: "篮球" },
                        { id: 3, title: "足球" }
                    ],
                    object:{
                        name:"谢",
                        sex:"女",
                        address:"怀化"
                    }
                }
            },
            methods: {
                delItem: function (id) {
                    for (var key in this.list) {
                        if (this.list[key].id == id) {
                            this.list.splice(key, 1);
                        }
                    }
                },
                addItem:function(){
                    this.list.push({id:this.list.length,title:this.title});
                    console.log(this.list);
                }
            }
        });
      
    </script>
</body>
 
</html>