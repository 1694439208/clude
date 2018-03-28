package Toolset;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.lang.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import com.code;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

import java.util.concurrent.*;

public class tool {
    //static final ExecutorService executors = Executors.newCachedThreadPool();
    static final ExecutorService fixedThre = Executors.newFixedThreadPool(10);
    public static void HttpServer(HttpServletRequest req, HttpServletResponse resp) throws IOException,IllegalAccessException, InstantiationException, InvocationTargetException ,ServletException{
        String pathName = req.getServletPath();
        String username = req.getParameter("code");
        int index = pathName.indexOf(".");
        String actionName = pathName.substring(1,index);
        String[] map = {"UserLogin","JavaSc"};
        if (Arrays.asList(map).contains(actionName)) {
            Class c = tool.class;//得到对象
            Method[] methods = c.getDeclaredMethods();//得到方法
            Object obj=c.newInstance();
            try{
                Method sAge = c.getMethod(actionName, new Class[] {String.class,String.class});
                Object[] arguments = new Object[]{actionName,username};
                String s= (String)sAge.invoke(obj , arguments);
                req.setAttribute("error", "执行成功");
                req.setAttribute("code_data", s);
            }catch (NoSuchMethodException q){
                req.setAttribute("error", "执行错误 此接口不公开或者无此接口");
                System.out.println("调用错误:"+q.getMessage());
                q.printStackTrace();
            }
            req.getRequestDispatcher("server.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
    public String JavaSc(String data,String jstext)
            throws ServletException, IOException {
        /*final int index = 0;
        fixedThre.execute(new Runnable()  {
            public String run()throws Exception {
                for(int i=0;i<10;i++)
                {
                    System.out.println(i);
                    Thread.sleep(3000);
                }
                //req.getSession().setAttribute("state_js", "true");
                return "";
            }
        });*/
        String username = jstext;
        System.out.println(jstext+"----------"+data);
        if (username != null && username.trim().length() > 0) {
            username = new code().DeBase64(username);
            String test = null;
            try {
                test = com.JavaSc.testScriptVariables(username);
                System.out.println(test);
                return test;
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return "执行错误！！";
    }
}