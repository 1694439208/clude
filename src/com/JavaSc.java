package com;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
public class JavaSc {
    public static String testScriptVariables(String data) throws NoSuchMethodException
	{ 
	    ScriptEngineManager sem=new ScriptEngineManager();
	    ScriptEngine engine=sem.getEngineByName("js");
	    code code=new code();
	    engine.put("HTTP", code); 
	    try {
			Object retnr=engine.eval(data);
            //code.Log(code.getmessageaaa()+"---"+retnr);//code.message+
			return code.getmessageaaa()+"<br>";
	    	/*Invocable inv2 = (Invocable)engine;  
	        String res=(String)inv2.invokeFunction("aaa");  
	        System.out.println(res); */
	    	
	    	/*Object obj=engine.get("aaa");
	        Invocable inv=(Invocable)engine; 
	        Runnable r=inv.getInterface(obj,Runnable.class); 
	        Thread t=new Thread(r); 
	        t.start();*/
	    } catch (ScriptException e) { 
	        e.printStackTrace();
	        return  e.getMessage();
	    } 
	}
}
