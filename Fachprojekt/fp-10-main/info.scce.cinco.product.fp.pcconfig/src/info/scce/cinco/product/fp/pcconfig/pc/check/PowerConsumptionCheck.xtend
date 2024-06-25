package info.scce.cinco.product.fp.pcconfig.pc.check

import info.scce.cinco.product.fp.pcconfig.pc.mgl.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PC
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.RamNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.GpuNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.CpuNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.DriveNode
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PowerSNode

class PowerConsumptionCheck extends PCCheck{
	
	override check(PC pc) {
		
	
	var consumption = 0 
		
		//pcmainboardnode
		val pcmbnode = pc.findThe(MBNode)
		//mainboard graph model 
		val mainboardgraph = (pcmbnode.referencedMB as info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard)
		//ramnodes from mainboard
		val mainboardramnodes = mainboardgraph.find(RamNode)
		
		//calculate powerconsumption of rams 
		for(ramnode : mainboardramnodes){
			 consumption += (ramnode.referencedRam as info.scce.cinco.fp.compdsl.componentDsl.RAM).powerConsumption
		}
		
		//gpunode from mainboardgraph
		val gpunode = mainboardgraph.findThe(GpuNode)
		
		consumption += (gpunode.referencedGpu as info.scce.cinco.fp.compdsl.componentDsl.GPU).powerConsumption
		
		//cpunode from graphmodel
		val cpunode = mainboardgraph.findThe(CpuNode)
		
		consumption += (cpunode.referencedCpu as info.scce.cinco.fp.compdsl.componentDsl.CPU).powerConsumption
		
		//mainboard from mainboardgraph
		val mbnode = mainboardgraph.findThe(MbContainer)
		
		consumption += (mbnode.referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).powerConsumption
		
		//drivenodes from pc graph
		val drivenodes = pc.find(DriveNode)
		
		//calc powerconsumption for each drives
		for(drivenode : drivenodes){
			consumption += (drivenode.referenceddrive as info.scce.cinco.fp.compdsl.componentDsl.Drive).powerConsumption
		}
		
		//psunode
		val psunode = pc.findThe(PowerSNode)
		
		//powersupply value from the comp dsl 
		val psuvalue = (psunode.referencdpsu as info.scce.cinco.fp.compdsl.componentDsl.PowerSupply).power
		
		//check if the psu is enough
		
		if(consumption * 1.25 > psuvalue){
			psunode.addError("Common, more Power!")
		}
		
		}
		
		
		
		
		
		
}