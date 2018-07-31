package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Uom;
import com.projectMatrix.to.UomTo;

@Component
public class UomToToUomMapper {
	public void map(UomTo uomTo, Uom uom) {
	
		uom.setUomId(uomTo.getUomId());
		uom.setUomName(uomTo.getUomName());
	
		
	}
}
