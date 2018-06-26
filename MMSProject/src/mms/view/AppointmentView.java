package mms.view;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import mms.controller.DoctorController;
import mms.controller.PatientController;
import mms.model.dto.Appointment;
import mms.model.dto.Doctor;
import mms.model.dto.Patient;

public class AppointmentView extends JFrame implements ActionListener{

	private PatientController pControll = new PatientController();
	private DoctorController dControll = new DoctorController();
	
	private JTable table;
	private TableModel model;
	private JScrollPane tablePane;	
	private JPanel appPane;
	private JTextField tfNote;
	private JComboBox cbYear, cbMonth, cbDay, cbHour;
	private JComboBox cbDept, cbDoc;
	private JButton backBtn, bookBtn, updateBtn;
	private JRadioButton yesBtn,noBtn;
	
	public AppointmentView(){		
		this.setTitle("MMS");		
		this.setBounds(new Rectangle(1000,700));
		this.setResizable(true);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		
		// 아이콘 설정
		Toolkit tk = Toolkit.getDefaultToolkit();
		Image icon = tk.getImage("image/mms_icon.png");
		this.setIconImage(icon);
		
		this.makeApp();
		this.makeTable();
		
		this.add(appPane, BorderLayout.NORTH);
		this.add(tablePane, BorderLayout.CENTER);
		
		JPanel backPane = new JPanel();
		backPane.setLayout(new FlowLayout());
		backBtn = new JButton("뒤로가기");
		backBtn.addActionListener(this);
		this.add(backBtn, BorderLayout.SOUTH);
		
		this.pack();
		this.setVisible(true);
	}

	public void makeApp() {
		
		this.appPane = new JPanel(new GridLayout(8,1));
		this.appPane.setSize(new Dimension(200,400));
		
		JPanel titlePane = new JPanel();
		JLabel titleLabel = new JLabel("유저 예약/검색");
		titleLabel.setFont(new Font("굴림체", Font.BOLD, 30));
		titleLabel.setHorizontalAlignment(JLabel.LEFT);		
		titlePane.add(titleLabel);
				
		JPanel gap1 = new JPanel();
		
		JPanel p1 = new JPanel();
		p1.setLayout(new FlowLayout());
		// ???????????????????????????????
		JLabel myLabel = new JLabel("이름 : "+" 주민번호 : "+" 성별 : "+" 나이 : "+"세");
		myLabel.setFont(new Font("굴림체", Font.BOLD, 15));
		p1.add("West", myLabel);
		
		JPanel p2 = new JPanel();
		p2.add(new JLabel("예약일     "));
		// 년
		String[] years = {"2018","2019","2020","2021","2022"};
		JComboBox cbYear = new JComboBox(years);
		p2.add(cbYear);
		p2.add(new JLabel("년  "));
		// 월
		String[] months = {"1","2","3","4","5","6","7","8","9","10","11","12"};
		JComboBox cbMonth = new JComboBox(months);
		p2.add(cbMonth);
		p2.add(new JLabel("월  "));
		// 일
		int count = 31;
		//int count = 0;
		/*switch(cbMonth){
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			count = 31;
			break;
		case 4: case 6: case 9: case 11:
			count = 30;
			break;
		default :
			count = 28;
			break;		
		}*/
		String[] days = new String[count];
		for(int i=0; i<days.length; i++){
			days[i] = String.valueOf(i+1);
		}
		JComboBox cbDay = new JComboBox(days);
		
		p2.add(cbDay);
		p2.add(new JLabel("일  "));		
		// 시
		String[] hours = {"10", "11", "12", "14", "15", "16"};
		JComboBox cbHour = null;
		cbHour = new JComboBox(hours);
		p2.add(cbHour);		
		p2.add(new JLabel("시"));
		
		JPanel p3 = new JPanel();
		p3.add(new JLabel("추가사항     "));
		tfNote = new JTextField(30);
		p3.add(tfNote);
		
		JPanel p4 = new JPanel();
		// 진료과
		p4.add(new JLabel("진료과 "));
		Object[] depts= null;
		for(int i=0; i<dControll.selectDeptAll().size(); i++){
			depts = dControll.selectDeptAll().toArray();
			//depts[i] = dControll.selectDeptAll().get(4).toString();
		}
		JComboBox cbDept = new JComboBox(depts);
		p4.add(cbDept);
		// 담당의
		p4.add(new JLabel("     담당의 "));
		Object[] docs = dControll.selectDeptAll().toArray();
		//Object[] docs = dControll.selectDocAll((String)cbDept.getSelectedItem()).toArray();
		JComboBox cbDoc = new JComboBox(docs);
		p4.add(cbDoc);
		
		JPanel p5 = new JPanel();
		p5.add(new JLabel("초진 여부"));
		yesBtn = new JRadioButton("예");
		noBtn = new JRadioButton("아니오");
		ButtonGroup group = new ButtonGroup();
		group.add(yesBtn);
		group.add(noBtn);
		JLabel gap = new JLabel("                    ");
		bookBtn = new JButton("예약");
		bookBtn.setSize(new Dimension(40,10));
		bookBtn.addActionListener(new BookBtnEvent());
		updateBtn = new JButton("수정");
		updateBtn.setSize(new Dimension(40,10));
		updateBtn.addActionListener(new UpdateBtnEvent());
		p5.add(yesBtn);
		p5.add(noBtn);
		p5.add(gap);
		p5.add(bookBtn);
		p5.add(updateBtn);
		
		appPane.add(titlePane);
		appPane.add(gap1);
		appPane.add(p1);
		appPane.add(p2);
		appPane.add(p3);
		appPane.add(p4);		
		appPane.add(p5);
	}

