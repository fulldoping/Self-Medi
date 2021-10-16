package com.fulldoping.free.dao.face;

import java.sql.Connection;
import java.util.List;

import com.fulldoping.free.dto.Free;
import com.fulldoping.free.dto.FreeFile;
import com.fulldoping.util.Paging;

public interface FreeDao {


	/**
	 * Free테이블 전체 조회
	 * 페이징 처리 추가
	 * 
	 * @param conn - DB연결 객체
	 * @param paging - 페이징 정보 객체
	 * @return List<Free> - Free테이블 전체 조회 결과 리스트
	 */
	public List<Free> selectAll(Connection conn, Paging paging);

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param conn - DB연결 객체
	 * @return int - Free테이블 전체 행 수 조회 결과
	 */	
	int selectCntAll(Connection conn);

	/**
	 * 특정 게시글 상세조회
	 * 
	 * @param conn - DB연결 객체
	 * @param boardNo - 조회할 boardno를 가진 객체
	 * @return Free - 조회된 결과 객체
	 */
	public Free selectFreeByBoardNo(Connection conn, Free boardNo);
	
	/**
	 * 조회된 게시글의 조회수 증가시키기
	 * 
	 * @param boardNo - 조회된 게시글 번호를 가진 객체
	 */
	int updateHit(Connection conn, Free boardNo);

	/**
	 * id를 이용해 nick을 조회한다
	 * 
	 * @param viewBoard - 조회할 id를 가진 객체
	 * @return String - 작성자 닉네임
	 */
	public String selectNickByUserId(Connection conn, Free viewFree);
	
	/**
	 * 게시글 입력
	 * 
	 * @param free - 삽입될 게시글 내용
	 */
	int insert(Connection conn, Free free);
	
	/**
	 * 다음 게시글 번호 조회
	 * 
	 * 	게시글 테이블과 첨부파일 테이블에 입력될 공통 boardNo값을 시퀀스를 통해 조회한다
	 * 
	 * @param conn - DB연결 객체
	 * @return 다음 게시글 번호
	 */
	public int selectNextBoardNo(Connection conn);

	/**
	 * 첨부파일 입력
	 * 
	 * @param conn - DB연결 객체
	 * @param freeFile - 첨부파일 정보
	 * @return 삽입 결과
	 */
	int insertFile(Connection conn, FreeFile freeFile);

	/**
	 * 첨부파일 조회
	 * 
	 * @param conn - DB연결 객체
	 * @param viewFree - 첨부파일을 조회할 게시글번호 객체
	 * @return FreeFile - 조회된 첨부파일
	 */
	public FreeFile selectFile(Connection conn, Free viewFree);

	/**
	 * 게시글 수정 
	 * 
	 * @param free - 수정할 내용을 담은 객체
	 */
	int update(Connection conn, Free free);
	
	/**
	 * 게시글에 첨부된 파일 기록 삭제
	 * 
	 * @param free - 삭제할 게시글번호를 담은 객체
	 */
	int deleteFile(Connection conn, Free free);

	/**
	 * 게시글 삭제
	 * 
	 * @param free - 삭제할 게시글번호를 담은 객체
	 */
	int delete(Connection conn, Free free);

	




	

}
