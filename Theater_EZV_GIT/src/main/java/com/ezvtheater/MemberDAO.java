package com.ezvtheater;

import java.sql.*;
import java.util.ArrayList;


public class MemberDAO {
	private static MemberDAO mdao = new MemberDAO();
	private static ConnectionDB condb = ConnectionDB.getInstance();
	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return mdao;
	}


	public int dupliIdCheck(String id) throws Exception {
		Connection con = condb.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		pstmt = con.prepareStatement("Select id from member where id = ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			result = 1;
		} else
			result = -1;
		condb.close(con, pstmt, rs);
		return result;
	}

	public int logIn(String id, String pw) throws Exception {
		Connection con = condb.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		if (dupliIdCheck(id) < 0) {
			result = 0; // 아이디 없음.
			condb.close(con, pstmt, rs);
			return result;
		}
		pstmt = con.prepareStatement("Select id from member where id = ? and pw = ?");
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			result = 1; // 로그인 성공 1
			condb.close(con, pstmt, rs);
			return result;
		} else {
			result = -1;// 비밀번호 틀림.
			condb.close(con, pstmt, rs);
			return result;
		}

	}

	public void insertMember(MemberVO mvo) throws Exception {
		Connection con = condb.getConnection();
		PreparedStatement pstmt = con.prepareStatement("insert into member values(?,?,?,?,?,?,?,?, sysdate)");
		pstmt.setString(1, mvo.getId());
		pstmt.setString(2, mvo.getPw());
		pstmt.setString(3, mvo.getEmail());
		pstmt.setString(4, mvo.getTel());
		pstmt.setString(5, mvo.getInterests());
		pstmt.setString(6, mvo.getJob());
		pstmt.setInt(7, mvo.getAge());
		pstmt.setString(8, mvo.getIntroduce());
		pstmt.executeUpdate();
		condb.close(con, pstmt);
	}

	public void updateMember(MemberVO mvo) throws Exception {
		Connection con = condb.getConnection();
		PreparedStatement pstmt = con.prepareStatement(
				"update member set pw = ?, email = ?, tel = ?, interests = ?, job = ?, age = ?, introduce = ? where id = ?");
		pstmt.setString(1, mvo.getPw());
		pstmt.setString(2, mvo.getEmail());
		pstmt.setString(3, mvo.getTel());
		pstmt.setString(4, mvo.getInterests());
		pstmt.setString(5, mvo.getJob());
		pstmt.setInt(6, mvo.getAge());
		pstmt.setString(7, mvo.getIntroduce());
		pstmt.setString(8, mvo.getId());
		pstmt.executeUpdate();
		condb.close(con, pstmt);
	}

	public ArrayList<MemberVO> memberSelectAll() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberVO> infoArr = new ArrayList<MemberVO>();

		try {
			con = condb.getConnection();
			pstmt = con.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString("id"));
				mvo.setEmail(rs.getString("email"));
				mvo.setTel(rs.getString("tel"));
				mvo.setInterests(rs.getString("interests"));
				mvo.setJob(rs.getString("job"));
				mvo.setAge(rs.getInt("age"));
				mvo.setIntroduce(rs.getString("introduce"));
				mvo.setRegdate(rs.getTimestamp("regdate"));
				infoArr.add(mvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			condb.close(con, pstmt, rs);
		}
		return infoArr;
	}

	public MemberVO selectMemberOne(String id) throws Exception {
		MemberVO mvo = new MemberVO();
		Connection con = condb.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = con.prepareStatement("select * from member where id = ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			mvo.setId(rs.getString("id"));
			mvo.setPw(rs.getString("pw"));
			mvo.setEmail(rs.getString("email"));
			mvo.setTel(rs.getString("tel"));
			mvo.setInterests(rs.getString("interests"));
			mvo.setJob(rs.getString("job"));
			mvo.setAge(rs.getInt("age"));
			mvo.setIntroduce(rs.getString("introduce"));
			mvo.setRegdate(rs.getTimestamp("regdate"));
		}

		condb.close(con, pstmt, rs);
		return mvo;
	}

	public int checkPw(String id, String inputPw) throws Exception {
		String pw = "";
		Connection con = condb.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = con.prepareStatement("select pw from member where id = ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			pw = rs.getString("pw");
		}
		condb.close(con, pstmt, rs);

		if (pw.equals(inputPw)) {
			return 1;
		} else
			return -1;

	}

	public int deleteMember(String id, String inputPw) throws Exception {
		if (checkPw(id, inputPw) > 0) {
			Connection con = condb.getConnection();
			PreparedStatement pstmt = con.prepareStatement("delete from member where id = ?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			condb.close(con, pstmt);
			return 1;
		} else
			return -1;
	}

	public String infoChk(String[] strArr, String str) {
		boolean x = false;
		for (int i = 0; i < strArr.length; i++) {
			x = strArr[i].equals(str);
			if (x) {
				return "checked";
			}
		}
		return "";
	}

	public String infoChk(int num1, int num2) {
		if (num1 == num2) {
			return "checked";
		} else
			return "";
	}


}
