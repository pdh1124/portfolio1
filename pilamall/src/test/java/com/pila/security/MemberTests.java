package com.pila.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pila.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder; // 암호화 객체 
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds; // DB접근 객체
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper; // 회원 정보 쿼리
	
	//계정 추가
//	@Test
//	public void testInsertMember() {
//		String sql = "insert into tbl_member(userid,userpass,username,useremail,userphone,useraddr1,useraddr2,useraddr3,money) values (?,?,?,?,?,?,?,?,1000000)";
//		
//		for(int i=0; i<10; i++) {
//			Connection con = null; //import java.sql.Connection;
//			PreparedStatement pstmt = null; //import java.sql.PreparedStatement;
//			
//			try {
//				con = ds.getConnection();
//				pstmt = con.prepareStatement(sql);
//
//				pstmt.setString(2, pwencoder.encode("pw" + i));
//
//				if (i < 9) {
//					pstmt.setString(1, "user" + i);
//					pstmt.setString(3, "일반사용자" + i);
//					pstmt.setString(4, i+"@test.com");
//					pstmt.setString(5, "010-"+i);
//					pstmt.setString(6, "서울시"+i);
//					pstmt.setString(7, "서울군"+i);
//					pstmt.setString(8, "서울동"+i);
//				}else if(i<10) {
//					pstmt.setString(1, "admin" + i);
//					pstmt.setString(3, "관리자" + i);
//					pstmt.setString(4, i+"@test.com");
//					pstmt.setString(5, "010-"+i);
//					pstmt.setString(6, "서울시"+i);
//					pstmt.setString(7, "서울군"+i);
//					pstmt.setString(8, "서울동"+i);
//				}
//				pstmt.executeUpdate();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				if (pstmt != null) {
//					try {
//						pstmt.close();
//					} catch (Exception e) {
//					}
//				}
//				if (con != null) {
//					try {
//						con.close();
//					} catch (Exception e) {
//					}
//				}
//			}
//			
//		}// end_for문
//		
//	}//end_testInsertMember()
	
	
	@Test
	public void testInsertAuth() {
	String sql = "insert into tbl_member_auth (userid,auth) values (?,?)";
	
		for(int i=0; i<10; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i<9) { //0부터 79까지 80개는 
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_USER");
				}
				else { // 그 외 10개는  
					pstmt.setString(1, "admin"+i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			}// end_try
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				
				if(pstmt != null) {
					try { pstmt.close();} 
					catch (Exception e) {}
				}
				
				if(con != null) {
					try {con.close();}
					catch (Exception e) {}
				}				
			}
		}// end_for문
	}// end_testInsertAuth()
}
