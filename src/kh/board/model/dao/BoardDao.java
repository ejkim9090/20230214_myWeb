package kh.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.board.model.vo.BoardVo;
import static kh.common.jdbc.JdbcTemplate.*;

public class BoardDao {

	public List<BoardVo> getBoardList(Connection conn){
		List<BoardVo> result = null;
		String sql = "select BOARD_NUM,BOARD_TITLE, BOARD_WRITER, BOARD_CONTENT "
				+ ", BOARD_ORIGINAL_FILENAME, BOARD_RENAME_FILENAME,BOARD_DATE "
				+ ", BOARD_LEVEL, BOARD_REF, BOARD_REPLY_SEQ,BOARD_READCOUNT from board "
				+ "  order by board_ref desc, board_reply_seq asc";
		// " 안에는 ; 없애야 함. \r\n 도 없애기"
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// 다중행
			result = new ArrayList<BoardVo>();
			while(rs.next()) {
				System.out.println("한행읽기");
				BoardVo vo = new BoardVo();
				vo.setBoardContent(rs.getString("board_Content"));
				vo.setBoardDate(rs.getDate("board_Date"));
				vo.setBoardLevel(rs.getInt("board_Level"));
				vo.setBoardNum(rs.getInt("board_Num"));
				vo.setBoardOriginalFilename(rs.getString("board_Original_Filename"));
				vo.setBoardReadcount(rs.getInt("board_Readcount"));
				vo.setBoardRef(rs.getInt("Board_Ref"));
				vo.setBoardRenameFilename(rs.getString("board_Rename_Filename"));
				vo.setBoardReplySeq(rs.getInt("board_Reply_Seq"));
				vo.setBoardTitle(rs.getString("board_Title"));
				vo.setBoardWriter(rs.getString("board_Writer"));
				result.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		System.out.println("dao:"+ result);	
		return result;
	}
}
