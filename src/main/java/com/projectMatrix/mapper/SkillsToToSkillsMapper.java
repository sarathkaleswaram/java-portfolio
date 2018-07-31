package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Skills;
import com.projectMatrix.to.SkillsTo;


@Component
public class SkillsToToSkillsMapper {
	public void map(SkillsTo skillsTo,Skills skills){
		skills.setSkillsId(skillsTo.getSkillsId());
		skills.setSkillsName(skillsTo.getSkillsName());
//		skills.setSkillsScale(skillsTo.getSkillsScale());
		
		
	}
	
	

}
