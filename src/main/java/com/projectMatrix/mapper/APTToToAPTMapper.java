package com.projectMatrix.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.model.ActionPointTracker;
import com.projectMatrix.to.ActionPointTrackerTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class APTToToAPTMapper {
	
	@Autowired
	ResourceDao resourceDao;

	public void map(ActionPointTrackerTo actionPointTrackerTo, ActionPointTracker actionPointTracker){
		actionPointTracker.setResourceByAssignedTo(resourceDao.getById(actionPointTrackerTo.getResourceByAssignedToId()));
		actionPointTracker.setSubject(actionPointTrackerTo.getSubject());
//		actionPointTracker.setDescription(actionPointTrackerTo.getDescription());
		if(!actionPointTrackerTo.getStartDate().isEmpty())
			actionPointTracker.setStartDate(DateUtil.formatDate(actionPointTrackerTo.getStartDate()));
		if(!actionPointTrackerTo.getEndDate().isEmpty())
			actionPointTracker.setEndDate(DateUtil.formatDate(actionPointTrackerTo.getEndDate()));
		actionPointTracker.setPriority(actionPointTrackerTo.getPriority());
	}
}
