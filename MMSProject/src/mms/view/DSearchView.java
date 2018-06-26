package mms.view;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.TableModel;




public class DSearchView extends JFrame{
	
	private TableModel dataModel;
	
	public DSearchView(){
		
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		this.setTitle(" MMS 의료진 조회 및 추가/삭제");
		this.setBounds(100, 100, 1100, 700);
		JPanel totalPane = new JPanel();
		totalPane.setLayout(null);
		
		JPanel northPane = new JPanel();
		northPane.setBackground(Color.WHITE);
		northPane.setBounds(0, 0, 1100, 200);
		northPane.setLayout(null);
		
		JPanel TitlePane = new JPanel();
		JLabel TitleLabel = new JLabel("의료진 조회 및 추가 / 삭제");
		TitleLabel.setFont(new Font("돋음", Font.BOLD, 40));
		TitlePane.add(TitleLabel);
		TitlePane.setBounds(0, 20, 600, 100);
		TitlePane.setBackground(Color.WHITE);
		northPane.add(TitlePane);
		
		JLabel NameLabel = new JLabel("의사명 : ");
		NameLabel.setFont(new Font("돋음", Font.BOLD, 20));
		NameLabel.setBounds(10, 113, 100, 80);
		JTextField NameText = new JTextField();
		NameText.setBounds(100, 140, 100, 30);
		northPane.add(NameLabel);
		northPane.add(NameText);
		
		JLabel DeptNameLabel = new JLabel("진료과 : ");
		DeptNameLabel.setFont(new Font("돋음", Font.BOLD, 20));
		DeptNameLabel.setBounds(240, 113, 100, 80);
		JTextField DeptNameText = new JTextField();
		DeptNameText.setBounds(330, 140, 100, 30);
		northPane.add(DeptNameLabel);
		northPane.add(DeptNameText);
		
		JLabel DoctorRoomLabel = new JLabel("진료실 : ");
		DoctorRoomLabel.setFont(new Font("돋음", Font.BOLD, 20));
		DoctorRoomLabel.setBounds(490, 113, 100, 80);
		JTextField DoctorRoomText = new JTextField();
		DoctorRoomText.setBounds(580, 140, 100, 30);
		northPane.add(DoctorRoomLabel);
		northPane.add(DoctorRoomText);
		
		JButton SearchBtn = new JButton("조회");
		
		SearchBtn.setBounds(800, 130, 80, 50);
		northPane.add(SearchBtn);
		
		JButton InsertBtn = new JButton("추가");
		
		InsertBtn.setBounds(890, 130, 80, 50);
		northPane.add(InsertBtn);
		
		JButton DeleteBtn = new JButton("삭제");
		DeleteBtn.addActionListener(new DeleteBtnEvent());
		DeleteBtn.setBounds(980, 130, 80, 50);
		northPane.add(DeleteBtn);
		
		
		
		
		
		
		
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
		String[] columnNames = {"의사번호", "의사명", "진료과", "진료실"};
		
		
		return dataModel;
	}
	
	public class DeleteBtnEvent implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			
		}
		
	}
	
	
	
}
