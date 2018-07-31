package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.to.ResourceAllocationTo;

@Component
public class ResourceAllocationToResourceAllocationToMapper {
	
	public void map(ResourceAllocation resourceAllocation, ResourceAllocationTo resourceAllocationTo){
		resourceAllocationTo.setResourceAllocatedId(resourceAllocation.getResourceAllocatedId());
		
		resourceAllocationTo.setJob(resourceAllocation.getJob().getJobId());
		if(resourceAllocation.getResourceByFeedbackAllocatedId() != null){
		resourceAllocationTo.setResourceByFeedbackAllocatedId(resourceAllocation.getResourceByFeedbackAllocatedId().getResourceId());
		resourceAllocationTo.setResourceByFeedbackAllocatedName(resourceAllocation.getResourceByFeedbackAllocatedId().getFirstName()+" "+resourceAllocation.getResourceByFeedbackAllocatedId().getLastName());
		}
		if(resourceAllocation.getResourceByProductionAllocatedId() != null){
		resourceAllocationTo.setResourceByProductionAllocatedId(resourceAllocation.getResourceByProductionAllocatedId().getResourceId());
		resourceAllocationTo.setResourceByProductionAllocatedName(resourceAllocation.getResourceByProductionAllocatedId().getFirstName()+" "+resourceAllocation.getResourceByProductionAllocatedId().getLastName());
		}
		if(resourceAllocation.getResourceByQaAllocatedId() != null){
		resourceAllocationTo.setResourceByQaAllocatedId(resourceAllocation.getResourceByQaAllocatedId().getResourceId());
		resourceAllocationTo.setResourceByQaAllocatedName(resourceAllocation.getResourceByQaAllocatedId().getFirstName()+" "+resourceAllocation.getResourceByQaAllocatedId().getLastName());
		}
		if(resourceAllocation.getResourceByQcAllocatedId() != null){
		resourceAllocationTo.setResourceByQcAllocatedId(resourceAllocation.getResourceByQcAllocatedId().getResourceId());
		resourceAllocationTo.setResourceByQcAllocatedName(resourceAllocation.getResourceByQcAllocatedId().getFirstName()+" "+resourceAllocation.getResourceByQcAllocatedId().getLastName());
		}
	}

}
