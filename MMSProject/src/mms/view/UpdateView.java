package mms.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import mms.controller.PatientController;

public class UpdateView extends JFrame implements ActionListener{
	private JPanel panel;
	private JButton nameBtn, addressBtn, emailBtn, idBtn, pcodeBtn, phoneBtn, pwBtn, pwconBtn, ssnBtn, updateBtn, withdrawBtn, backBtn;
	private JLabel nameLabel, addressLabel, emailLabel, idLabel, pcodeLabel, phoneLabel, pwLabel, 
							pwconLabel, ssnLabel, imageLabel, titleLabel, updateLabel;
	private JTextField nameTF, addressTF, emailTF, idTF, pcodeTF, phoneTF, pwTF, pwconTF, ssnTF;
	private ImageIcon updateImageBtn, withdrawImageBtn, originLogo, logo, backImageBtn;
	private Image image, changeImage;
	private String id;
	private String pw;
	
	public UpdateView(){
		this.setTitle("수정 / 탈퇴");
		this.setBounds(600, 0, 600, 1000);
		this.setDefaultCloseOperation(this.DISPOSE_ON_CLOSE);
		
		panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setLayout(null);
		
		originLogo = new ImageIcon("image/mms_logo.png");
		image = originLogo.getImage(); //ImageIcon에서 image추출
		changeImage = image.getScaledInstance(300, 100, Image.SCALE_SMOOTH); // image 크기 조절해 새로운 객체생성
		logo = new ImageIcon(changeImage); // 다시 ImageIcon 객체 생성
		
		imageLabel = new JLabel(logo);
		imageLabel.setBounds(20, 40, 300, 100);
		panel.add(imageLabel);
		
		titleLabel = new JLabel("정보 보기/ 수정 / 삭제");
		titleLabel.setFont(new Font("돋움", Font.BOLD, 18));
		titleLabel.setBounds(350, 40, 500, 100);
		panel.add(titleLabel);
		
	
		
		nameLabel = new JLabel("이름  ");
		nameLabel.setFont(new Font("돋움", Font.BOLD, 20));
		nameLabel.setBounds(60, 190, 100, 40);
		nameTF = new JTextField(20);
		nameTF.setBounds(210, 190, 250, 40);
		
		panel.add(nameLabel);
		panel.add(nameTF);
		
		
	
		ssnLabel = new JLabel("주민번호");
		ssnLabel.setFont(new Font("돋움", Font.BOLD, 20));
		ssnLabel.setBounds(60, 250, 100, 40);
		ssnTF = new JTextField(20);
		ssnTF.setBounds(210, 250, 250, 40);
		panel.add(ssnLabel);
		panel.add(ssnTF);
		
		pcodeLabel = new JLabel("환자코드");
		pcodeLabel.setFont(new Font("돋움", Font.BOLD, 20));
		pcodeLabel.setBounds(60, 310, 100, 40);
		pcodeTF = new JTextField(20);
		pcodeTF.setBounds(210, 310, 250, 40);
		panel.add(pcodeLabel);
		panel.add(pcodeTF);
		
		idLabel = new JLabel("아이디");
		idLabel.setFont(new Font("돋움", Font.BOLD, 20));
		idLabel.setBounds(60, 390, 100, 40);
		idTF = new JTextField(20);
		idTF.setBounds(210, 390, 250, 40);
		panel.add(idLabel);
		panel.add(idTF);
		
		pwLabel = new JLabel("비밀번호");
		pwLabel.setFont(new Font("돋움", Font.BOLD, 20));
		pwLabel.setBounds(60, 450, 100, 40);
		pwTF = new JTextField(20);
		pwTF.setBounds(210, 450, 250, 40);
		panel.add(pwLabel);
		panel.add(pwTF);
		
		pwconLabel = new JLabel("비밀번호확인");
		pwconLabel.setFont(new Font("돋움", Font.BOLD, 20));
		pwconLabel.setBounds(60, 510, 160, 40);
		pwconTF = new JTextField(20);
		pwconTF.setBounds(210, 510, 250, 40);
		panel.add(pwconLabel);
		panel.add(pwconTF);
		
		phoneLabel = new JLabel("연락처");
		phoneLabel.setFont(new Font("돋움", Font.BOLD, 20));
		phoneLabel.setBounds(60, 570, 160, 40);
		phoneTF = new JTextField(20);
		phoneTF.setBounds(210, 570, 250, 40);
		panel.add(phoneLabel);
		panel.add(phoneTF);
		
		addressLabel = new JLabel("주소");
		addressLabel.setFont(new Font("돋움", Font.BOLD, 20));
		addressLabel.setBounds(60, 630, 160, 40);
		addressTF = new JTextField(20);
		addressTF.setBounds(210, 630, 250, 40);
		panel.add(addressLabel);
		panel.add(addressTF);
		
		emailLabel = new JLabel("이메일");
		emailLabel.setFont(new Font("돋움", Font.BOLD, 20));
		emailLabel.setBounds(60, 690, 160, 40);
		emailTF = new JTextField(20);
		emailTF.setBounds(210, 690, 250, 40);
		panel.add(emailLabel);
		panel.add(emailTF);
		
		updateImageBtn = new ImageIcon("image/update.png");
		updateBtn = new JButton(updateImageBtn);
		updateBtn.setBackground(Color.white);
		updateBtn.setBounds(130, 800, 100, 40);
		panel.add(updateBtn);
		updateBtn.addActionListener(this);
		
		withdrawImageBtn = new ImageIcon("image/withdraw.png");
		withdrawBtn = new JButton(withdrawImageBtn);
		withdrawBtn.setBackground(Color.white);
		withdrawBtn.setBounds(350, 800, 100, 40);
		panel.add(withdrawBtn);
		withdrawBtn.addActionListener(this);
		
		backImageBtn = new ImageIcon("image/back.png");
		backBtn = new JButton(backImageBtn);
		backBtn.setBackground(Color.white);
		backBtn.setBounds(240, 870, 100, 40);
		panel.add(backBtn);
		backBtn.addActionListener(this);
		
		
		
		this.add(panel);
		this.setVisible(true);
		
	}

	
	@Override
	public void actionPerformed(ActionEvent event) {
		if(event.getSource() == updateBtn){
			JOptionPane.showMessageDialog(null, "수정되었습니다.");
		}
		else if(event.getSource() == withdrawBtn){
			JOptionPane.showMessageDialog(null, "탈퇴되었습니다.");
			
		}
		else if(event.getSource() == backBtn){
			PatientView pw = new PatientView();
			pw.setVisible(true);
			this.setVisible(false);
		}


	}

}
