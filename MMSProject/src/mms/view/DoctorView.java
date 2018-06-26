package mms.view;

import java.awt.Color;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class DoctorView extends JFrame implements ActionListener{
	private JPanel panel;
	private ImageIcon originLogo, logo, scheduleImageBtn, psearchImageBtn, dsearchImageBtn, mImageBtn, m_logo;
	private Image image, changeImage, image1;
	private JLabel imageLabel, mLabel;
	private JButton scheduleBtn, psearchBtn, dsearchBtn, mBtn;
	
	public DoctorView(){
		this.setTitle("관리자 메뉴");
		this.setBounds(200, 200, 350, 500);
		this.setDefaultCloseOperation(this.DISPOSE_ON_CLOSE);
		
		panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setLayout(null);
		
		originLogo = new ImageIcon("image/logo.png");
		image = originLogo.getImage();			//ImageIcon에서 image추출
		changeImage = image.getScaledInstance(300, 100, Image.SCALE_SMOOTH); 	// image 크기 조절해 새로운 객체생성
		logo = new ImageIcon(changeImage); // 다시 ImageIcon 객체 생성
		imageLabel = new JLabel(logo);
		imageLabel.setBounds(20, 70, 300, 100);
		panel.add(imageLabel);
		
		scheduleImageBtn = new ImageIcon("image/schedule.png");
		scheduleBtn = new JButton(scheduleImageBtn);
		scheduleBtn.setBackground(Color.WHITE);
		scheduleBtn.setBounds(40,190,115,115);
		scheduleBtn.addActionListener(this);
		
		
		psearchImageBtn = new ImageIcon("image/psearch.png");
		psearchBtn = new JButton(psearchImageBtn);
		psearchBtn.setBackground(Color.WHITE);
		psearchBtn.setBounds(195,190,115,115);
		psearchBtn.addActionListener(this);
		
		dsearchImageBtn = new ImageIcon("image/dsearch.png");
		dsearchBtn = new JButton(dsearchImageBtn);
		dsearchBtn.setBackground(Color.WHITE);
		dsearchBtn.setBounds(40,320,115,115);
		dsearchBtn.addActionListener(this);
		
		
		mImageBtn = new ImageIcon("image/m.png");
		image1 = mImageBtn.getImage().getScaledInstance(120, 150, Image.SCALE_SMOOTH);
		m_logo = new ImageIcon(image1);
		mLabel = new JLabel(m_logo);
		mLabel.setBounds(200, 350, 115, 115);
		
		
		panel.add(scheduleBtn);
		panel.add(psearchBtn);
		panel.add(dsearchBtn);
		panel.add(mLabel);
		
		this.add(panel);
		this.setVisible(true);
		
		

	}
	
	@Override
	public void actionPerformed(ActionEvent event) {
		if(event.getSource() == scheduleBtn){
			new ScheduleView().setVisible(true);
		}
		else if(event.getSource() == psearchBtn){
			new PSearchView().setVisible(true);
		}
		else if(event.getSource() == dsearchBtn){
			new DSearchView().setVisible(true);
		}
	}
}
