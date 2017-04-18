package yong.bbs.model;

import java.sql.*;

import java.util.*;

public class BbsDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BbsDAO() {
		System.out.println("BbsDAO 생성!");
	}
	/**리스트 가져오는 메서드*/
	public ArrayList<BbsDTO> getList(int cp, int ls){
		try {
			conn = yong.db.YongDB.getConn();
			String sql = "select b.* from (select rownum as rnum, a.* from (select * from jsp_bbs order by ref desc, lev,sunbun asc)a order by rnum)b where rnum>=?*(?-1)+1 and rnum<=?*?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, ls);
			ps.setInt(2, cp);
			ps.setInt(3, ls);
			ps.setInt(4, cp);
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				java.sql.Date writedate = rs.getDate("writerdate");
				int readnum = rs.getInt("readnum");
				int rnum = rs.getInt("rnum");
				
				BbsDTO dto = new BbsDTO(idx, writer, subject, content, writedate, readnum, rnum);
				arr.add(dto);
			}
			
			return arr;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**총 게시물 수 관련 메서드 (페이징)*/
	public int getPaging(){
		try{
			conn = yong.db.YongDB.getConn();
			String sql ="select count(*) from jsp_bbs";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int totalCnt=1;
			if(rs.next()){
				totalCnt = rs.getInt(1);
			}
			return totalCnt==0?1:rs.getInt(1);
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
	}
	
	/**글쓰기 메서드*/
	public int bbsWrite(BbsDTO dto){
		try{
			conn = yong.db.YongDB.getConn();
			int max = getMaxRef()+1;
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			System.out.println(dto.getWriter());
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.setInt(5, max);
			
			int count = ps.executeUpdate();
			
			return count;
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}finally {
			try{
				
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int getMaxRef(){
		try{
			
			String sql = "select max(ref) from jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max = 0;
			if(rs.next()){
				max = rs.getInt(1);
			}
			return max;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(rs!=null)rs.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**내용 가져오기*/
	public BbsDTO getContent(int idx){
		try{
			conn = yong.db.YongDB.getConn();
			String sql = "select * from jsp_bbs where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			BbsDTO bdto = null;
			int rn=0;
			if(rs.next()){
				
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				java.sql.Date writedate = rs.getDate("writerdate");
				String content = rs.getString("content");
				int readnum = rs.getInt("readnum");
				
				rn = addReadNum(idx,readnum);
				
				bdto = new BbsDTO(idx, writer, subject, content, writedate, readnum);
				
			}
			if(rn >0){
				return bdto;
			}else{
				return null;
			}	
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int addReadNum(int idx, int readnum){
		try{
			String sql = "update jsp_bbs set readnum=? where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, readnum+1);
			ps.setInt(2, idx);
			
			int result = ps.executeUpdate();
			
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
}




