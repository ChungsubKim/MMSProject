package mms.view;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.TableModel;

public class PSearchView extends JFrame{
	
	private TableModel dataModel;
	
	public PSearchView(){
		
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		this.setTitle(" MMS 환자검색");
		this.setBounds(100, 100, 1100, 700);
		JPanel totalPane = new JPanel();
		totalPane.setLayout(null);
		
		JPanel northPane = new JPanel();
		northPane.setBackground(Color.WHITE);
		northPane.setBounds(0, 0, 1100, 200);
		northPane.setLayout(null);
		
		JPanel TitlePane = new JPanel();
		JLabel TitleLabel = new JLabel("환자 검색");
		TitleLabel.setFont(new Font("돋음", Font.BOLD, 40));
		TitlePane.add(TitleLabel);
		TitlePane.setBounds(0, 20, 250, 100);
		TitlePane.setBackground(Color.WHITE);
		northPane.add(TitlePane);
		
		JLabel PatientNameLabel = new JLabel("환자명 : ");
		PatientNameLabel.setFont(new Font("돋음", Font.BOLD, 20));
		PatientNameLabel.setBounds(10, 113, 100, 80);
		JTextField PatientNameText = new JTextField();
		PatientNameText.setBounds(100, 140, 80, 30);
		northPane.add(PatientNameLabel);
		northPane.add(PatientNameText);
		
		JLabel PatientNoLabel = new JLabel("회원코드 : ");
		PatientNoLabel.setFont(new Font("돋음", Font.BOLD, 20));
		PatientNoLabel.setBounds(200, 113, 110, 80);
		JTextField PatientNoText = new JTextField();
		PatientNoText.setBounds(310, 140, 80, 30);
		northPane.add(PatientNoLabel);
		northPane.add(PatientNoText);
		
		JLabel PatientSsnLabel = new JLabel("주민등록번호 : ");
		PatientSsnLabel.setFont(new Font("돋음", Font.BOLD, 20));
		PatientSsnLabel.setBounds(410, 113, 150, 80);
		JTextField PatientSsnText = new JTextField();
		PatientSsnText.setBounds(560, 140, 160, 30);
		northPane.add(PatientSsnLabel);
		northPane.add(PatientSsnText);
		
		JLabel PatientPhoneLabel = new JLabel("전화번호 : ");
		PatientPhoneLabel.setFont(new Font("돋음", Font.BOLD, 20));
		PatientPhoneLabel.setBounds(730, 113, 130, 80);
		JTextField PatientPhoneText = new JTextField();
		PatientPhoneText.setBounds(840, 140, 140, 30);
		northPane.add(PatientPhoneLabel);
		northPane.add(PatientPhoneText);
		
		
		
		
		
		JButton SearchBtn = new JButton("검색");
		
		SearchBtn.setBounds(990, 130, 80, 50);
		northPane.add(SearchBtn);
		
		
		
		
		
		
		
		JPanel southPane = new JPanel();
		southPane.setBackground(Color.WHITE);
		southPane.setBounds(0, 200, 1100, 500);
		
		JTable listTable = new JTable(displayList());
		JScrollPane tablePane = new JScrollPane(listTable);
		listTable.setFillsViewportHeight(true);
		listTable.setAutoCreateRowSorter(true);
		
		tablePane.setPreferredSize(new Dimension(1100, 400));
		
		
		
		southPane.add(tablePane);
		
		
		JButton BackBtn = new JButton("뒤로가기");
		BackBtn.setBounds(530, 600, 300, 170);
		southPane.add(BackBtn);
		
		totalPane.add(northPane);
		totalPane.add(southPane);
		this.add(totalPane);
		
		this.setVisible(true);
		
	}
	
	private TableModel displayList(){
		
		// 제목행
		String[] columnNames = {"회원코드", "이름", "성별", "주민등록번호", "전화번호", "이메일"};
		
		
		return dataModel;
	}
	
	
	
}
