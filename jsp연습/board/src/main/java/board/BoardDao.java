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
	
	// 삽입(C)
	public int insert(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into \"BOARD\" (\"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\") values (\"BOARD_SEQ\".nextval, ?,?,?,sysdate,0)";
		int ret = -1;
		try {
			con = ju.getConnection(); // 데이터베이스 유무 확인
			pstmt = con.prepareStatement(query); // 쿼리문 선언
			pstmt.setString(1, vo.getTitle()); // 첫번째 ? 에 값 세팅
			pstmt.setString(2, vo.getWriter()); // 두번째 ? 에 값 세팅 
			pstmt.setString(3, vo.getContent()); // 세번째 ? 에 값 세팅
			ret = pstmt.executeUpdate(); // 쿼리 실행 (업데이트)
		}catch(SQLException e) { // 데이터베이스 오류 (데이터베이스 연결, 쿼리문, 데이터 처리 등)
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close(); // 데이터베이스와 연결 끊기
				} catch(SQLException e) { 
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close(); // 데이터베이스와 연결 끊기
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	// 조회(R)
	public List<BoardVo> selectAll(){
		Connection con = null;
		Statement stmt = null; 
		ResultSet rs = null;
		String query = "select \"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\" from \"BOARD\" order by \"NUM\" desc";
		ArrayList<BoardVo> ls = new ArrayList<BoardVo>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query); // 쿼리 실행
			while(rs.next()) {
				BoardVo vo = new BoardVo(  // 리스트에 생성했던 데이터베이스 하나씩 담기위해 값 저장
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						new Date(rs.getTimestamp(5).getTime()),
						rs.getInt(6));
				ls.add(vo); // 저장했던 값 리스트에 저장
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ls;
	}
	
	// 조회(R)
	public BoardVo selectOne(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select \"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\" from \"BOARD\" where \"NUM\"=?";
		BoardVo vo = null;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
//				updateCnt(rs.getInt(1)); // 조회수 증가 여기서 증가하면 수정할때도 값이 증가함
				vo = new BoardVo(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						new Date(rs.getTimestamp(5).getTime()),
						rs.getInt(6));
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return vo;
	}
	
	// 수정(U)
	public int update(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"BOARD\" set \"TITLE\"=?,\"CONTENT\"=? where \"NUM\"=?";
		int ret = -1;
		try {
			con = ju.getConnection(); // 데이터베이스 유무 확인
			pstmt = con.prepareStatement(query); // 쿼리문 선언
			pstmt.setString(1, vo.getTitle()); // 첫번째 ? 에 값 세팅
			pstmt.setString(2, vo.getContent()); // 두번째 ? 에 값 세팅 
			pstmt.setInt(3, vo.getNum()); // 세번째 ? 에 값 세팅
			ret = pstmt.executeUpdate(); // 쿼리 실행 (업데이트)
		}catch(SQLException e) { // 데이터베이스 오류 (데이터베이스 연결, 쿼리문, 데이터 처리 등)
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close(); // 데이터베이스와 연결 끊기
				} catch(SQLException e) { 
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close(); // 데이터베이스와 연결 끊기
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	// 조회수 증가
	public int updateCnt(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"BOARD\" set \"CNT\" = \"CNT\" + 1 where \"NUM\"=?";
		int ret = -1;
		try {
			con = ju.getConnection(); // 데이터베이스 유무 확인
			pstmt = con.prepareStatement(query); // 쿼리문 선언
			pstmt.setInt(1, num); // 지울 데이터의 num값
			ret = pstmt.executeUpdate(); // 쿼리 실행 (업데이트)
		}catch(SQLException e) { // 데이터베이스 오류 (데이터베이스 연결, 쿼리문, 데이터 처리 등)
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close(); // 데이터베이스와 연결 끊기
				} catch(SQLException e) { 
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close(); // 데이터베이스와 연결 끊기
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	
	// 삭제(D)
	public int delete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from \"BOARD\" where \"NUM\"=?";
		int ret = -1;
		try {
			con = ju.getConnection(); // 데이터베이스 유무 확인
			pstmt = con.prepareStatement(query); // 쿼리문 선언
			pstmt.setInt(1, num); // 지울 데이터의 num값
			ret = pstmt.executeUpdate(); // 쿼리 실행 (업데이트)
		}catch(SQLException e) { // 데이터베이스 오류 (데이터베이스 연결, 쿼리문, 데이터 처리 등)
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close(); // 데이터베이스와 연결 끊기
				} catch(SQLException e) { 
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close(); // 데이터베이스와 연결 끊기
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	

}
