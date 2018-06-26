package mms.controller;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import mms.model.dto.Patient;
import mms.model.service.PatientService;

public class PatientController {
	private PatientService pService = new PatientService();
	
	public PatientController(){}
	
	public ArrayList<Patient> selectList(){
		ArrayList<Patient> list = null;
		
		try{
			list = pService.selectList();
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
	
	public Patient selectPatient(String patNo){
		Patient p = null;
		
		try{
			p = pService.selectPatient(patNo);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return p;
	}
	
	public ArrayList<Patient> selectNo(String patNo){
		ArrayList<Patient> list = null;
		
		try{
			list = pService.selectNo(patNo);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
	
	public ArrayList<Patient> selectName(String patName){
		ArrayList<Patient> list = null;
		
		try{
			list = pService.selectName(patName);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
	
	public ArrayList<Patient> selectSsn(String patSsn){
		ArrayList<Patient> list = null;
		
		try{
			list = pService.selectSsn(patSsn);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
	
	public ArrayList<Patient> selectPhone(String patPhone){
		ArrayList<Patient> list = null;
		
		try{
			list = pService.selectPhone(patPhone);
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
	
	public int insertPatient(Patient p){
		int result = 0;
		
		try{
			result = pService.insertPatient(p);
			if(result > 0)
				System.out.println("회원이 등록되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int UpdatePatient(Patient p){
		int result = 0;
		
		try{
			result = pService.updatePatient(p);
			if(result > 0)
				System.out.println("회원 정보가 수정되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int DeletePatient(Patient p){
		int result = 0;
		
		try{
			result = pService.deletePatient(p);
			if(result > 0)
				System.out.println("회원이 삭제되었습니다.");
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "오류 발생", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	
	public int loginPatient(String patId, String patPw){
		int result = 0;
		
		try {
			result = pService.loginPatient(patId, patPw);
			if(result > 0)
				System.out.println("로그인 성공");
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "로그인 실패", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
}
