package accountbook;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.*;


public class accountbook extends Frame implements ActionListener {
	
	public static final int NONE = 0;
	public static final int MEM_ADD = 1;
	public static final int INOUT = 2;
	public static final int TOTAL = 3;
	public static final int DELETE = 4;
	public static final int DEPOSIT = 5;
	public static final int DONATE = 6;
	public static final int SEARCH_MEM= 7;
	public static final int SEARCH_INOUT = 8;
	public static final int SEARCH_DONATE = 9;


	TextArea display;
	TextField user_id, user_nickname, SSN, tel;
	TextField income_or_expensses, card_or_cash, how_much, income_day, memo;// ,account,
																		// dp_amount,
																		// dn_amount;
	TextField account, dp_how_much, dn_how_much;
	Button mem_add, search_mem, inout, search_inout, total, delete, deposit, donate,search_donate, cancel;
	Connection conn;
	Statement stat;
	int cmd;

	public accountbook() {
		super("AccountBook");
		setLayout(new BorderLayout());

		display = new TextArea();
		display.setEditable(false);

		// Ÿ��Ʋ
		Panel title = new Panel();
		title.add(new Label("UserInfo"));
		Font f1 = new Font("����", Font.BOLD, 20);
		title.setFont(f1);
		title.setForeground(Color.blue);

		Panel title2 = new Panel();
		title2.add(new Label("����� �ۼ���"));
		title2.setFont(f1);
		title2.setForeground(Color.blue);

		Panel title3 = new Panel();
		title3.add(new Label("����ȸ ���"));
		title3.setFont(f1);
		title3.setForeground(Color.red);

		// �г� ����
		Panel left = new Panel();
		left.setLayout(new GridLayout(18, 1));

		// �гο� ���� �󺧵� �����ֱ�
		Panel p_user_id = new Panel();
		p_user_id.add(new Label("���̵�"));
		p_user_id.add(user_id = new TextField(10));

		Panel p_user_nickname = new Panel();
		p_user_nickname.add(new Label("�̸�"));
		p_user_nickname.add(user_nickname = new TextField(10));

		Panel p_SSN = new Panel();
		p_SSN.add(new Label("�ֹε�Ϲ�ȣ"));
		p_SSN.add(SSN = new TextField(10));

		Panel p_tel = new Panel();
		p_tel.add(new Label("��ȭ��ȣ"));
		p_tel.add(tel = new TextField(11));

		Panel p_income_or_expensses = new Panel();
		p_income_or_expensses.add(new Label("����/����"));
		p_income_or_expensses.add(income_or_expensses = new TextField(10));

		Panel p_card_or_cash = new Panel();
		p_card_or_cash.add(new Label("ī��/����"));
		p_card_or_cash.add(card_or_cash = new TextField(10));

		Panel p_how_much = new Panel();
		p_how_much.add(new Label("�ݾ�"));
		p_how_much.add(how_much = new TextField(10));
		
		Panel p_income_day = new Panel();
		p_income_day.add(new Label("�ŷ�����"));
		p_income_day.add(income_day = new TextField(10));

		Panel p_memo = new Panel();
		p_memo.add(new Label("�޸�"));
		p_memo.add(memo = new TextField(30));

		Panel p_account = new Panel();
		p_account.add(new Label("���¹�ȣ"));
		p_account.add(account = new TextField(10));

		Panel p_dp_how_much = new Panel();
		p_dp_how_much.add(new Label("�Ա� �ݾ�"));
		p_dp_how_much.add(dp_how_much = new TextField(10));

		Panel p_dn_how_much = new Panel();
		p_dn_how_much.add(new Label("��� �ݾ�"));
		p_dn_how_much.add(dn_how_much = new TextField(10));
		


		// �гο� �� �ٿ��ֱ�
		left.add(title);
		left.add(p_user_id);
		left.add(p_user_nickname);
		left.add(p_SSN);
		left.add(p_tel);
		
		left.add(search_mem = new Button("����� ��� Ȯ��"));
		search_mem.addActionListener(this);
		
		left.add(title2);
		left.add(p_income_or_expensses);
		left.add(p_card_or_cash);
		left.add(p_how_much);
		left.add(p_income_day);
		left.add(p_memo);
		
		left.add(search_inout = new Button("����ں� ����� ���� �˻�"));
		search_inout.addActionListener(this);

		left.add(title3);
		left.add(p_account);
		left.add(p_dp_how_much);
		left.add(p_dn_how_much);
		
		left.add(search_donate = new Button("����ȸ ��α� ��ü����"));
		search_donate.addActionListener(this);

		// �г� �Ʒ���
		Panel bottom = new Panel();
		bottom.add(mem_add = new Button("ȸ������"));
		mem_add.addActionListener(this);



		// �Ʒ��гο� ���� ��ư�� �����
		bottom.add(inout = new Button("�ŷ������߰�"));
		inout.addActionListener(this);

		bottom.add(total = new Button("��ü����γ�������"));
		total.addActionListener(this);

		bottom.add(delete = new Button("����γ�������"));
		delete.addActionListener(this);

		bottom.add(deposit = new Button("��αݾ��Ա�"));
		deposit.addActionListener(this);

		bottom.add(donate = new Button("����ڸ�ܵ��"));
		donate.addActionListener(this);

		bottom.add(cancel = new Button("���"));
		cancel.addActionListener(this);

		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				destroy();
				setVisible(false);
				dispose();
				System.exit(0);
			}
		});

		add("Center", display);
		add("West", left);
		add("South", bottom);
		cmd = NONE;
		init();
	}

	// ��� �����ϱ�
	private void init() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/account_book";
			conn = DriverManager.getConnection(url, "root", "2542");
			stat = conn.createStatement();
			initialize();
			System.out.println("DB���� �Ǿ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
	}

	public void initialize() {
		
		user_id.setEditable(false);
		user_nickname.setEditable(false);
		SSN.setEditable(false);
		tel.setEditable(false);

		income_or_expensses.setEditable(false);
		card_or_cash.setEditable(false);
		how_much.setEditable(false);
		income_day.setEditable(false);
		
		memo.setEditable(false);
		account.setEditable(false);
		dp_how_much.setEditable(false);
		dn_how_much.setEditable(false);

	}

	private void destroy() {
		try {
			if (stat != null) {
				stat.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception ex) {
		}
	}

	public void setEditable(int n) {
		switch (n) {

		case MEM_ADD:
			user_id.setEditable(true);
			user_nickname.setEditable(true);
			SSN.setEditable(true);
			tel.setEditable(true);
			break;

		case INOUT:
			memo.setEditable(true);
			user_id.setEditable(true);
			income_or_expensses.setEditable(true);
			card_or_cash.setEditable(true);
			how_much.setEditable(true);
			income_day.setEditable(true);
			break;

		case TOTAL:


			
		case DELETE:
			user_id.setEditable(true);
			break;

		case DEPOSIT:
			user_id.setEditable(true);
			account.setEditable(true);
			dp_how_much.setEditable(true);
			break;

		case DONATE:
			user_id.setEditable(true);
			dn_how_much.setEditable(true);
			break;
			
		case SEARCH_MEM:

			break;
			
			
		case SEARCH_INOUT:
			user_id.setEditable(true);
			
			break;
			
		case SEARCH_DONATE:
			user_id.setEditable(true);
			
			break;

	

		case NONE:

		}
	}

	public void setEnable(int n) {

		mem_add.setEnabled(false);
		inout.setEnabled(false);
		total.setEnabled(false);
		delete.setEnabled(false);
		deposit.setEnabled(false);
		donate.setEnabled(false);

		// cancel.setEnabled(false);

		switch (n) {

		case MEM_ADD:
			mem_add.setEnabled(true);
			setEditable(MEM_ADD);
			cmd = MEM_ADD;
			break;

		case INOUT:
			inout.setEnabled(true);
			setEditable(INOUT);
			cmd = INOUT;
			break;

		case TOTAL:
			total.setEnabled(true);
			setEditable(TOTAL);
			cmd = TOTAL;
			break;

		case DELETE:
			delete.setEnabled(true);
			setEditable(DELETE);
			cmd = DELETE;
			break;

		case DEPOSIT:
			deposit.setEnabled(true);
			setEditable(DEPOSIT);
			cmd = DEPOSIT;
			break;

		case DONATE:
			donate.setEnabled(true);
			setEditable(DONATE);
			cmd = DONATE;
			break;

		case SEARCH_MEM:
			search_mem.setEnabled(true);
			setEditable(SEARCH_MEM);
			cmd = SEARCH_MEM;
			break;

		case SEARCH_INOUT:
			search_inout.setEnabled(true);
			setEditable(SEARCH_INOUT);
			cmd = SEARCH_INOUT;
			break;
			
		case SEARCH_DONATE:
			search_donate.setEnabled(true);
			setEditable(SEARCH_DONATE);
			cmd = SEARCH_DONATE;
			break;

		case NONE:
			mem_add.setEnabled(true);
			inout.setEnabled(true);
			total.setEnabled(true);
			delete.setEnabled(true);
			deposit.setEnabled(true);
			donate.setEnabled(true);
			// cancel.setEnabled(true);

		}
	}

	public void clear() {
		user_id.setText("");
		user_nickname.setText("");
		SSN.setText("");
		tel.setText("");

		income_or_expensses.setText("");
		card_or_cash.setText("");
		how_much.setText("");
		income_day.setText("");
		memo.setText("");

		account.setText("");
		dp_how_much.setText("");
		dn_how_much.setText("");
	}

	public void actionPerformed(ActionEvent e) {
		ResultSet rs = null;
		Component c = (Component) e.getSource();
		try {

			if (c == inout) {
				if (cmd != INOUT)
					setEnable(INOUT);
				else {
					String s_income_day = income_day.getText().trim();
					String s_memo = memo.getText().trim();
					String s_user_id = user_id.getText().trim();
					String s_income_or_expensses = income_or_expensses.getText().trim();
					String s_card_or_cash = card_or_cash.getText().trim();
					String s_how_much = how_much.getText().trim();

					if (s_user_id == null 
							|| s_income_or_expensses == null
							|| s_card_or_cash == null 
							|| s_how_much == null
							|| s_income_day == null 
							|| s_memo == null
							|| s_user_id.length() == 0
							|| s_income_or_expensses.length() == 0
							|| s_card_or_cash.length() == 0
							|| s_how_much.length() == 0
							|| s_income_day.length() == 0
							|| s_memo.length() == 0)
						return;
					String sql = "insert into income_expenses values(?,?,?,?,?,?)";
					java.sql.PreparedStatement stat = conn
							.prepareStatement(sql);
					stat.setString(1, s_user_id);
					stat.setString(2, s_income_or_expensses);
					stat.setString(3, s_card_or_cash);
					stat.setString(4, s_how_much);
					stat.setString(5, s_income_day);
					stat.setString(6, s_memo);
					stat.executeUpdate();
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();

				}
			} else if (c == mem_add) {
				if (cmd != MEM_ADD)
					setEnable(MEM_ADD);
				else {

					String s_user_id = user_id.getText().trim();
					String s_user_nickname = user_nickname.getText().trim();
					String s_SSN = SSN.getText().trim();
					String s_tel = tel.getText().trim();
					if (s_user_id == null || s_user_nickname == null
							|| s_SSN == null || s_tel == null
							|| s_user_id.length() == 0
							|| s_user_nickname.length() == 0 || s_SSN.length() == 0
							|| s_tel.length() == 0)
						return;
					String sql = "insert into userinfo values(?,?,?,?)";
					// Statement�� �޼ҵ带 �̿��ؼ� SQL���� ����

					java.sql.PreparedStatement stat = conn
							.prepareStatement(sql);
					stat.setString(1, s_user_id);
					stat.setString(2, s_user_nickname);
					stat.setString(3, s_SSN);
					stat.setString(4, s_tel);
					stat.executeUpdate();
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();
				}

			} else if (c == total) {

				rs = stat.executeQuery("select * from income_expenses");
				display.append("============================================================================================="
						+ "\n");
				display.append(" ���̵�\t   ���� / ����\t   ī�� / ����\t\t   �� ��\t \t   �ŷ� ����\t \t   �� ��\t \n");
				display.append("============================================================================================="
						+ "\n");
				while (rs.next()) {
					String user_id = rs.getString(1);
					String income_or_expensses = rs.getString(2);
					String card_or_cash = rs.getString(3);
					String how_much = rs.getString(4);
					String income_day = rs.getString(5);
					String memo = rs.getString(6);

					display.append(user_id + " \t \t" + income_or_expensses + " \t \t"
							+ card_or_cash + " \t \t" + how_much + " \t \t"
							+ income_day + "  \t\t" + memo + "\n");
					System.out.println(user_id + " \t\t" + income_or_expensses + "\t \t"
							+ card_or_cash + "\t \t" + how_much + " \t\t"
							+ income_day + " \t\t" + memo + "\n");
				}
				setEnable(NONE);
				clear();
				cmd = NONE;
				initialize();

			} else if (c == delete) {
				if (cmd != DELETE)
					setEnable(DELETE);
				else {
					String s_user_id = user_id.getText().trim();
					if (s_user_id == null || s_user_id.length() == 0)
						return;
					stat.executeUpdate("delete from income_expenses where user_id='"
							+ s_user_id + "'");
					setEnable(NONE);
					clear();
					cmd = NONE;
				}
			}else if (c == search_mem) {
		
					rs = stat.executeQuery("select * from userinfo");
					display.append("======================================================================"
							+ "\n");
					display.append(" ���̵�\t\t   �� ��\t\t   �� �� �� �� �� ȣ \t  �� ȭ �� ȣ\t \t  \n");
					display.append("======================================================================"
							+ "\n");
					while (rs.next()) {
						String user_id = rs.getString(1);
						String user_nickname= rs.getString(2);
						String SSN = rs.getString(3);
						String tel = rs.getString(4);

						display.append(user_id + " \t \t" + user_nickname + " \t \t"
								+ SSN + " \t \t" + tel + " \t \t \n");
						System.out.println(user_id + " \t\t" + user_nickname + "\t \t"
								+ SSN + "\t \t" + tel + " \t\t\n");
					}
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();
					
			}else if (c == search_inout) {
				if (cmd != SEARCH_INOUT)
					setEnable(SEARCH_INOUT);
				else {
				
				String s_user_id = user_id.getText().trim();

				if (s_user_id == null 
						|| s_user_id.length() == 0)
					return;
				rs = stat.executeQuery("select * from income_expenses where user_id='"+s_user_id+"'");
				display.append("============================================================================================="
						+ "\n");
				display.append(" ���̵�\t   ���� / ����\t   ī�� / ����\t\t   �� ��\t \t   �ŷ� ����\t \t   �� ��\t \n");
				display.append("============================================================================================="
						+ "\n");
				while (rs.next()) {
					String user_id = rs.getString(1);
					String income_or_expenses = rs.getString(2);
					String card_or_cash = rs.getString(3);
					String how_much = rs.getString(4);
					String income_day = rs.getString(5);
					String memo = rs.getString(6);

					display.append(user_id + " \t \t" + income_or_expenses + " \t \t"
							+ card_or_cash + " \t \t" + how_much + " \t \t"
							+ income_day + "  \t\t" + memo + "\n");
					System.out.println(user_id + " \t\t" + income_or_expenses + "\t \t"
							+ card_or_cash + "\t \t" + how_much + " \t\t"
							+ income_day + " \t\t" + memo + "\n");
				}
				setEnable(NONE);
				clear();
				cmd = NONE;
				initialize();
			
				}
				
				
			} else if (c == deposit) {
				
				if (cmd != DEPOSIT)
					setEnable(DEPOSIT);
				else {
					
					String s_user_id = user_id.getText().trim();
					String s_account = account.getText().trim();
					String s_dp_how_much = dp_how_much.getText().trim();

					if (s_user_id == null || s_account == null
							|| s_dp_how_much == null || s_user_id.length() == 0
							|| s_account.length() == 0
							|| s_dp_how_much.length() == 0){

						return;
					}
				

						String sql = "insert into deposit values(?,?,?)";
						// Statement�� �޼ҵ带 �̿��ؼ� SQL���� ����

						java.sql.PreparedStatement stat = conn
								.prepareStatement(sql);
						stat.setString(1, s_user_id);
						stat.setString(2, s_account);
						stat.setString(3, s_dp_how_much);

						stat.executeUpdate();
						JOptionPane.showMessageDialog(getParent(), "����ȸ ��� �Ա��� ���̵�, ���¹�ȣ, ��αݾ��� �°� �Է����ּ���.");
						setEnable(NONE);
						clear();
						cmd = NONE;
						initialize();
			
				}
			} else if (c == donate) {
				if (cmd != DONATE)
					setEnable(DONATE);
				else {
					String s_user_id = user_id.getText().trim();
					String s_dn_how_much = dn_how_much.getText().trim();

					if (s_user_id == null 
							|| s_dn_how_much == null
							|| s_user_id.length() == 0
							|| s_dn_how_much.length() == 0)

						return;
					
			

					stat.executeUpdate("delete from deposit where user_id='"
							+ s_user_id + "'");
					String sql = "insert into donate values(?,?)";

					// Statement�� �޼ҵ带 �̿��ؼ� SQL���� ����

					java.sql.PreparedStatement stat = conn
							.prepareStatement(sql);

					stat.setString(1, s_user_id);
					stat.setString(2, s_dn_how_much);

					stat.executeUpdate();
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();

			
				}
			}else if (c == search_donate) {
				
				rs = stat.executeQuery("select * from donate");
				display.append("=============================="
						+ "\n");
				display.append(" I D\t\t   ��   ��\t\t  \n");
				display.append("=============================="
						+ "\n");
				while (rs.next()) {
					String user_id = rs.getString(1);
					String dn_how_much = rs.getString(2);

					display.append(user_id + " \t \t" + dn_how_much + " \n");
					System.out.println(user_id + " \t\t" + dn_how_much + " \n");
				
				}
				display.append("����ȸ�� ����� �ֽ� ������ �����մϴ�."+ "\n");
				setEnable(NONE);
				clear();
				cmd = NONE;
				initialize();

			} else if (c == cancel) {
				setEnable(NONE);
				initialize();
				cmd = NONE;
			}
		} catch (Exception ex) {
		}
		return;
	}

	public static void main(String args[]) {
		accountbook accountbook = new accountbook();
		accountbook.setSize(1000, 600);
		accountbook.setVisible(true);
	}
	
}
