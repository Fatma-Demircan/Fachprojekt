package info.scce.cinco.product.fp.pcconfig.pc.hook
import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.CaseContainer
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBCONTAINER
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer

class CaseContainerPostCreate extends CincoPostCreateHook<CaseContainer>{
	
	override postCreate(CaseContainer casecontainer) {
		
		casecontainer.resize(400,300)
		val mbcontainer = casecontainer.newMBCONTAINER(20,20)
		mbcontainer.resize(150,150)
		
	}
	
}