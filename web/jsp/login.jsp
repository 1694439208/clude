
<%@ page import = "com.UserLogin" language="java" pageEncoding="utf-8"  contentType="text/html;charset=UTF-8"%>
<%
    UserLogin user=new UserLogin();
    String passd = request.getParameter("passd");
    if(passd != null)
    {
            if(user.UserLogin(passd)){
                session.setAttribute("user", passd);
                session.setMaxInactiveInterval(60);
                out.println("{seen:'授权成功',code:200}");
            }else{
                out.println("{seen:'key错误或无key',code:165}");
            }
    }else{
        session.removeAttribute("user");
        out.println("{seen:'注销成功',code:352}");
    }
%>