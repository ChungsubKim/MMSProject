package mms.model.dto;

import java.sql.Date;

public class Appointment {
	public static final long serialVersionUID = 7L;
	private String appNo;
	private Date appDate;
	private String patNo; // fk
	private String appFirst;
	private String docNo; // fk
	private String deptNo; // fk
	private String appMemo;
	
	public Appointment(){}

	public Appointment(String appNo, Date appDate, String patNo, String appFirst, String docNo, String deptNo,
			String appMemo) {
		super();
		this.appNo = appNo;
		this.appDate = appDate;
		this.patNo = patNo;
		this.appFirst = appFirst;
		this.docNo = docNo;
		this.deptNo = deptNo;
		this.appMemo = appMemo;
	}

	public String getAppNo() {
		return appNo;
	}

	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public String getPatNo() {
		return patNo;
	}

	public void setPatNo(String patNo) {
		this.patNo = patNo;
	}

	public String getAppFirst() {
		return appFirst;
	}

	public void setAppFirst(String appFirst) {
		this.appFirst = appFirst;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getAppMemo() {
		return appMemo;
	}

	public void setAppMemo(String appMemo) {
		this.appMemo = appMemo;
	}

	@Override
	public String toString() {
		return appNo + ", " + appDate + ", " + patNo + ", " + appFirst 
				+ ", " + docNo + ", " + deptNo + ", " + appMemo;
	}
}