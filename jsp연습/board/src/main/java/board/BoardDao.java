package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JdbcUtil;

public class BoardDao {
	private JdbcUtil ju;
	
	// 삽입(C)
	public int insert(BoardVo vo) {
		Connection con;
		PreparedStatement pstmt;
		String query = "insert into \"BOARD\" (\"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\" values(\"BOARD_SEQ\".nextval, ?,?,?,sysdate,0)";
		int ret = -1;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			ret = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	// 수정(R)
	
	// 수정(U)
	
	// 삭제(D)
	
}