	public void makeTable() {
		table = new JTable(displayList());
		this.tablePane = new JScrollPane(table);
		
		this.table.setFillsViewportHeight(true); // 창 크기에 맞추기
		this.table.setAutoCreateRowSorter(true); // 행 자동 정렬
		
	}

	// 컨트롤러와 연결해서 요청한 결과 데이터 받는 메소드 작성
	// 전체 조회시 결과를 TableModel로 만들어 리턴처리함
	public TableModel displayList() {
		// 제목행 정의
		String columnNames[] = {"No.", "진료일시", "이름", "진료과", "담당의", "진단명", "초진여부"};
		
		ArrayList list = pControll.selectList();
		Object[][] data = new Object[list.size()][7];
		for(int i=0; i<list.size(); i++){
			data[i] = new Object[7];
			Appointment app = new Appointment();
			Patient pat = new Patient();
			Doctor doc = new Doctor();
			
			data[i][0] = app.getAppNo();
			data[i][1] = app.getAppDate();
			data[i][2] = pat.getPatName();
			data[i][3] = doc.getDeptName();
			data[i][4] = doc.getDocName();
			data[i][5] = app.getAppMemo();
			data[i][6] = app.getAppFirst();
			
		}		
		model = new DefaultTableModel(data, columnNames);
		
		return model;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == backBtn){
			// 뒤로가기 클릭시 적용되는 이벤트 처리
			PatientView patView = new PatientView();
			this.setVisible(false);
			patView.setVisible(true);
		}
		
	}
	
	// 예약하기 클릭시 적용되는 이벤트 처리 클래스
	public class BookBtnEvent implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			Doctor doc = new Doctor();
			Appointment app = new Appointment();
			Patient pat = new Patient();
			
			String year = (String)cbYear.getSelectedItem();
			String month = (String)cbMonth.getSelectedItem();
			String day = (String)cbDay.getSelectedItem();
			String hour = (String)cbHour.getSelectedItem();
			String dept = (String)cbDept.getSelectedItem();
			String doctor = (String)cbDoc.getSelectedItem();
			String first = null;
			if(yesBtn.isSelected())
				first = "Y";
			else if(noBtn.isSelected())
				first = "N";
			
			//app.setAppNo();
			//app.setAppDate();
			pat.getPatName();
			doc.setDeptName(dept);
			doc.setDocName(doctor);
			app.setAppMemo(tfNote.getText());			
			app.setAppFirst(first);
			
		}
		
	}
	
	// 수정버튼 클릭시 적용되는 이벤트 처리 클래스
	public class UpdateBtnEvent implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			Patient pat = new Patient();		
		
			
		}
	
	}
}
