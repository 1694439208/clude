package controler;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.File;
import com.*;
import javax.servlet.http.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

/**
 * ControlerServlet,控制器类，所有的以.action结尾的请求都会被改控制器拦截，
 *例如：http://localhost:8080/mvc/LoginAction.action
 * @author Administrator
 *
 */
public class ControlerServlet extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = 4660044561652707132L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("error", "请不要已get方式访问接口");
        req.getRequestDispatcher("error.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        if ("false"=="false")
        {
            try {
                session.setAttribute("state_js", "true");
                Toolset.tool.HttpServer(req,resp);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }else{
            req.setAttribute("error", "脚本实例只能运行一次等待脚本执行完毕或者中断脚本");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }

    }
}

