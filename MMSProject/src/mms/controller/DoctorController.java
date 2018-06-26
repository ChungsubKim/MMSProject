package mms.controller;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import mms.model.dto.Doctor;
import mms.model.service.DoctorService;

public class DoctorController {
	private DoctorService dService = new DoctorService();
	
	public DoctorController(){}
	
	public ArrayList<Doctor> selectList(){
		ArrayList<Doctor> list = null;
		
		try{
			list = dService.selectList();
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}		
		return list;
	}
	
	public ArrayList<Doctor> selectName(String docName){
		ArrayList<Doctor> list = null;
		try{
			list = dService.selectName(docName);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}		
		return list;
	}
	
	public ArrayList<Doctor> selectDept(String deptNo){
		ArrayList<Doctor> list = null;
		try{
			list = dService.selectDept(deptNo);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}		
		return list;
	}
	
	public ArrayList<Doctor> selectDeptAll(){
		ArrayList<Doctor> list = null;
		try {
			list = dService.selectDeptAll();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}	
		return list;
	}
	
	
	public Doctor selectRoom(String docRoom){
		Doctor d = null;
		try {
			d = dService.selectRoom(docRoom);
		} catch (Exception e) {
			JOptionPane.showConfirmDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return d;
	}
	
	public int insertDoctor(Doctor d){
		int result = 0;
		
		try{
			result = dService.insertDoctor(d);
			if(result > 0)
				System.out.println("상품이 등록되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int UpdateDoctor(Doctor d){
		int result = 0;
		
		try{
			result = dService.updateDoctor(d);
			if(result > 0)
				System.out.println("상품이 수정되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int DeleteDoctor(Doctor d){
		int result = 0;
		
		try{
			result = dService.deleteDoctor(d);
			if(result > 0)
				System.out.println("상품이 삭제되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}

}
