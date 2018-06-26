package mms.model.dto;

public class Doctor {
	public static final long serialVersionUID = 7L;
	private String docNo; // pk
	private String docName;
	private int docRoom;
	private String deptNo; // fk
	private String deptName ;// 추가!!
	
	public Doctor(){}

	public Doctor(String docNo, String docName, int docRoom, String deptNo, String deptName) {
		super();
		this.docNo = docNo;
		this.docName = docName;
		this.docRoom = docRoom;
		this.deptNo = deptNo;
		this.deptName = deptName;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public int getDocRoom() {
		return docRoom;
	}

	public void setDocRoom(int docRoom) {
		this.docRoom = docRoom;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public String getDeptName() {
		return deptName;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	
	

	@Override
	public String toString() {
		return docNo + ", " + docName + ", " + docRoom + ", " + deptNo + ", " + deptName;
	}
	
		
}
