package info.scce.cinco.product.fp.pcconfig.pc.check

import info.scce.cinco.product.fp.pcconfig.pc.mgl.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PC
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.DriveNode

class DriveAmountCheck extends PCCheck{
	
	override check(PC pc) {
		//pcmainboardnode
		val pcmbnode = pc.findThe(MBNode)
		//mainboard graph model 
		val mainboardgraph = (pcmbnode.referencedMB as info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard)
		
		//mainboard from mainboardgraph
		val mbnode = mainboardgraph.findThe(MbContainer)
		
		//get amount of ports the mainboard has
		val sataportsamaount = (mbnode.referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).numSataPorts
		
		//drivenodes from pc graph
		val drivenodes = pc.find(DriveNode)
		
		//check if enough sataports
		for(drivenode : drivenodes){
			if(sataportsamaount < drivenodes.size){
				drivenode.addError("There are not enough ports to add this drive")
			}
		}
	}
	
}