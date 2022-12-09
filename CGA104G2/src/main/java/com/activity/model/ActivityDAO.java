package com.activity.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;


import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;


@Repository
public class ActivityDAO implements ActivityDAO_interface {
	
	
	
	@PersistenceContext
	private Session session;
	

	// 有用
	@Override
	public Integer insert(ActivityVO activityVO) {
		

		try {
			beginTranscation();
			getSession().persist(activityVO);
			Integer id = activityVO.getActId();
			commit();
			return id;

		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return null;
		}

	}

	@Override
	public void update(ActivityVO activityVO) {
		
		 try {
			beginTranscation();	
			 ActivityVO vo= getSession().load(ActivityVO.class,activityVO.getActId());
			 vo.setActType(activityVO.getActType());
			 vo.setActName(activityVO.getActName());
			 vo.setActContent(activityVO.getActContent());
			 vo.setActMaxCount(activityVO.getActMaxCount());
			 vo.setActMinCount(activityVO.getActMinCount());
			 vo.setActStart(activityVO.getActStart());
			 vo.setActEnd(activityVO.getActEnd());
			 vo.setSignStart(activityVO.getSignStart());
			 vo.setSignEnd(activityVO.getSignEnd());
			 vo.setActCountry(activityVO.getActCountry());
			 vo.setActLocation(activityVO.getActLocation());
			 vo.setActCost(activityVO.getActCost());
			 commit();
		} catch (Exception e) {
		 e.printStackTrace();
		 rollback();
		 }

	}

	@Override
	public void delete(Integer actId) {
		
		try {
			beginTranscation();
			ActivityVO vo = new ActivityVO();
			vo.setActId(actId);
			getSession().remove(vo);
			commit();
		} catch (Exception e) {
			rollback();
		}

	}

	// 有用
	@Override
	public JSONArray search(String actCountry, Integer actType, String actName) {
		beginTranscation();
		final StringBuilder sql = new StringBuilder().append("SELECT * FROM ACTIVITY where ");
		if (actName.trim().length() != 0 && !(actName == null)) {
			sql.append(" " + "ACTIVITY_NAME" + " " + "like" + " " + '"' + "%" + actName + "%" + '"' + " " + "and");
		}
		if (actCountry.trim().length() != 0 && !(actCountry == null)) {
			sql.append(" " + "ACTIVITY_COUNTY" + " " + "=" + " " + '"' + actCountry + '"' + " " + "and");
		}
		if (!(actType == 0)) {
			sql.append(" " + "ACTIVITY_TYPE_ID" + " " + "=" + " " + actType + " " + "and");
		}
		sql.append(" " + "ACTIVITY_STATUS = 0");
		Encoder encoder = Base64.getEncoder();
		JSONArray array = new JSONArray();
		List<ActivityVO> list = getSession().createNativeQuery(sql.toString(), ActivityVO.class).list();
		for (ActivityVO vo : list) {
			JSONObject object = new JSONObject();
			object.put("activityId", vo.getActId());
			object.put("activityName", vo.getActName());
			object.put("activityStart", vo.getActStart());
			object.put("activityEnd", vo.getActEnd());
			object.put("activitySignst", vo.getSignStart());
			object.put("activitySignet", vo.getSignEnd());
			object.put("activityCurrent", vo.getActCurrentCount());
			object.put("activityMax", vo.getActMaxCount());
			object.put("actLocation", vo.getActCountry());
			if (vo.getPhotos().size() != 0) {
				String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
				object.put("photo", photo64);
			}
			array.put(object);
		}
		commit();
		return array;
	}

	// 有用
	@Override
	public ActivityVO getOne(Integer actId) {
		final String sql = "select * from ACTIVITY where ACTIVITY_ID = :actId ";
		ActivityVO vo = getSession().createNativeQuery(sql, ActivityVO.class).setParameter("actId", actId)
				.uniqueResult();
		return vo;

	}
	
	
	
	
	
	

	@Override
	public JSONObject getOneJS(Integer actId) {
		beginTranscation();
		final String sql = "select * from ACTIVITY where ACTIVITY_ID = :actId ";
		ActivityVO vo = getSession().createNativeQuery(sql, ActivityVO.class).setParameter("actId", actId)
				.uniqueResult();	
		Encoder encoder = Base64.getEncoder();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("actId",vo.getActId());
		jsonObject.put("actName", vo.getActName());
		jsonObject.put("actContent",vo.getActContent());
		jsonObject.put("actMaxCount",vo.getActMaxCount());
		jsonObject.put("actMinCount",vo.getActMinCount());
		jsonObject.put("signStart",vo.getSignStart());
		jsonObject.put("signEnd",vo.getSignEnd());
		jsonObject.put("actStart",vo.getActStart());
		jsonObject.put("actEnd",vo.getActEnd());
		jsonObject.put("actCountry",vo.getActCountry());
		jsonObject.put("actType",vo.getActType());
		jsonObject.put("actLocation",vo.getActLocation());
		jsonObject.put("actCost",vo.getActCost());
		if (vo.getPhotos().size() != 0) {
			String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
			jsonObject.put("photo", photo64);
		}		
		commit();
		return jsonObject;
	}

