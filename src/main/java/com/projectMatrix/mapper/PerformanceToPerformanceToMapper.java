package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Performance;
import com.projectMatrix.to.PerformanceTo;


@Component
public class PerformanceToPerformanceToMapper {

	
	public void map(Performance performance, PerformanceTo performanceTo){
		performanceTo.setPerformanceId(performance.getPerformanceId());
		performanceTo.setPerformanceLevelName(performance.getPerformanceLevelName());
	}
}
