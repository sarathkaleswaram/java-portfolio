package com.projectMatrix.mapper;

import java.util.stream.Stream;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.codehaus.jettison.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.model.ActionPointTracker;
import com.projectMatrix.model.Resource;
import com.projectMatrix.to.ActionPointTrackerTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class APTToAPTToMapper {
	
	@Autowired
	ResourceDao resourceDao;

	public void map(ActionPointTracker actionPointTracker,ActionPointTrackerTo actionPointTrackerTo) throws JSONException{
		actionPointTrackerTo.setAptId(actionPointTracker.getAptId());
		actionPointTrackerTo.setResourceByAssignedFrom(actionPointTracker.getResourceByAssignedFrom().getFirstName()+" "+actionPointTracker.getResourceByAssignedFrom().getLastName());
		actionPointTrackerTo.setResourceByAssignedTo(actionPointTracker.getResourceByAssignedTo().getFirstName()+" "+actionPointTracker.getResourceByAssignedTo().getLastName());
		actionPointTrackerTo.setResourceByAssignedFromId(actionPointTracker.getResourceByAssignedFrom().getResourceId());
		actionPointTrackerTo.setResourceByAssignedToId(actionPointTracker.getResourceByAssignedTo().getResourceId());
		actionPointTrackerTo.setSubject(actionPointTracker.getSubject());
		actionPointTrackerTo.setStatus(actionPointTracker.getStatus());
		actionPointTrackerTo.setDescription(actionPointTracker.getDescription());
		if(actionPointTracker.getStackHolders()!=null){
		   JSONArray jsonArray = (JSONArray) new JSONObject(new JSONTokener("{data:"+actionPointTracker.getStackHolders()+"}")).get("data");
		    int[] outArr = new int[jsonArray.length()]; 
		    String stackHoldersName = "";

		    for(int i=0; i<jsonArray.length(); i++) {
		        outArr[i] = jsonArray.getInt(i);
		        Resource resource = resourceDao.getById(outArr[i]);
		        stackHoldersName += resource.getFirstName()+" "+resource.getLastName()+",   ";
		    }
		    actionPointTrackerTo.setStackHoldersNames(stackHoldersName);
		    actionPointTrackerTo.setStackHolders(outArr);
		}
		if (actionPointTracker.getCreatedDate() != null)
			actionPointTrackerTo
					.setCreatedDate(DateUtil.formatDateAsString(actionPointTracker.getCreatedDate()));
		if(actionPointTracker.getStartDate()!= null){
			actionPointTrackerTo.setStartDate(DateUtil.formatDateAsString(actionPointTracker.getStartDate()));
		}
		if(actionPointTracker.getEndDate()!= null){
			actionPointTrackerTo.setEndDate(DateUtil.formatDateAsString(actionPointTracker.getEndDate()));
		}
		actionPointTrackerTo.setPriority(actionPointTracker.getPriority());
	}
}