	@Override
	public JSONArray getById(Integer memberId) {
		beginTranscation();
		final String hql = "FROM ActivityVO WHERE  memberId= :id";
		Encoder encoder = Base64.getEncoder();
		JSONArray array = new JSONArray();
		List<ActivityVO> list = getSession().createQuery(hql, ActivityVO.class).setParameter("id", memberId).list();
		for (ActivityVO vo : list) {
			JSONObject object = new JSONObject();
			object.put("activityId", vo.getActId());
			object.put("activityName", vo.getActName());
			object.put("activityStart", vo.getActStart());
			object.put("activityEnd", vo.getActEnd());
			object.put("content", vo.getActContent());
			if (vo.getPhotos().size() != 0) {
				String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
				object.put("photo", photo64);
			}
			array.put(object);
		}
		commit();
		return array;
	}

	// 有用
	@Override
	public JSONArray findCountry() {
		beginTranscation();
		final String hql = "SELECT actCountry FROM ActivityVO GROUP BY actCountry ";
		List<String> list = getSession().createQuery(hql).list();
		JSONArray array = new JSONArray();
		for (String country : list) {
			System.out.println(country);
			JSONObject object = new JSONObject();
			object.put("actCountry", country);
			array.put(object);
		}
		commit();
		return array;
	}

	// 有用
	@Override
	public List<Integer> getAll() {
		beginTranscation();
		final String hql = "SELECT actId FROM ActivityVO WHERE actStatus = 0 order BY actId";
		List<Integer> list = getSession().createQuery(hql).list();
		commit();
		return list;

	}


	// 有用
	@Override
	public JSONArray getPage(Integer number) {
		beginTranscation();
		final StringBuilder sql = new StringBuilder().append("SELECT * FROM ACTIVITY  WHERE ACTIVITY_STATUS = 0 order by ACTIVITY_ID desc ");
		String first = Integer.toString(number * 3);
		sql.append(" " + "LIMIT" + " " + first + "," + "3");
		List<ActivityVO> list = getSession().createNativeQuery(sql.toString(), ActivityVO.class).list();
		JSONArray array = new JSONArray();
		Encoder encoder = Base64.getEncoder();
		for (ActivityVO vo : list) {
			JSONObject object = new JSONObject();
			object.put("activityId", vo.getActId());
			object.put("activityName", vo.getActName());
			object.put("activityStart", vo.getActStart());
			object.put("activityEnd", vo.getActEnd());
			object.put("activitySignst", vo.getSignStart());
			object.put("activitySignet", vo.getSignEnd());
			object.put("activityCurrent", vo.getActCurrentCount());
			object.put("activityMax", vo.getActMaxCount());
			object.put("actLocation", vo.getActCountry());
			if (vo.getPhotos().size() != 0) {
				String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
				object.put("photo", photo64);
			}
			array.put(object);
		}
		commit();
		return array;
	}

	// 有用
	@Override
	public void updateNumber(Integer actId, Integer number) {
		try {
			beginTranscation();
			final String sql = "SELECT ACTIVITY_CURRENT_COUNT FROM ACTIVITY WHERE  ACTIVITY_ID = :id";
			Integer count = (Integer) getSession().createNativeQuery(sql).setParameter("id", actId).uniqueResult();
			if(count == 0) {
			final String hql = " update ActivityVO SET actCurrentCount = :number where actId = :id  ";
			getSession().createQuery(hql).setParameter("number", number).setParameter("id", actId).executeUpdate();
			}else{
				Integer sum = count+number;	
				final String hql = " update ActivityVO SET actCurrentCount = :number where actId = :id  ";
				getSession().createQuery(hql).setParameter("number", sum).setParameter("id", actId).executeUpdate();
			}
			commit();
		} catch (Exception e) {
			rollback();
		}
	}

	@Override
	public void removeNumber(Integer number, Integer actId) {
		try {
			beginTranscation();
			final String sql = "SELECT ACTIVITY_CURRENT_COUNT FROM ACTIVITY WHERE  ACTIVITY_ID = :id";
			Integer count = (Integer) getSession().createNativeQuery(sql).setParameter("id", actId).uniqueResult();
			
			Integer updateNumber = count - number;
			final String hql = " UPDATE ActivityVO SET actCurrentCount = :number where actId = :id  ";
			getSession().createQuery(hql).setParameter("number", updateNumber).setParameter("id", actId)
					.executeUpdate();
			commit();
		} catch (Exception e) {
			rollback();
		}
	}

	

	@Override
	public void updateStatus(Integer actId) {
		try {
			beginTranscation();
			final String hql = " UPDATE ActivityVO SET actStatus = 3 where actId = :id  ";
			getSession().createQuery(hql).setParameter("id", actId)
					.executeUpdate();
			commit();
		} catch (Exception e) {
			rollback();
		}
		
	}

	@Override
	public List<ActivityVO> get() {
		beginTranscation();
		final String hql = "FROM ActivityVO";
		List<ActivityVO> list = getSession().createQuery(hql,ActivityVO.class).list();
		commit();
		return list;
	}

	@Override
	public void expired(Integer actId) {
		try {
			beginTranscation();
			final String hql = " UPDATE ActivityVO SET actStatus = 1 where actId = :id  ";
			getSession().createQuery(hql).setParameter("id", actId)
					.executeUpdate();
			commit();
		} catch (Exception e) {
			rollback();
		}
		
	}



}
