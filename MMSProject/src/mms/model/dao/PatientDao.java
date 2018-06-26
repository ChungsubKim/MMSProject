package mms.model.dao;

import static mms.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import mms.exception.MMSException;
import mms.model.dto.Patient;

public class PatientDao {
	public PatientDao(){}
	
	public ArrayList<Patient> displayList(Connection conn) throws MMSException { // 전체조회
		ArrayList<Patient> list = new ArrayList<Patient>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient";
		try{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Patient p = new Patient();
				p.setPatNo(rset.getString("pat_no"));
				p.setPatId(rset.getString("pat_id"));
				p.setPatPw(rset.getString("pat_pw"));
				p.setPatName(rset.getString("pat_name"));
				p.setPatPhone(rset.getString("pat_phone"));
				p.setPatSsn(rset.getString("pat_ssn"));
				p.setPatEmail(rset.getString("pat_email"));
				p.setPatAddress(rset.getString("pat_address"));
				
				list.add(p);				
			}
			if(list.size()==0)
				throw new MMSException("환자 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	public Patient displayPatient(Connection conn, String patId) throws MMSException{ // 회원 1명만
		Patient p = null;;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient where pat_id = ?";
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, patId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p = new Patient();				
				p.setPatNo(rset.getString("pat_no"));
				p.setPatId(patId);
				p.setPatPw(rset.getString("pat_pw"));
				p.setPatName(rset.getString("pat_name"));
				p.setPatPhone(rset.getString("pat_phone"));
				p.setPatSsn(rset.getString("pat_ssn"));
				p.setPatEmail(rset.getString("pat_email"));
				p.setPatAddress(rset.getString("pat_address"));
			}
			
			if(p == null)
				throw new MMSException("해당 회원이 존재하지 않습니다.");
			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public ArrayList<Patient> displayNo(Connection conn, String patNo) throws MMSException { // 환자 번호로 조회
		ArrayList<Patient> list = new ArrayList<Patient>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient where pat_no like ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + patNo + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Patient p = new Patient();
				p.setPatNo(rset.getString("pat_no"));
				p.setPatId(rset.getString("pat_id"));
				p.setPatPw(rset.getString("pat_pw"));
				p.setPatName(rset.getString("pat_name"));
				p.setPatPhone(rset.getString("pat_phone"));
				p.setPatSsn(rset.getString("pat_ssn"));
				p.setPatEmail(rset.getString("pat_email"));
				p.setPatAddress(rset.getString("pat_address"));
				
				list.add(p);				
			}
			if(list.size()==0)
				throw new MMSException("환자 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Patient> displayName(Connection conn, String patName) throws MMSException { // 환자 이름으로 조회
		ArrayList<Patient> list = new ArrayList<Patient>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient where pat_name like ?";
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + patName + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Patient p = new Patient();
				p.setPatNo(rset.getString("pat_no"));
				p.setPatId(rset.getString("pat_id"));
				p.setPatPw(rset.getString("pat_pw"));
				p.setPatName(rset.getString("pat_name"));
				p.setPatPhone(rset.getString("pat_phone"));
				p.setPatSsn(rset.getString("pat_ssn"));
				p.setPatEmail(rset.getString("pat_email"));
				p.setPatAddress(rset.getString("pat_address"));
				
				list.add(p);				
			}
			if(list.size()==0)
				throw new MMSException("환자 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Patient> displaySsn(Connection conn, String patSsn) throws MMSException { // 환자 주민번호로 조회
		ArrayList<Patient> list = new ArrayList<Patient>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient where pat_ssn like ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + patSsn + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Patient p = new Patient();
				p.setPatNo(rset.getString("pat_no"));
				p.setPatId(rset.getString("pat_id"));
				p.setPatPw(rset.getString("pat_pw"));
				p.setPatName(rset.getString("pat_name"));
				p.setPatPhone(rset.getString("pat_phone"));
				p.setPatSsn(rset.getString("pat_ssn"));
				p.setPatEmail(rset.getString("pat_email"));
				p.setPatAddress(rset.getString("pat_address"));
				
				list.add(p);
			}
			if(list.size()==0)
				throw new MMSException("환자 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Patient> displayPhone(Connection conn, String patPhone) throws MMSException { // 환자 전화번호로 조회
		ArrayList<Patient> list = new ArrayList<Patient>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient where pat_phone like ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + patPhone + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Patient p = new Patient();
				p.setPatNo(rset.getString("pat_no"));
				p.setPatId(rset.getString("pat_id"));
				p.setPatPw(rset.getString("pat_pw"));
				p.setPatName(rset.getString("pat_name"));
				p.setPatPhone(rset.getString("pat_phone"));
				p.setPatSsn(rset.getString("pat_ssn"));
				p.setPatEmail(rset.getString("pat_email"));
				p.setPatAddress(rset.getString("pat_address"));
				
				list.add(p);
			}
			if(list.size()==0)
				throw new MMSException("환자 정보가 없습니다.");			
		} catch(Exception e){
			throw new MMSException(e.getMessage());
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int displayInsert(Connection conn, Patient p) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into patient "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPatNo());
			pstmt.setString(2, p.getPatId());
			pstmt.setString(3, p.getPatPw());
			pstmt.setString(4, p.getPatName());
			pstmt.setString(5, p.getPatPhone());
			pstmt.setString(6, p.getPatSsn());
			pstmt.setString(7, p.getPatEmail());
			pstmt.setString(8, p.getPatAddress());
			
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
	
	public int displayUpdate(Connection conn, Patient p) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update doctor "
				+ "set pat_id = ?, pat_pw = ?, pat_name = ?, pat_phone = ?, "
				+ "pat_ssn = ? , pat_email = ?, pat_address = ? where pat_no = ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPatId());
			pstmt.setString(2, p.getPatPw());
			pstmt.setString(3, p.getPatName());
			pstmt.setString(4, p.getPatPhone());
			pstmt.setString(5, p.getPatSsn());
			pstmt.setString(6, p.getPatEmail());
			pstmt.setString(7, p.getPatAddress());
			pstmt.setString(8, p.getPatNo());
			
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
	
	public int displayDelete(Connection conn, Patient p) throws MMSException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from patient where pat_no = ?";
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPatNo());
			
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

	public int loginPatient(Connection conn, String patId, String patPw) throws MMSException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "select * from patient where pat_id = ? and pat_pw = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, patId);
			pstmt.setString(2, patPw);
			
			result = pstmt.executeUpdate();
			
			if(result == 0)
				throw new MMSException("잘못된 ID 혹은 PW 입니다.");
		} catch (Exception e) {
			throw new MMSException(e.getMessage());
		} finally {
			close(pstmt);
		}
				
		return result;
	}	
}
