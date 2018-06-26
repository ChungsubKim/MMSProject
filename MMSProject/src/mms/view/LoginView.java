package mms.view;

import java.awt.Color;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import mms.controller.PatientController;
import mms.model.dto.Patient;

public class LoginView extends JFrame implements ActionListener{
	private JTextField idTF;
	private JPasswordField pwdTF;
	private JLabel idLabel, pwdLabel, checkLabel, imageLabel;
	private JButton loginBtn, joinBtn, findBtn, confirmBtn;
	private ImageIcon originLogo, logo, loginImageBtn, joinImageBtn, findImageBtn, confirmImageBtn ;
	private JPanel panel;
	
	private Image image, changeImage;
	
	
	private PatientController pCon = new PatientController();
	
	
	private PatientView pv = new PatientView();
	
	
	
	public LoginView() {
		this.setTitle("");
		this.setBounds(100, 100, 350, 500);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		
		panel = new JPanel();
		panel.setBackground(Color.white);
		panel.setLayout(null);
		
		originLogo = new ImageIcon("image/mms_logo.png");
		image = originLogo.getImage(); //ImageIcon에서 image추출
		changeImage = image.getScaledInstance(300, 100, Image.SCALE_SMOOTH); // image 크기 조절해 새로운 객체생성
		logo = new ImageIcon(changeImage); // 다시 ImageIcon 객체 생성
		
		imageLabel = new JLabel(logo);
		imageLabel.setBounds(20, 70, 300, 100);
		panel.add(imageLabel);
	
		idLabel = new JLabel(" 아이디 ");
		idLabel.setBounds(40, 200, 100, 30);
		pwdLabel = new JLabel("비밀번호");
		pwdLabel.setBounds(40, 250, 100, 30);
		panel.add(idLabel);
		panel.add(pwdLabel);
		
		/*checkLabel = new JLabel("아이디와 비밀번호를 확인해주세요");
		checkLabel.setBounds(70, 290, 300, 30);
		checkLabel.setForeground(Color.RED);*/
		
		idTF = new JTextField(20);
		idTF.setBounds(130, 200, 170, 30);
		pwdTF = new JPasswordField(20);
		pwdTF.setBounds(130, 250, 170, 30);
		panel.add(idTF);
		panel.add(pwdTF);
		
		loginImageBtn = new ImageIcon("image/login.jpg");
		joinImageBtn = new ImageIcon("image/join.jpg");
		loginBtn = new JButton(loginImageBtn);
		loginBtn.setBounds(80, 330, 80, 40);
		joinBtn = new JButton(joinImageBtn);
		joinBtn.setBounds(188, 330, 80, 40);
		panel.add(loginBtn);
		panel.add(joinBtn);
		
		findImageBtn = new ImageIcon("image/find_idpw.jpg");
		findBtn = new JButton(findImageBtn);
		findBtn.setBounds(80, 380, 188, 40);
		panel.add(findBtn);
		
		loginBtn.addActionListener(this);
		joinBtn.addActionListener(this);
		findBtn.addActionListener(this);
		
		this.add(panel);		

		this.setResizable(false);
		this.setVisible(true);
	}
	


	@Override
	public void actionPerformed(ActionEvent event) {
		if(event.getSource() == loginBtn){

			if(pCon.loginPatient(idTF.getText(), String.valueOf(pwdTF.getPassword())) == 1){
				if(idTF.getText().equals("mms"))
					new DoctorView().setVisible(true); //관리자
				else{
					pv.setVisible(true); //일반회원
					
					
					//아이디로 객체 저장?
					pv.setInfo(idTF.getText());
					System.out.println("LoginView : " + pv.getInfo());
				}
			}
			
		}
		else if(event.getSource() == joinBtn){
			new JoinFrame().setVisible(true);
		}
		else if(event.getSource() == findBtn){
			new FindFrame().setVisible(true);
		}
		
		
		
	}
	
