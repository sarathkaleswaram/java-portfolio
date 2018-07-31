package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Uom;
import com.projectMatrix.to.UomTo;

@Component
public class UomToUomToMapper {
	public void map(Uom uom, UomTo uomTo) {
		uomTo.setUomId(uom.getUomId());
		uomTo.setUomName(uom.getUomName());

	}

}
