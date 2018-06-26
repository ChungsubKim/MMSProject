package mms.model.dao;

import static mms.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import mms.exception.MMSException;
import mms.model.dto.Appointment;

public class AppointmentDao {
	public AppointmentDao(){}
	
	public ArrayList<Appointment> displayList(Connection conn) throws MMSException{ // 예약 전체 조회
		ArrayList<Appointment> list = new ArrayList<Appointment>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from appointment";
		
		try{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Appointment a = new Appointment();
				a.setAppNo(rset.getString("app_no"));
				a.setAppDate(rset.getDate("app_date"));
				a.setPatNo(rset.getString("pat_no"));
				a.setAppFirst(rset.getString("app_first"));
				a.setDocNo(rset.getString("doc_no"));
				a.setDeptNo(rset.getString("dept_no"));
				a.setAppMemo(rset.getString("app_memo"));
				
				list.add(a);
			}
			if(list.size() == 0)
				throw new MMSException("예약 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(stmt);
		}		
		return list;
	}
	
	public int displayInsert(Connection conn, Appointment a) throws MMSException{
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into appointment "
					+ "values (?, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, a.getAppNo());
				pstmt.setDate(2, a.getAppDate());
				pstmt.setString(3, a.getPatNo());
				pstmt.setString(4, a.getAppFirst());
				pstmt.setString(5, a.getDocNo());
				pstmt.setString(6, a.getDeptNo());
				pstmt.setString(7, a.getAppMemo());
				
				result = pstmt.executeUpdate();
				if(result == 0)
					throw new MMSException("데이터 추가 실패");
				
			} catch(Exception e){
				throw new MMSException(e.getMessage());
			} finally{
				close(pstmt);
			}
			return result;
	}
		
	public int displayUpdate(Connection conn, Appointment a) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update appointment "
				+ "app_date = ?, pat_no = ?, app_first = ?, "
				+ "doc_no = ?, dept_no = ?, app_memo = ? where app_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, a.getAppDate());
			pstmt.setString(2, a.getPatNo());
			pstmt.setString(3, a.getAppFirst());
			pstmt.setString(4, a.getDocNo());
			pstmt.setString(5, a.getDeptNo());
			pstmt.setString(6, a.getAppMemo());
			pstmt.setString(7, a.getAppNo());
			result = pstmt.executeUpdate();
			if(result == 0)
				throw new MMSException("데이터 수정 실패");
			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int displayDelete(Connection conn, Appointment a) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from appointment where app_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getAppNo());
				
			result = pstmt.executeUpdate();
			if(result == 0)
				throw new MMSException("데이터 삭제 실패");
			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(pstmt);
		}
		return result;
	}
	

}
