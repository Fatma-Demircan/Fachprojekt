package info.scce.cinco.product.fp.pcconfig.mb.mgl.checks

import info.scce.cinco.product.fp.pcconfig.mb.mgl.mcam.modules.checks.MainboardCheck
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.RamNode

class RamTypeCheck extends MainboardCheck {
	
	override check(Mainboard mainboard) {
		
		// check if all RAMS installed on the Main-board have the same RAMType as the Main board RAMType 
		
		//get the container
		val mbContainers = mainboard.findThe(MbContainer)
		
			//get ram type from mainboard
			val mainboardram = (mbContainers.referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).typeMemorySlots.toString	
			
			//get all the rams 	
		  val RAMs = mainboard.find(RamNode)	
		  
		  //check if the ramtype matches the mainboard ramtype
		  RAMs.forEach[ 
		  	if (it != null){
		  		val ramtype = (it.referencedRam as info.scce.cinco.fp.compdsl.componentDsl.RAM).type.toString
		  		if(!ramtype.equals(mainboardram)){
		    	it.addError("The Ram type of the ram and the mainboard does not match")}
		  }]
			
		}
	}
	