package com.freeflux.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.freeflux.encode.ChangeEncoding;

public class DBClass {

	private static Connection conn = null;

	public DBClass() { // 기본 생성자
	}

	public static void connectBoard(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/board_db";
			conn=DriverManager.getConnection(url, "root", "1234");
		} catch (ClassNotFoundException e) {
			System.out.println("DRV ERR : "+e.getMessage());
		} catch (SQLException e) {
			System.out.println("CONNECT ERR : "+e.getMessage());
		}
	}	// public static void connectBoard() END
	
											// write.jsp 로부터 전달 받음
	public static String dataInsert(String w, String t, String c){
		connectBoard();
		String status=null;		// 글 저장 성공 여부 (FAIL / SUCCESS)
		
		String queryInsert="insert into board_table (writer, title, contents) values (?,?,?)";
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(queryInsert);
			pstmt.setString(1, ChangeEncoding.toLatin(w));
			pstmt.setString(2, ChangeEncoding.toLatin(t));
			pstmt.setString(3, ChangeEncoding.toLatin(c));
			int n=pstmt.executeUpdate();
			status=(n>0) ? "SUCCESS" : "FAIL";
		} catch (SQLException e) {
			System.out.println("INS ERR : "+e.getMessage());
		}finally {   // 위의 try / catch 종료 후 자원 해제
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("CLOSE ERR : "+e.getMessage());
			}
		}
		return status;
	}

	
	
	public static ResultSet dataSelectAll(){
		connectBoard();
		ResultSet rs=null;
		String querySelect="select idx, writer, title, hit from board_table order by idx desc";
		Statement stmt=null;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(querySelect);
			
		} catch (SQLException e) {
			System.out.println("SELECT ERR : "+e.getMessage());
		}
		return rs;
	}
	
	
	public static String hitUp(int no){
		connectBoard();
		
		String queryHit = "update board_table set hit=hit+1 where idx=?";
		PreparedStatement pstmt=null;
		String status=null;		// 조회수 증가 성공 여부 (FAIL / SUCCESS)
		try {
			pstmt=conn.prepareStatement(queryHit);
			pstmt.setInt(1, no);
			int n=pstmt.executeUpdate();
			status=(n>0) ? "SUCCESS" : "FAIL";
		} catch (SQLException e) {
			System.out.println("INS ERR : "+e.getMessage());
		}finally {   // 위의 try / catch 종료 후 자원 해제
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("CLOSE ERR : "+e.getMessage());
			}
		}
		return status;
	}

	
	public static ResultSet dataSelectOne(int no){
		connectBoard();
		ResultSet rs=null;
		String querySelectOne="select writer, title, contents from board_table where idx=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(querySelectOne);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("SELECT ONE ERR : "+e.getMessage());
		}
		return rs;
	}
	
	
	public static String dataUpdate(int no, String w, String t, String c){
		connectBoard();
		
		String queryHit = "update board_table set writer=?, title=?, contents=? where idx=?";
		PreparedStatement pstmt=null;
		String status=null;		// 조회수 증가 성공 여부 (FAIL / SUCCESS)
		try {
			pstmt=conn.prepareStatement(queryHit);
			pstmt.setString(1, w);
			pstmt.setString(2, t);
			pstmt.setString(3, c);
			pstmt.setInt(4, no);
			int n=pstmt.executeUpdate();
			status=(n>0) ? "SUCCESS" : "FAIL";
		} catch (SQLException e) {
			System.out.println("INS ERR : "+e.getMessage());
		}finally {   // 위의 try / catch 종료 후 자원 해제
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("CLOSE ERR : "+e.getMessage());
			}
		}
		return status;
	}
}	// public class DBClass END




