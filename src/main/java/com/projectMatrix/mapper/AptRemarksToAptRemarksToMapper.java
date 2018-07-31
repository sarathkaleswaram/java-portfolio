package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.AptRemarks;
import com.projectMatrix.to.AptRemarksTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class AptRemarksToAptRemarksToMapper {

	public void map(AptRemarks aptRemarks, AptRemarksTo aptRemarksTo) {
		aptRemarksTo.setAptRemarksId(aptRemarks.getAptRemarksId());
		aptRemarksTo.setActionPointTracker(aptRemarks.getActionPointTracker()
				.getAptId());
		if (aptRemarks.getCreatedDate() != null) {
			aptRemarksTo.setCreatedDate(DateUtil.formatDateAsString(aptRemarks
					.getCreatedDate()));
		}
		aptRemarksTo.setResource(aptRemarks.getResource().getFirstName() + " "
				+ aptRemarks.getResource().getLastName());
		aptRemarksTo.setRemarks(aptRemarks.getRemarks());
	}
}
