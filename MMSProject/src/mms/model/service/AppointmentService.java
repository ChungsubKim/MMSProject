package mms.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import mms.exception.MMSException;
import mms.model.dao.AppointmentDao;
import mms.model.dto.Appointment;
import static mms.common.JDBCTemplate.*;

public class AppointmentService {
	private AppointmentDao aDao = new AppointmentDao();
	
	public AppointmentService(){}
	
	public ArrayList<Appointment> selectList() throws MMSException{ // 전체 조회
		Connection conn = getConnection();
		ArrayList<Appointment> list = aDao.displayList(conn);
		close(conn);
		return list;
	}
	
	public int insertAppointment(Appointment a) throws MMSException{
		Connection conn = getConnection();
		int result = aDao.displayInsert(conn, a);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}		
	public int updateAppointment(Appointment a) throws MMSException{
		Connection conn = getConnection();
		int result = aDao.displayUpdate(conn, a);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}	
	public int deleteAppointment(Appointment a) throws MMSException{
		Connection conn = getConnection();
		int result = aDao.displayDelete(conn, a);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
}