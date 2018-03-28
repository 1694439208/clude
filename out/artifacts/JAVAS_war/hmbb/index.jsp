<%--
  Created by IntelliJ IDEA.
  User: 海绵宝宝
  Date: 2017/12/3
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>云代码-海绵</title>
    <!--导入js库-->
    <script src="js/ace.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/ext-language_tools.js" type="text/javascript" charset="utf-8"></script>
<!--ber-->
    <script src="js/jquery.min.js"></script>
    <script src="layer/layer.js"></script>
    <script src="js/base.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <style>
        .layui-btn{
            display: inline-block;
            vertical-align: middle;
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
            -ms-user-select: none;
        }
        .layui-btn:hover{
            opacity: 0.8;
            filter: alpha(opacity=80);
            color: #fff;
        }
    </style>
</head>


<body>
<!--代码输入框（注意请务必设置高度，否则无法显示）-->
<pre id="code" class="ace_editor" style="min-height:400px"><textarea class="ace_text-input">
HTTP.Log("----------------新闻采集-----------------");
for(var j=0;j<10;j++)
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
<button id="test1" class="layui-btn">运行上述代码</button>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
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
<script>
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
            /*layer.prompt({title: '请输入口令以便确认身份', formType: 2}, function(text, index){
                layer.close(index);

                //loading层
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] //0.1透明度的白色背景
                });

                //layer.msg('演示完毕！您的口令：'+ pass +'<br>您最后写下了：'+text);
            });*/
    });
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
