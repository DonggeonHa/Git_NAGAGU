package com.spring.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.academy.ClassVO;
import com.spring.mapper.ChartMapper;

@Service("chartService")
public class ChartServiceImpl implements ChartService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int CountBoard(String selectDate) throws Exception {
		int countResult = 0;
		
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);

			//그 날짜의 게시글 수를 가져옴
			countResult = chartMapper.CountBoard(selectDate);
			
		} catch (Exception e) {
			throw new Exception("chart impl 에러", e);
		}
		
		return countResult;
		
	}

	@Override
	public ArrayList<ClassVO> PopularClass() throws Exception {
		ArrayList<ClassVO> popularList = null;
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			popularList = chartMapper.PopularClass();
			
		} catch (Exception e) {
			throw new Exception("chart class impl 에러", e);
		}
		
		
		return popularList;
	}

	@Override
	public int insertMemberCount(String selectDate) throws Exception {
		int countResult = 0;
		
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			//그 날짜의 게시글 수를 가져옴
			countResult = chartMapper.insertMemberCount(selectDate);
			
		} catch (Exception e) {
			throw new Exception("chart impl 에러", e);
		}
		
		return countResult;
	}

	@Override
	public int insertWSMemberCount(String selectDate) throws Exception {
		int countResult = 0;
		
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			//그 날짜의 게시글 수를 가져옴
			countResult = chartMapper.insertWSMemberCount(selectDate);
			
		} catch (Exception e) {
			throw new Exception("chart impl 에러", e);
		}
		
		return countResult;
	}
	
	
}
