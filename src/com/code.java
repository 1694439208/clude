package com;

import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
public class code {
    String messageaaa="";
	public void Log(Object message) {
		System.out.println("\r\n"+message+"\r\n");
        messageaaa+="\r\n<br>"+message.toString();
	}

    public String getmessageaaa() {
        return messageaaa;
    }

    public Document Get(String url) throws IOException {
		Connection document = Jsoup.connect(url);
		Document  document2=document.header("user-agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36").get();
		//Elements lis = document.select(url.Rule_Title);
		return document2;
	}
	public Document Get(String url,String header) throws IOException {
		Connection document = Jsoup.connect(url);
		for(String x:header.split("\r\n"))
		{
			String[] iner=x.split(":");
			if (iner.length==2) {
				document.header(iner[0],iner[1]);
			}
		    System.out.println(iner[0]+"----"+iner[1]);
		}
		Document document2=document.header("user-agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36").get();
		//Elements lis = document.select(url.Rule_Title);
		return document2;
	}
	public void Sleep(Long a) {
		try {
			Thread.sleep(a);
		} catch (InterruptedException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
	}
	public String Md5(String str) {
		return AppMD5Util.MD5(str);
	}
	public String md5(String str) {
		return AppMD5Util.getMD5(str);
	}
	/**
	 * base64����
	 * @param base64String
	 * @return
	 */
	public String EnBase64(String base64String) {
		byte[] ss=Base64.encodeBase64(base64String.getBytes());
        return new String(ss);  
	}
	/**
	 * base64����
	 * @param base64String
	 * @return
	 */
	public String DeBase64(String base64String) {
		byte[] ss=Base64.decodeBase64(base64String);
        return new String(ss);  
	}
}
