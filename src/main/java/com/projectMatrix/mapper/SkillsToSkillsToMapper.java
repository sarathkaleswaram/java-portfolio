package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Skills;
import com.projectMatrix.to.SkillsTo;

@Component
public class SkillsToSkillsToMapper {

	public void map(Skills skills, SkillsTo skillsTo) {
		
		skillsTo.setSkillsId(skills.getSkillsId());
		skillsTo.setSkillsName(skills.getSkillsName());
//		skillsTo.setSkillsScale(skills.getSkillsScale());
		
		
		
		
	}

}
