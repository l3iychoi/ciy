package yhPrj.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import yhPrj.dto.VO;


public class DAO {
	//DB 연결 부분
	public static Connection getConn() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "hr", "1234");
		System.out.println(" DB 연결");
		return con;
	}
	//DB 연결 해제
	public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//Login ID/Pwd DB비교
	public static int Login(VO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = " select id,pwd from yh where id = ? ";
	
		int result = 0;
		
		try {
			con = getConn();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				//사용자 입력 ID/PWD DB와 비교
				if(vo.getPwd().equals(rs.getString("pwd")) && vo.getId().equals(rs.getString("id"))) {
					result = 1;
				}else {
					result = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return result;
	}
	//DB에 접속해서 전체 결과를 List에 담는 과정 
	public static List<VO> rlist(){
		List<VO> rlist = new ArrayList<VO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql=" SELECT f.filenumber, f.fileowner, f.filename, f.filetype, f.filetime, P.resultcode FROM fileinfo F inner join predict P on f.filenumber = P.filenumber ";
		
		try {
			con=getConn();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setFilenumber(rs.getInt("filenumber"));
				vo.setFileowner(rs.getString("fileowner"));
				vo.setFilename(rs.getString("filename"));
				vo.setFiletype(rs.getString("filetype"));
				vo.setFiletime(rs.getString("filetime"));
				vo.setResultCode(rs.getString("resultCode"));
				rlist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return rlist;
	}
	//DB에 접속해서 기간 별로 결과를 List에 담는 과정
	public static List<VO> dlist(VO vv){
		List<VO> dlist = new ArrayList<VO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql=" SELECT f.filenumber, f.fileowner, f.filename, f.filetype, f.filetime, P.resultcode FROM fileinfo F inner join predict P on f.filenumber = P.filenumber where f.filetime between ? and ? ";
		
		try {
			con=getConn();
			ps=con.prepareStatement(sql);
			ps.setString(1, vv.getFdate() );
			ps.setString(2, vv.getBdate() );
			rs=ps.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setFilenumber(rs.getInt("filenumber"));
				vo.setFileowner(rs.getString("fileowner"));
				vo.setFilename(rs.getString("filename"));
				vo.setFiletype(rs.getString("filetype"));
				vo.setFiletime(rs.getString("filetime"));
				vo.setResultCode(rs.getString("resultCode"));
				dlist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return dlist;
	}
	
	//DB에 접속해서 기간 별로 결과를 List에 담는 과정
		public static List<VO> mlist(){
			List<VO> mlist = new ArrayList<VO>();
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String sql=" select * from yh order by usernumber";
			
			try {
				con=getConn();
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()) {
					VO vo = new VO();
					vo.setUsernumber(rs.getInt("usernumber"));
					vo.setUsername(rs.getString("username"));
					vo.setId(rs.getString("id"));
					vo.setManagement(rs.getString("management"));
					mlist.add(vo);
				}
			}catch (SQLException sqle) {
				sqle.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, ps, rs);
			}
			return mlist;
		}
	
	//파일 전송 총 횟수를 구하는 과정
	public static int TotalCount() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int tCount = 0;
		
		String sql = " select count(filenumber) as filenumber from fileinfo ";
		
		try {
			con=getConn();
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				tCount = rs.getInt("filenumber");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return tCount;
		
	}
	//파일 전송 횟수중 결과(사기값) 구하는 과정
	public static String resultCodeCount() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String fCount = null;
		
		String sql = " select count(resultCode) as resultCode from predict where resultCode = '1' ";
		
		try {
			con=getConn();
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				fCount = rs.getString("resultCode");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return fCount;
		
	}
	//특정 기간 동안 파일 전송 총 횟수를 구하는 과정 
	public static int DtotalCount(VO vv) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int tCount = 0;
		
		String sql = " select count(filenumber) as filenumber from (SELECT f.filenumber, f.fileowner, f.filename, f.filetype, f.filetime, P.resultcode FROM fileinfo F inner join predict P on f.filenumber = P.filenumber where f.filetime between ? and ?)";
		try {
			con=getConn();
			ps = con.prepareStatement(sql);
			ps.setString(1, vv.getFdate() );
			ps.setString(2, vv.getBdate() );
			rs=ps.executeQuery();
			while(rs.next()) {
				tCount = rs.getInt("filenumber");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return tCount;
		
	}
	//특정 기간 동안 결과(사기값) 구하는 과정 
	public static String DresultCodeCount(VO vv) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String fCount = null;
		
		String sql = " select count(resultCode) as resultCode from (SELECT f.filenumber, f.fileowner, f.filename, f.filetype, f.filetime, P.resultcode FROM fileinfo F inner join predict P on f.filenumber = P.filenumber where f.filetime between ? and ?) where resultCode = '1' ";
		
		try {
			con=getConn();
			ps = con.prepareStatement(sql);
			ps.setString(1, vv.getFdate() );
			ps.setString(2, vv.getBdate() );
			rs=ps.executeQuery();
			while(rs.next()) {
				fCount = rs.getString("resultCode");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return fCount;
	}
	
	public static void insertMember(VO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = " insert into yh (usernumber, id, pwd, username, management)SELECT NVL(MAX(usernumber),0)+1, ?, ?, ?, ? from yh ";
		
		try {
			con=getConn();
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getUsername());
			ps.setString(4, vo.getManagement());
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
	}
	
	public static VO detail(int usernumber) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		VO vo = new VO();
		
		String sql = " select * from yh where usernumber = ? ";
		
		try {
			con=getConn();
			ps = con.prepareStatement(sql);
			ps.setInt(1, usernumber);
			rs=ps.executeQuery();
			while(rs.next()) {
				vo.setUsernumber(rs.getInt("userNumber"));;
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setUsername(rs.getString("username"));
				vo.setManagement(rs.getString("management"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public static void update(VO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = " UPDATE yh set username =?, id =?, pwd = ? ,management=? WHERE usernumber =? ";
		
		try {
			con=getConn();
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getUsername());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getManagement());
			ps.setInt(5, vo.getUsernumber());
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
	}
	
	public static VO maxNO() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		VO vo = new VO();
		
		String sql=" select NVL(MAX(usernumber),0)+1 as usernumber from yh ";
		
		try {
			con=getConn();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				vo.setUsernumber(rs.getInt("usernumber"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		
		return vo;
		
	}
	
	public static void deleteMember(int usernumber) {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = " DELETE FROM yh WHERE usernumber = ? ";
		
		try {
			con = getConn();
			ps = con.prepareStatement(sql);
			ps.setInt(1, usernumber);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
	}
}
