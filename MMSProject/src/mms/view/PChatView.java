package mms.view;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class PChatView extends JDialog{
	
	private JTextArea tarea;
	private JTextField tfield;
	private JButton sendBtn;
	
	private BufferedReader input;
	private PrintWriter output;
	
	private Socket client;
	
	public PChatView(){
		this.setTitle("MMS");
		this.setBounds(700,200,500,500);
		Font textFont = new Font("굴림체", Font.PLAIN, 14);
		
		// 아이콘 설정
		Toolkit tk = Toolkit.getDefaultToolkit();
		Image icon = tk.getImage("mms_icon.png");
		this.setIconImage(icon);
		
		JPanel northPan = new JPanel();
		JLabel titleLabel = new JLabel("1:1 상담");
		titleLabel.setFont(new Font("굴림체", Font.BOLD, 30));
		northPan.add(titleLabel);
		
		tarea = new JTextArea();
		tarea.setSize(490, 400);
		tarea.setFont(textFont);
		JScrollPane chatPane = new JScrollPane(tarea);
		
		JPanel southPan = new JPanel();
		tfield = new JTextField(50);
		tfield.setFont(textFont);
		JLabel gap = new JLabel("        ");
		sendBtn = new JButton("전송");
		sendBtn.addActionListener(new sendBtnEvent());
		southPan.add(tfield);
		southPan.add(gap);
		southPan.add(sendBtn);		
		
		
		this.add(northPan, BorderLayout.NORTH);
		this.add(chatPane, BorderLayout.CENTER);
		this.add(southPan, BorderLayout.SOUTH);
		
		this.setVisible(true);
		
		connect();
		tarea.append("상담 대기 상태입니다.");
	}
	
	// 전송 버튼 클릭시 작동하는 이벤트 클래스
	public class sendBtnEvent implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			sendMessage();
			receiveMessage();
		}
		
	}
	
	//tfield에 입력된 메세지를  서버로 전송하는 메소드
	public void sendMessage(){
		// trim() : 글자 앞 뒤에 있는 공백 다듬어 오류 발생 방지
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss a");
		String time = sdf.format(today);
		
		String message = tarea.getText().trim();
		
		output.println(message);
		output.flush();
		tarea.append("["+time+"] "+message+"\n");
		
		if(message.equals("종료")){
			tarea.append("상담이 종료되었습니다.");
			
			try {
				input.close();
				output.close();
				client.close();
				
		 	} catch (IOException e) {
			e.printStackTrace();
		 	}
		}
	}
	
	// 서버가 보낸 메세지 받아서 tarea에 출력하는 메소드
	public void receiveMessage(){
		try {
			tarea.append("상담사 : "+input.readLine());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 연결
	public void connect(){
		int port = 9000;
		String serverIP = ""; //????????????
		
		try {
			Socket socket = new Socket(serverIP, port);
			
			if(socket != null)
				System.out.println("궁금하신 사항 말씀해주세요.");
			
			InputStream input = socket.getInputStream();
			OutputStream output = socket.getOutputStream();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(input));
			PrintWriter pw = new PrintWriter(output);
		
			// 키보드로 입력받아 서버로 전송
			Scanner sc = new Scanner(System.in);
			String receiveMsg = null;
			String sendMsg = null;
			
			while(true){
				System.out.print("문의 : ");
				sendMsg = sc.nextLine();
				pw.println(sendMsg);
				pw.flush();
				
				if(sendMsg.equals("종료")){
					break;
				}
				receiveMsg = br.readLine();
				System.out.println(receiveMsg);
			}
			System.out.println("상담을 종료합니다.");
			
			br.close();
			pw.close();
			input.close();
			output.close();
			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
