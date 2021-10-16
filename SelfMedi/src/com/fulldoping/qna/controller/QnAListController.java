package com.fulldoping.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.qna.dto.QnA;
import com.fulldoping.qna.paging.Paging;
import com.fulldoping.qna.service.face.QnAService;
import com.fulldoping.qna.service.impl.QnAServiceImpl;

@WebServlet("/QnA/list")
public class QnAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//QnAService 객체 생성
    private QnAService qnaService = new QnAServiceImpl();   
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Paging paging = qnaService.getPaging(req);
		
		//게시글 전체 조회
		List<QnA> boardList = qnaService.getList(paging);
		
		//조회결과 MODEL값 전달
		req.setAttribute("boardList", boardList);
				
		//페이징 정보 MODEL값 전달
		req.setAttribute("paging", paging);
				
		//VIEW 지정 및 응답 - forward
		req.getRequestDispatcher("/WEB-INF/views/QnAboard/list.jsp").forward(req, resp);		
				
	}

}