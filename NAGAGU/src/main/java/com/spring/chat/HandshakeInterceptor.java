package com.spring.chat;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	
	@Override
	public boolean beforeHandshake (ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> map) throws Exception {
		//위 파라미터들 중 attribute 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다.
		System.out.println("Before Handshake");
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI:" + request.getURI());
		
		HttpServletRequest req = ssreq.getServletRequest();
		String mem_mail = (String)req.getSession().getAttribute("MEMBER_EMAIL");
		map.put("userMail", mem_mail);
		System.out.println("HttpSession에 저장된 닉네임 : " + mem_mail);
		
		return super.beforeHandshake(request, response, wsHandler, map);
	}
	
	@Override
	public void afterHandshake (ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
		System.out.println("After Handshake");
		
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
