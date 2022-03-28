package com.ezvtheater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private static BoardDAO bdao = new BoardDAO();
	private static ConnectionDB condb = ConnectionDB.getInstance();
	private Connection con = null;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		return bdao;
	}

	public Connection getConnection() throws Exception {
		Context initctx = new InitialContext();
		DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection con = ds.getConnection();
		return con;
	}

	public void insertBoard(BoardVO bvo) throws Exception {
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		// 글 그룹의 가장 큰 값으로 설정.
		pstmt = con.prepareStatement("select max(ref) from review");
		rs = pstmt.executeQuery();
		if (rs.next()) {
			ref = rs.getInt(1) + 1;
		}

		pstmt = con.prepareStatement(
				"insert into review values(reviewBoard_seq.nextVal, ?,?,?,?, sysdate, ?, ?, ?, 0, ?)");
		pstmt.setString(1, bvo.getWriter());
		pstmt.setString(2, bvo.getEmail());
		pstmt.setString(3, bvo.getTitle());
		pstmt.setString(4, bvo.getPw());
		pstmt.setInt(5, ref); // ref
		pstmt.setInt(6, re_step); // re_step
		pstmt.setInt(7, re_level); // re_level
		pstmt.setString(8, bvo.getContent());
		pstmt.executeUpdate();
		condb.close(con, pstmt, rs);
	}

	public void insertBoardRe(BoardVO bvo) throws Exception {
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ref = bvo.getRef();
		int re_level = bvo.getRe_level();
		int re_step = bvo.getRe_step();

		pstmt = con.prepareStatement("update review set re_step = re_step + 1 where ref = ? and re_step > ?");
		pstmt.setInt(1, ref);
		pstmt.setInt(2, re_step);
		pstmt.executeUpdate();

		pstmt = con.prepareStatement(
				"insert into review values(reviewBoard_seq.nextVal, ?,?,?,?, sysdate, ?, ?, ?, 0, ?)");
		pstmt.setString(1, bvo.getWriter());
		pstmt.setString(2, bvo.getEmail());
		pstmt.setString(3, bvo.getTitle());
		pstmt.setString(4, bvo.getPw());
		pstmt.setInt(5, ref); // ref
		pstmt.setInt(6, re_step + 1); // re_step
		pstmt.setInt(7, re_level + 1); // re_level
		pstmt.setString(8, bvo.getContent());
		pstmt.executeUpdate();
		condb.close(con, pstmt, rs);
	}

	public ArrayList<BoardVO> getBoardAll() throws Exception {
		ArrayList<BoardVO> arrBvo = new ArrayList<BoardVO>();
		con = getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from review order by ref desc, re_step asc");
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			BoardVO bvo = new BoardVO();
			bvo.setNum(rs.getInt("num"));
			bvo.setWriter(rs.getString("writer"));
			bvo.setEmail(rs.getString("email"));
			bvo.setTitle(rs.getString("title"));
			bvo.setPw(rs.getString("pw"));
			bvo.setRegDate(rs.getString("regdate"));
			bvo.setRef(rs.getInt("ref"));
			bvo.setRe_step(rs.getInt("re_step"));
			bvo.setRe_level(rs.getInt("re_level"));
			bvo.setReadCount(rs.getInt("readcount"));
			bvo.setContent(rs.getString("content"));
			arrBvo.add(bvo);
		}
		condb.close(con, pstmt, rs);
		return arrBvo;
	}

	public BoardVO getOneBoard(int num) throws Exception {
		BoardVO bvo = new BoardVO();
		con = getConnection();
		PreparedStatement pstmt = con.prepareStatement("update review set readcount = readcount + 1 where num = ?");
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		pstmt = con.prepareStatement("select * from review where num = ?");
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			bvo.setNum(rs.getInt("num"));
			bvo.setWriter(rs.getString("writer"));
			bvo.setEmail(rs.getString("email"));
			bvo.setTitle(rs.getString("title"));
			bvo.setPw(rs.getString("pw"));
			bvo.setRegDate(rs.getString("regdate"));
			bvo.setRef(rs.getInt("ref"));
			bvo.setRe_step(rs.getInt("re_step"));
			bvo.setRe_level(rs.getInt("re_level"));
			bvo.setReadCount(rs.getInt("readcount"));
			bvo.setContent(rs.getString("content"));
		}
		condb.close(con, pstmt, rs);
		return bvo;
	}
	
	public void updateBoard(BoardVO bvo) throws Exception {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		pstmt = con.prepareStatement("update review set title = ?, email = ?, content = ? where num = ? ");
		pstmt.setString(1, bvo.getTitle());
		pstmt.setString(2, bvo.getEmail());
		pstmt.setString(3, bvo.getContent());
		pstmt.setInt(4, bvo.getNum());
		pstmt.executeUpdate();
		condb.close(con, pstmt);		
	}
	
	public int getAllCount() throws Exception{
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		pstmt = con.prepareStatement("select count(*) from review");
		rs = pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
	return count; 	
	}
	
	public ArrayList<BoardVO> getBoardAll(int startRow, int endRow) throws Exception {
		ArrayList<BoardVO> arrBvo = new ArrayList<BoardVO>();
		//rownum : 쿼리 결과로 나오는 각각의 행들의 순서값, 특정 갯수의 그 이하의 행을 선택할때 사용.
		//rowid : 테이블에 저장된 각각의 행들의 주소값을 말합니다.
		//가장 최신글을 가져오려면 rownum을 기준으로 Rnum이 startRow보다 크고 endRow보다 작은 경우에는 해당 행을 가져온다.
			
			
		con = getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from (select A.*, rownum Rnum from (select * from review order by ref desc, re_step asc)A) where Rnum >=? and Rnum <=?");
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		ResultSet rs = pstmt.executeQuery();
		 
		while (rs.next()) {
			BoardVO bvo = new BoardVO();
			bvo.setNum(rs.getInt("num"));
			bvo.setWriter(rs.getString("writer"));
			bvo.setEmail(rs.getString("email"));
			bvo.setTitle(rs.getString("title"));
			bvo.setPw(rs.getString("pw"));
			bvo.setRegDate(rs.getString("regdate"));
			bvo.setRef(rs.getInt("ref"));
			bvo.setRe_step(rs.getInt("re_step"));
			bvo.setRe_level(rs.getInt("re_level"));
			bvo.setReadCount(rs.getInt("readcount"));
			bvo.setContent(rs.getString("content"));
			arrBvo.add(bvo);
		}
		condb.close(con, pstmt, rs);
		return arrBvo;
		
	}
}
