package kh.board.model.service;

import java.sql.Connection;
import java.util.List;

import kh.board.model.dao.BoardDao;
import kh.board.model.vo.BoardVo;
import kh.common.jdbc.JdbcTemplate;

public class BoardService {
	public List<BoardVo> getBoardList(){
		List<BoardVo> result = null;
		Connection conn = JdbcTemplate.getConnection();
		result = new BoardDao().getBoardList(conn);
		System.out.println("srv:"+ result);
		JdbcTemplate.close(conn);
		return result;
	}
}
