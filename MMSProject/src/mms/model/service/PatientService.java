package mms.model.service;

import static mms.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import mms.exception.MMSException;
import mms.model.dao.PatientDao;
import mms.model.dto.Patient;

public class PatientService {
	private PatientDao pDao = new PatientDao();
	
	public PatientService(){}
	
	public ArrayList<Patient> selectList() throws MMSException{
		Connection conn = getConnection();
		ArrayList<Patient> list = pDao.displayList(conn);
		close(conn);
		return list;
	}
	
	public Patient selectPatient(String patId) throws MMSException{
		Connection conn = getConnection();
		Patient p = pDao.displayPatient(conn, patId);
		close(conn);
		return p;
	}
	
	public ArrayList<Patient> selectNo(String patNo) throws MMSException{
		Connection conn = getConnection();
		ArrayList<Patient> list = pDao.displayNo(conn, patNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Patient> selectName(String patName) throws MMSException{
		Connection conn = getConnection();
		ArrayList<Patient> list = pDao.displayName(conn, patName);
		close(conn);
		return list;
	}
	
	public ArrayList<Patient> selectSsn(String patSsn) throws MMSException{
		Connection conn = getConnection();
		ArrayList<Patient> list = pDao.displaySsn(conn, patSsn);
		close(conn);
		return list;
	}
	
	public ArrayList<Patient> selectPhone(String patPhone) throws MMSException{
		Connection conn = getConnection();
		ArrayList<Patient> list = pDao.displayPhone(conn, patPhone);
		close(conn);
		return list;
	}

	public int insertPatient(Patient p) throws MMSException{
		Connection conn = getConnection();
		int result = pDao.displayInsert(conn, p);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	
	public int updatePatient(Patient p) throws MMSException{
		Connection conn = getConnection();
		int result = pDao.displayUpdate(conn, p);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	
	public int deletePatient(Patient p) throws MMSException{
		Connection conn = getConnection();
		int result = pDao.displayUpdate(conn, p);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	public int loginPatient(String patId, String patPw) throws MMSException {
		Connection conn = getConnection();
		int result = pDao.loginPatient(conn, patId, patPw);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

}
