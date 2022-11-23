package com.record.model;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public class RecordService {
	private RecordDAO_interface dao ;
	
	public RecordService() {
		dao = new RecordDAO();
	}
	
	public RecordVO addRecord(Integer memberId, Integer ameId, Date recordDate, String recordStatime) {
		
		RecordVO recordVO = new RecordVO();
		recordVO.setMemberId(memberId);
		recordVO.setAmeId(ameId);
		recordVO.setRecordDate(recordDate);
		recordVO.setRecordStatime(recordStatime);
		
		dao.insert(recordVO);
		
		return recordVO;
	}
	
	public List<RecordVO> findByPrimaryKey(Integer member_Id) {
		return dao.findByPrimaryKey(member_Id);
	}
}
