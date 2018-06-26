package mms.model.dao;

import static mms.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import mms.exception.MMSException;
import mms.model.dto.Doctor;

public class DoctorDao {
	public DoctorDao(){}
	
	public ArrayList<Doctor> displayList(Connection conn) throws MMSException { // 전체정보 출력
		ArrayList<Doctor> list = new ArrayList<Doctor>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from doctor join department using(dept_no)";
		try{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Doctor d = new Doctor();
				d.setDocNo(rset.getString("doc_no"));
				d.setDocName(rset.getString("doc_name"));
				d.setDocRoom(rset.getInt("doc_room"));
				d.setDeptNo(rset.getString("dept_no"));
				d.setDeptName(rset.getString("dept_name"));
				
				list.add(d);
			}
			if(list.size()==0)
				throw new MMSException("의사 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(stmt);
		}		
		return list;
	}
	
	public ArrayList<Doctor> displayName(Connection conn, String docName) throws MMSException{ // 의사 이름으로 조회
		ArrayList<Doctor> list = new ArrayList<Doctor>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from doctor join department using(dept_no) where doc_name like ?";
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + docName + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Doctor d = new Doctor();
				d.setDocNo(rset.getString("doc_no"));
				d.setDocName(rset.getString("doc_name"));
				d.setDocRoom(rset.getInt("doc_room"));
				d.setDeptNo(rset.getString("dept_no"));
				d.setDeptName(rset.getString("dept_name"));
				
				list.add(d);
			}
			if(list.size()==0)
				throw new MMSException("의사 정보가 없습니다.");			
		} catch(Exception e) {
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	public ArrayList<Doctor> displayDept(Connection conn, String deptName) throws MMSException{ // 의사 부서로 조회
		ArrayList<Doctor> list = new ArrayList<Doctor>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//String query = "select * from doctor where dept_no like ?"; //
		String query = "select * from doctor join department using(dept_no) where dept_name like ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + deptName + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Doctor d = new Doctor();
				d.setDocNo(rset.getString("doc_no"));
				d.setDocName(rset.getString("doc_name"));
				d.setDocRoom(rset.getInt("doc_room"));
				d.setDeptNo(rset.getString("dept_no"));
				d.setDeptName(rset.getString("dept_name"));
				
				list.add(d);
			}
			if(list.size()==0)
				throw new MMSException("의사 정보가 없습니다.");			
		} catch(Exception e) {
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	public ArrayList<Doctor> displayDeptAll(Connection conn) throws MMSException{
		ArrayList<Doctor> list = new ArrayList<Doctor>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select dept_name from department";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				Doctor d = new Doctor();
				d.setDeptName(rset.getString("dept_name"));
				
				list.add(d);
			}
			if(list.size() == 0)
				throw new MMSException("오류");
		} catch (Exception e) {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	//진료실 조회
	public Doctor displayRoom(Connection conn, String docRoom) throws MMSException{
		Doctor d = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from doctor join department using (dept_no) where doc_room like ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + docRoom + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				d = new Doctor();
				d.setDocNo(rset.getString("doc_no"));
				d.setDocName(rset.getString("doc_name"));
				d.setDocRoom(rset.getInt("doc_room"));
				d.setDeptNo(rset.getString("dept_no"));
				d.setDeptName(rset.getString("dept_name"));
			}
			if(d == null)
				throw new MMSException("의사 정보가 없습니다.");
			
		} catch(Exception e) {
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}		
		return d;
	}
	
	public int displayInsert(Connection conn, Doctor d) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into doctor "
				+ "values (?, ?, ?, ?)";		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getDocNo());
			pstmt.setString(2, d.getDocName());
			pstmt.setInt(3, d.getDocRoom());
			pstmt.setString(4, d.getDeptNo());
			
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
	
	public int displayUpdate(Connection conn, Doctor d) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update doctor set doc_name = ?, doc_room = ?, dept_no = ? where doc_no = ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getDocName());
			pstmt.setInt(2, d.getDocRoom());
			pstmt.setString(3, d.getDeptNo());
			pstmt.setString(4, d.getDocNo());
			
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
	
	public int displayDelete(Connection conn, Doctor d) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from doctor where doc_no = ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getDocNo());
			
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
