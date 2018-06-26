package mms.controller;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import mms.model.dto.Appointment;
import mms.model.service.AppointmentService;

public class AppointmentController {
	private AppointmentService aService = new AppointmentService();
	
	public AppointmentController(){}
	
	public ArrayList<Appointment> selectList(){
		ArrayList<Appointment> list = null;
		
		try{
			list = aService.selectList();
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
	
	public int insertAppointment(Appointment a){
		int result = 0;
		try{
			result = aService.insertAppointment(a);
			if(result > 0)
				System.out.println("예약이 등록되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int updateAppointment(Appointment a){
		int result = 0;
		try{
			result = aService.updateAppointment(a);
			if(result > 0)
				System.out.println("예약이 수정되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int deleteAppointment(Appointment a){
		int result = 0;
		try{
			result = aService.deleteAppointment(a);
			if(result > 0)
				System.out.println("예약이 삭제되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}	
	
	
}
