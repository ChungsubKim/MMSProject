package mms.model.dto;

public class Patient {
	public static final long serialVersionUID = 7L;
	private String patNo; // pk
	private String patId;
	private String patPw;
	private String patName;
	private String patPhone;
	private String patSsn;
	private String patEmail;
	private String patAddress;
	
	public Patient(){}
	
	public Patient(String patNo, String patId, String patPw, String patName, String patPhone, String patSsn,
			String patEmail, String patAddress) {
		super();
		this.patNo = patNo;
		this.patId = patId;
		this.patPw = patPw;
		this.patName = patName;
		this.patPhone = patPhone;
		this.patSsn = patSsn;
		this.patEmail = patEmail;
		this.patAddress = patAddress;
	}

	public String getPatNo() {
		return patNo;
	}

	public void setPatNo(String patNo) {
		this.patNo = patNo;
	}

	public String getPatId() {
		return patId;
	}

	public void setPatId(String patId) {
		this.patId = patId;
	}

	public String getPatPw() {
		return patPw;
	}

	public void setPatPw(String patPw) {
		this.patPw = patPw;
	}

	public String getPatName() {
		return patName;
	}

	public void setPatName(String patName) {
		this.patName = patName;
	}

	public String getPatPhone() {
		return patPhone;
	}

	public void setPatPhone(String patPhone) {
		this.patPhone = patPhone;
	}

	public String getPatSsn() {
		return patSsn;
	}

	public void setPatSsn(String patSsn) {
		this.patSsn = patSsn;
	}

	public String getPatEmail() {
		return patEmail;
	}

	public void setPatEmail(String patEmail) {
		this.patEmail = patEmail;
	}

	public String getPatAddress() {
		return patAddress;
	}

	public void setPatAddress(String patAddress) {
		this.patAddress = patAddress;
	}

	@Override
	public String toString() {
		return patNo + ", " + patId + ", " + patPw + ", " + patName + ", " + patPhone
				 + ", " + patSsn + ", " + patEmail + ", " + patAddress;
	}
	
	
}
