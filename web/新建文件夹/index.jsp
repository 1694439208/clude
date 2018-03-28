<%--
  Created by IntelliJ IDEA.
  User: 海绵宝宝
  Date: 2017/12/3
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>云代码-海绵-</title>
    <!--导入js库-->
    <script src="js/ace.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/ext-language_tools.js" type="text/javascript" charset="utf-8"></script>
    <!--ber-->
    <script src="js/jquery.min.js"></script>
    <script src="layer/layer.js"></script>
    <script src="js/base.js"></script>


    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        #a{
            height: 400px;
            overflow: auto;
        }
        .login{
            display: inline-block;
            height: 38px;
            line-height: 38px;
            padding: 0 18px;
            background-color: #009688;
            color: #fff;
            white-space: nowrap;
            text-align: center;
            font-size: 14px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            -moz-user-select: none;
            -webkit-user-select: none;
        }
        .login:hover{cursor:pointer;content:"Hellow";}
    </style>
</head>


<body style="padding-top: 51px;padding-right: 16px;">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">云代码-海绵</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <%

                if(session.isNew())
                {
                    out.print("<li><a href=\"#\" id=\"log\"><span class=\"glyphicon glyphicon-log-in\"></span>登录</a></li>");//window.location.href='login.jsp'
                }else{
                    String cat=(String)session.getAttribute("user");
                    if(cat!=null){
                        out.print("<li><a href=\"#\" id=\"log\" ><span class=\"glyphicon glyphicon-log-in\"></span>登出</a></li>");
                    }else{
                        out.print("<li><a href=\"#\" id=\"log\"><span class=\"glyphicon glyphicon-log-in\"></span>登录</a></li>");
                    }
                }
                //Object user = session.getAttribute("user");
            %>
            <!--<li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>-->

        </ul>
    </div>

</nav>
<div class="row">
    <div class="col-md-12">
	<pre id="code" class="ace_editor" style="min-height:400px"><textarea class="ace_text-input">
	/*
		此脚本为纯js语法打造-包含一些js对象方法例如eval，DATE，
		支持标准json字符串和json对象互转-具体用法为js请自行解决
		HTTP.get()返回的是jsoup的dom对象可以用jsoup用法解析dom树  
		例如：
		var date=HTTP.Get("http://www.baidu.com");
		var list=date.select(".link_title");
		for(var i=0;i<list.length;i++)
		{
			HTTP.Log(HTTP.Md5(list[i].text())+"\r\n");
		}
		等等用法操作：熟悉java和js可以快速上手
		
		将来准备支持：
			数据托管，
			任务托管
			等等
		不会支持：
			本地IO
			等等
		
	*/
	HTTP.Log("----------------新闻采集-----------------");
	for(var j=0;j<5;j++)
	{
		var url="http://cre.mix.sina.com.cn/get/cms/feed?callback=jQuery111203966428968720499_1511534461047&cateid=1z_22&cre=tianyi&mod=pctechc&merge=3&statics=1&length=15&up=2&down=0&tm=1511534258&action=1&offset=0&ad=%7B%22rotate_count%22%3A100%2C%22platform%22%3A%22pc%22%2C%22channel%22%3A%22tianyi_pctech%22%2C%22page_url%22%3A%22http%3A%2F%2Ftech.sina.com.cn%2F%22%2C%22timestamp%22%3A1511534462924%7D&port=3602&imp_type=2&pcProduct=11&ctime=1511508474&_=1511534461052";
		var asd=HTTP.Get(url).toString();
		var json=eval('('+asd.split("(")[1].split(")")[0]+')');
		for(var i=0;i<json.data.length;i++)
		{
			HTTP.Log(json.data[i].title);
		}
	}
			</textarea></pre>
        <button id="test1" class="login pull-right">运行上述代码</button>
    </div>

</div>

<div class="row">
    <div class="ltable-responsive" >
        <div class="col-md-12">
            <table class="table">
                <thead>
                <tr>
                    <th>函数</th>
                    <th>说明</th>
                    <th>例子</th>
                    <th>最新修改时间</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>HTTP.Get(url)</td>
                    <td>get获取网页内容</td>
                    <td>HTTP.Get(url) or HTTP.Get(url,header)</td>
                    <td>2017/12/3</td>
                </tr>
                <tr>
                    <td>HTTP.Log(message)</td>
                    <td>日志</td>
                    <td>message="kkkkkkkkkkkk"</td>
                    <td>2017/12/3</td>
                </tr>
                <tr>
                    <td>HTTP.Md5(str)</td>
                    <td>md5加密</td>
                    <td>str="hello world"</td>
                    <td>2017/12/3</td>
                </tr>
                <tr>
                    <td>HTTP.Sleep(time)</td>
                    <td>休眠函数 单位毫秒</td>
                    <td>time=1000/一秒</td>
                    <td>2017/12/3</td>
                </tr>
                <tr>
                    <td>HTTP.EnBase64(str)</td>
                    <td>base64解码</td>
                    <td>str="dddd"</td>
                    <td>2017/12/3</td>
                </tr>
                <tr>
                    <td>HTTP.DeBase64(str)</td>
                    <td>base64编码</td>
                    <td>str="dddd"</td>
                    <td>2017/12/3</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
<script>
    $(document).ready(function(){
        //提示
        $('#test1').on('click', function(){
            //输入密码
            var b = new Base64();
            var str = b.encode(editor.getValue());
            $.post("server.jsp",{
                    code:str
                },
                function(data,status){
                    layer.open({
                        title: '运行结果'
                        ,content:data
                    });
                });
        });
        $("#log").click(function(){
            if($(this).text()=="登录"){L();}else{C();}
        });
        var L=function () {
            layer.confirm('请输入用户key：<input type="text" class="form-control" id="inputSuccess">', {
                btn: ['确定','拒绝'] //按钮
            }, function(){
                login($("#inputSuccess").val());
            }, function(){
                layer.msg('拒绝登录意味无法使用代码同步', {
                    time: 2000
                });
            });
        }
        var C=function () {
            $.get("jsp/login.jsp",function(data,status){
                var obj = eval('(' + data + ')');
                layer.msg(obj.seen, {icon: 1});
                if(obj.code==352){
                    $("#log").text("登录");
                }
            });
        }
    });
    function login(passda)
    {
        $.post("jsp/login.jsp",
            {
                passd:passda
            },
            function(data,status){
                var obj = eval('(' + data + ')');
                layer.msg(obj.seen, {icon: 1});
                if(obj.code==200){
                    $("#log").text("登出");
                }
            });
    }
    //初始化对象
    editor = ace.edit("code");

    //设置风格和语言（更多风格和语言，请到github上相应目录查看）
    theme = "clouds"
    language = "javascript"
    editor.setTheme("ace/theme/" + theme);
    editor.session.setMode("ace/mode/" + language);

    //字体大小
    editor.setFontSize(18);

    //设置只读（true时只读，用于展示代码）
    editor.setReadOnly(false);

    //自动换行,设置为off关闭
    editor.setOption("wrap", "free")

    //启用提示菜单
    ace.require("ace/ext/language_tools");
    editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
    });
</script>

</body>
</html>
