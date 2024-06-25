package info.scce.cinco.product.fp.pcconfig.pc.check

import info.scce.cinco.product.fp.pcconfig.pc.mgl.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PC
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.CaseContainer


class FormFactorCheck extends PCCheck{
	
	override check(PC pc) {
		
		//pcmainboardnode
		val pcmbnode = pc.findThe(MBNode)
		//mainboard graph model 
		val mainboardgraph = (pcmbnode.referencedMB as info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard)
		
		//mainboard from mainboardgraph
		val mbnode = mainboardgraph.findThe(MbContainer)
		
		// mb formcator from mainboard graphmodel
		val mbformfactor = (mbnode.referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).formFactor.toString
		
		//case from pc graphmodel
		val casecontainer = pc.findThe(CaseContainer)
		
		//casefactor from casecontainer
		val casefactor = (casecontainer.referencedcase as info.scce.cinco.fp.compdsl.componentDsl.Case).formFactor.toString
		
		//check if the formfactor is the same
		if(!casefactor.equals(mbformfactor)){
			casecontainer.addError("The Mainboard does not fit need" )
		}
		
	}
	
}