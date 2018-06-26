package mms.view;

import java.awt.Color;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class PatientView extends JFrame implements ActionListener{
	private JPanel panel;
	private JLabel mainLabel, mLabel;
	private JButton appBtn, chatBtn, myinfoBtn;
	private ImageIcon mainLogo, main_logo, mLogo, m_logo, appImageBtn, chatImageBtn, myinfoImageBtn;
	private Image image1, image2, icon;
	
	
	public PatientView(){
		this.setTitle("MMS");		
		this.setBounds(200, 200, 400, 600);
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);

		// 아이콘 설정
		Toolkit tk = Toolkit.getDefaultToolkit();
		icon = tk.getImage("image/mms_icon.png");
		this.setIconImage(icon);
		
		panel = new JPanel();
		panel.setBackground(Color.white);
		panel.setLayout(null);
		
		mainLogo = new ImageIcon("image/logo.png");
		// image 크기 조절해 새로운 객체생성
		image1 = mainLogo.getImage().getScaledInstance(300, 100, Image.SCALE_SMOOTH);
		// 다시 ImageIcon 객체 생성
		main_logo = new ImageIcon(image1);
		mainLabel = new JLabel(main_logo);
		mainLabel.setBounds(40, 70, 300, 100);
		panel.add(mainLabel);
		
		appImageBtn = new ImageIcon("image/app.png");
		appBtn = new JButton(appImageBtn);
		appBtn.setBounds(70,190,120,150);
		appBtn.addActionListener(this);
		
		chatImageBtn = new ImageIcon("image/chat.png");
		chatBtn = new JButton(chatImageBtn);
		chatBtn.setBounds(200,190,120,150);
		chatBtn.addActionListener(this);
		
		myinfoImageBtn = new ImageIcon("image/myinfo.png");
		myinfoBtn = new JButton(myinfoImageBtn);
		myinfoBtn.setBounds(70,350,120,150);
		myinfoBtn.addActionListener(this);
				
		mLogo = new ImageIcon("image/m.png");
		image2 = mLogo.getImage().getScaledInstance(120, 150, Image.SCALE_SMOOTH);
		m_logo = new ImageIcon(image2);
		mLabel = new JLabel(m_logo);
		mLabel.setBounds(200, 350, 120, 150);
		
		panel.add(appBtn);
		panel.add(chatBtn);
		panel.add(myinfoBtn);		
		panel.add(mLabel);		
		
		this.add(panel);
		this.setResizable(false);
		this.setVisible(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == appBtn){
			new AppointmentView().setVisible(true);
		}
		else if(e.getSource() == chatBtn){
			new PChatView().setVisible(true);
		}
		else if(e.getSource() == myinfoBtn){
			new UpdateView().setVisible(true);
		}
	}

}