	//회원가입 내부클래스
	private class JoinFrame extends JFrame implements ActionListener{
		private JTextField idTF, nameTF, pidTF, phoneTF, addressTF;
		private JPasswordField pwd1TF, pwd2TF;
		private JLabel idLabel, pwd1Label, pwd2Label, nameLabel, pidLabel, phoneLabel, addressLabel,
						pidExLabel, phoneExLabel;
		private JButton checkIDBtn, joinBtn, cancelBtn;
		private ImageIcon checkIDImageBtn, joinImageBtn, cancelImageBtn;
		private JPanel panel;

		
		public JoinFrame(){
			this.setTitle("회원 가입");
			this.setBounds(200, 200, 420, 400);
			this.setDefaultCloseOperation(this.DISPOSE_ON_CLOSE);

			panel = new JPanel();
			panel.setBackground(Color.white);
			panel.setLayout(null);
			
			idLabel = new JLabel  ("아이디");
			idLabel.setBounds(20, 20, 100, 30);
			pwd1Label = new JLabel("비밀번호");
			pwd1Label.setBounds(20, 60, 100, 30);
			pwd2Label = new JLabel("비밀번호 확인");
			pwd2Label.setBounds(20, 100, 100, 30);
			nameLabel = new JLabel("이름");
			nameLabel.setBounds(20, 140, 100, 30);
			pidLabel = new JLabel("주민번호");
			pidLabel.setBounds(20, 180, 100, 30);
			addressLabel = new JLabel("주소");
			addressLabel.setBounds(20, 260, 100, 30);
			phoneLabel = new JLabel("전화번호");
			phoneLabel.setBounds(20, 220, 100, 30);
			
			pidExLabel = new JLabel("예) 000000-0000000");
			pidExLabel.setBounds(260, 180, 120, 30);
			phoneExLabel = new JLabel("예) 000-0000-0000");
			phoneExLabel.setBounds(260, 220, 120, 30);
					
			panel.add(idLabel);
			panel.add(pwd1Label);
			panel.add(pwd2Label);
			panel.add(nameLabel);
			panel.add(pidLabel);
			panel.add(phoneLabel);
			panel.add(addressLabel);
			panel.add(pidExLabel);
			panel.add(phoneExLabel);
			
			idTF = new JTextField(20);
			idTF.setBounds(130, 20, 100, 30);
			pwd1TF = new JPasswordField(30);
			pwd1TF.setBounds(130, 60, 100, 30);
			pwd2TF = new JPasswordField(30);
			pwd2TF.setBounds(130, 100, 100, 30);
			nameTF = new JTextField(20);
			nameTF.setBounds(130, 140, 100, 30);
			pidTF = new JTextField(25);
			pidTF.setBounds(130, 180, 120, 30);
			phoneTF = new JTextField(25);
			phoneTF.setBounds(130, 220, 120, 30);
			addressTF = new JTextField(40);
			addressTF.setBounds(130, 260, 200, 30);
			
			panel.add(idTF);
			panel.add(pwd1TF);
			panel.add(pwd2TF);
			panel.add(nameTF);
			panel.add(pidTF);
			panel.add(phoneTF);
			panel.add(addressTF);
					
			checkIDImageBtn = new ImageIcon("image/checkID.jpg");
			checkIDBtn = new JButton(checkIDImageBtn);
			checkIDBtn.setBounds(240, 20, 100, 30);
		
			joinImageBtn = new ImageIcon("image/join.jpg");
			joinBtn = new JButton(joinImageBtn);
			joinBtn.setBounds(90, 310, 80, 30);
			
			cancelImageBtn = new ImageIcon("image/cancel.jpg");
			cancelBtn = new JButton(cancelImageBtn);
			cancelBtn.setBounds(240, 310, 80, 30);	
			
			
			panel.add(checkIDBtn);
			panel.add(joinBtn);
			panel.add(cancelBtn);
			
			checkIDBtn.addActionListener(this);
			joinBtn.addActionListener(this);
			cancelBtn.addActionListener(this);
			
			this.add(panel);
			
			this.setResizable(false);
			this.setVisible(true);
		}

		@Override
		public void actionPerformed(ActionEvent event) {
			
			if(event.getSource() == checkIDBtn){ //아이디 중복 검사
				
				for(int i = 0; i < pCon.selectList().size(); i++){
					if(idTF.getText().equals(pCon.selectList().get(i).getPatId())){
						JOptionPane.showMessageDialog(null, "이미 존재하는 아이디입니다.", "알림", JOptionPane.ERROR_MESSAGE);
						break;
					}//if close					
				}//for close
				
				//중복 아닐시 
//				JOptionPane.showMessageDialog(null, "사용가능한 아이디 입니다.", "알림", JOptionPane.ERROR_MESSAGE);

			}
			else if(event.getSource() == joinBtn){
				
			}
			else if(event.getSource() == cancelBtn){
				this.setVisible(false);
			}
			
		}
		
	}
	
	
	//	아이디/비번찾기 내부클래스
	private class FindFrame extends JFrame{
		private JLabel label1, label2, pidExLabel;
		private JButton button1, button2;
		private JTextField tf1, tf2;
		private JPanel panel;
		
		public FindFrame(){
			this.setTitle("아이디 비밀번호 찾기");
			this.setBounds(200, 200, 420, 400);
			this.setDefaultCloseOperation(this.DISPOSE_ON_CLOSE);

			panel = new JPanel();
			panel.setBackground(Color.white);
			panel.setLayout(null);
			
			label1 = new JLabel("이름");
			label1.setBounds(20, 60, 100, 30);
			label2 = new JLabel("주민번호");
			label2.setBounds(20, 100, 100, 30);		
			panel.add(label1);
			panel.add(label2);
			
			tf1 = new JTextField(30);
			tf1.setBounds(130, 60, 100, 30);
			tf2 = new JTextField(30);
			tf2.setBounds(130, 100, 110, 30);	
			panel.add(tf1);
			panel.add(tf2);
			
			confirmImageBtn = new ImageIcon("image/confirm.png");
			confirmBtn = new JButton(confirmImageBtn);
			confirmBtn.setBounds(260, 300, 100,30);
			panel.add(confirmBtn);
			
			
			
			pidExLabel = new JLabel("예) 000000-0000000");
			pidExLabel.setBounds(260, 100, 120, 30);		
			panel.add(pidExLabel);
			
			this.add(panel);
		
			this.setResizable(false);
			this.setVisible(true);
	}
		
	}

	
	
	
	

}
