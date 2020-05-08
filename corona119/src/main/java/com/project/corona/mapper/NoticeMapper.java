package com.project.corona.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.corona.vo.BoardVO;
import com.project.corona.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

//	List<NoticeVO> selectNoticeList();

	List<BoardVO> selectAllNotice();

}
