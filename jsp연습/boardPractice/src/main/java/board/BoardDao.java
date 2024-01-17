package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.JdbcUtil;

public class BoardDao {
	private JdbcUtil ju;
	
	public BoardDao() {
		ju = JdbcUtil.getInstance();
	}
	// 삽입
	public int insert(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into \"BOARD\" (\"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\") values (\"BOARD_SEQ\".nextval, '?','?','?',sysdate,0)";
		int ret = -1;
		try {
			con = ju.getConnecction();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		} if (con != null) {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return ret;
	}
	
	// 조회
	public List<BoardVo> selectAll() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\" from \"BOARD\" order by \"NUM\" desc";
		
		ArrayList<BoardVo> ls = new ArrayList<BoardVo>();
		
		try {
			con = ju.getConnecction();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardVo vo = new BoardVo(
								rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								new Date(rs.getTimestamp(5).getTime()),
								rs.getInt(6)
								);
				ls.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
		} if (con != null) {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} if (stmt != null) {
		 	try {
		 		stmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} if (rs != null) {
			try {
				rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return ls;
	}
	
	// 수정

	// 삭제
	
}
