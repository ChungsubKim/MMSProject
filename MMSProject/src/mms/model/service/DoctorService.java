package mms.model.service;

import static mms.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import mms.exception.MMSException;
import mms.model.dao.DoctorDao;
import mms.model.dto.Doctor;

public class DoctorService {
	private DoctorDao dDao = new DoctorDao();
	
	public DoctorService(){}
	
	public ArrayList<Doctor> selectList() throws MMSException{
		Connection conn = getConnection();
		ArrayList<Doctor> list = dDao.displayList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Doctor> selectDept(String deptNo) throws MMSException{
		Connection conn = getConnection();
		ArrayList<Doctor> list = dDao.displayDept(conn, deptNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Doctor> selectName(String docName) throws MMSException{
		Connection conn = getConnection();
		ArrayList<Doctor> list = dDao.displayName(conn, docName);
		close(conn);
		return list;
	}
	
	public ArrayList<Doctor> selectDeptAll() throws MMSException{
		Connection conn = getConnection();
		ArrayList<Doctor> list = dDao.displayDeptAll(conn);
		close(conn);
		return list;
	}
	
	public Doctor selectRoom(String docRoom) throws MMSException{
		Connection conn = getConnection();
		Doctor d = dDao.displayRoom(conn, docRoom);
		close(conn);
		return d;
	}
	
	public int insertDoctor(Doctor d) throws MMSException{
		Connection conn = getConnection();
		int result = dDao.displayInsert(conn, d);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	public int updateDoctor(Doctor d) throws MMSException{
		Connection conn = getConnection();
		int result = dDao.displayUpdate(conn, d);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	public int deleteDoctor(Doctor d) throws MMSException{
		Connection conn = getConnection();
		int result = dDao.displayDelete(conn, d);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}	
}