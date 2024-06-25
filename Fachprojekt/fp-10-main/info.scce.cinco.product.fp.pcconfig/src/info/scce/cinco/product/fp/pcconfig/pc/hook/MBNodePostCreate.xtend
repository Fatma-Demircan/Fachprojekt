package info.scce.cinco.product.fp.pcconfig.pc.hook

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBCONTAINER

class MBNodePostCreate extends CincoPostCreateHook<MBNode>{
	
	override postCreate(MBNode mbnode) {
		
		
		//mainboardgraph model 
		val mainboardgraph = mbnode.referencedMB as Mainboard
		val numberofsataports = ((mainboardgraph.findThe(MbContainer)).referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).numSataPorts
		val casecontainer = ((mbnode.container).container)
		
		if(numberofsataports == 2 ){
			casecontainer.resize(451,300)
			
			(casecontainer.findThe(MBCONTAINER)).resize(165,120)
		mbnode.x = 0 
		mbnode.y = 0 
		mbnode.resize(mbnode.container.width,mbnode.container.height)
		
		val powerscontainer = casecontainer.newPowerSContainer(20,160)
		powerscontainer.resize(165,125)
		
		val drivecontainer = casecontainer.newDriveContainer(220,160)
		drivecontainer.resize(201,119)
		
		val drivecontainer1 = casecontainer.newDriveContainer(220,20)
		drivecontainer1.resize(201,111)
		}
		
		if(numberofsataports == 4 ){
			casecontainer.resize(471,351)
			(casecontainer.findThe(MBCONTAINER)).resize(165,120)
		mbnode.x = 0 
		mbnode.y = 0 
		mbnode.resize(mbnode.container.width,mbnode.container.height)
		
	
		
		val powerscontainer = casecontainer.newPowerSContainer(20,160)
		powerscontainer.resize(165,125)
		
		val drivecontainer = casecontainer.newDriveContainer(220,100)
		drivecontainer.resize(201,61)
		
		val drivecontainer1 = casecontainer.newDriveContainer(220,20)
		drivecontainer1.resize(201,61)
		
		val drivecontainer2 = casecontainer.newDriveContainer(220,180)
		drivecontainer2.resize(201,61)
		
		val drivecontainer3 = casecontainer.newDriveContainer(220,260)
		drivecontainer3.resize(201,61)
		}
		
		if(numberofsataports == 6 ){
			casecontainer.resize(611,351)
			(casecontainer.findThe(MBCONTAINER)).resize(165,120)
		mbnode.x = 0 
		mbnode.y = 0 
		mbnode.resize(mbnode.container.width,mbnode.container.height)
			
		
		
		val powerscontainer = casecontainer.newPowerSContainer(20,160)
		powerscontainer.resize(165,125)
		
		val drivecontainer = casecontainer.newDriveContainer(220,100)
		drivecontainer.resize(201,61)
		
		val drivecontainer1 = casecontainer.newDriveContainer(220,20)
		drivecontainer1.resize(201,61)
		
		val drivecontainer2 = casecontainer.newDriveContainer(220,180)
		drivecontainer2.resize(201,61)
		
		val drivecontainer3 = casecontainer.newDriveContainer(220,260)
		drivecontainer3.resize(201,61)
		
		val drivecontainer4 = casecontainer.newDriveContainer(450,20)
		drivecontainer4.resize(150,61)
		
		val drivecontainer5 = casecontainer.newDriveContainer(450,100)
		drivecontainer5.resize(150,51)
		}
		
		if(numberofsataports == 7 ){
			casecontainer.resize(611,351)
			(casecontainer.findThe(MBCONTAINER)).resize(165,120)
		mbnode.x = 0 
		mbnode.y = 0 
		mbnode.resize(mbnode.container.width,mbnode.container.height)
			
	
		
		val powerscontainer = casecontainer.newPowerSContainer(20,160)
		powerscontainer.resize(165,125)
		
		val drivecontainer = casecontainer.newDriveContainer(220,100)
		drivecontainer.resize(201,61)
		
		val drivecontainer1 = casecontainer.newDriveContainer(220,20)
		drivecontainer1.resize(201,61)
		
		val drivecontainer2 = casecontainer.newDriveContainer(220,180)
		drivecontainer2.resize(201,61)
		
		val drivecontainer3 = casecontainer.newDriveContainer(220,260)
		drivecontainer3.resize(201,61)
		
		val drivecontainer4 = casecontainer.newDriveContainer(450,20)
		drivecontainer4.resize(150,61)
		
		val drivecontainer5 = casecontainer.newDriveContainer(450,100)
		drivecontainer5.resize(150,51)
		
		val drivecontainer6 = casecontainer.newDriveContainer(450,160)
		drivecontainer6.resize(150,51)
		}
		
		if(numberofsataports == 8 ){
			casecontainer.resize(611,351)
			(casecontainer.findThe(MBCONTAINER)).resize(165,120)
		mbnode.x = 0 
		mbnode.y = 0 
		mbnode.resize(mbnode.container.width,mbnode.container.height)
			
	
		
		val powerscontainer = casecontainer.newPowerSContainer(20,160)
		powerscontainer.resize(165,125)
		
		val drivecontainer = casecontainer.newDriveContainer(220,100)
		drivecontainer.resize(201,61)
		
		val drivecontainer1 = casecontainer.newDriveContainer(220,20)
		drivecontainer1.resize(201,61)
		
		val drivecontainer2 = casecontainer.newDriveContainer(220,180)
		drivecontainer2.resize(201,61)
		
		val drivecontainer3 = casecontainer.newDriveContainer(220,260)
		drivecontainer3.resize(201,61)
		
		val drivecontainer4 = casecontainer.newDriveContainer(450,20)
		drivecontainer4.resize(150,61)
		
		val drivecontainer5 = casecontainer.newDriveContainer(450,100)
		drivecontainer5.resize(150,51)
		
		val drivecontainer7 = casecontainer.newDriveContainer(450,220)
		drivecontainer7.resize(150,51)
		}
		
		if(numberofsataports == 9 ){
			casecontainer.resize(611,351)
			(casecontainer.findThe(MBCONTAINER)).resize(165,120)
		mbnode.x = 0 
		mbnode.y = 0 
		mbnode.resize(mbnode.container.width,mbnode.container.height)
			
		
		val powerscontainer = casecontainer.newPowerSContainer(20,160)
		powerscontainer.resize(165,125)
		
		val drivecontainer = casecontainer.newDriveContainer(220,100)
		drivecontainer.resize(201,61)
		
		val drivecontainer1 = casecontainer.newDriveContainer(220,20)
		drivecontainer1.resize(201,61)
		
		val drivecontainer2 = casecontainer.newDriveContainer(220,180)
		drivecontainer2.resize(201,61)
		
		val drivecontainer3 = casecontainer.newDriveContainer(220,260)
		drivecontainer3.resize(201,61)
		
		val drivecontainer4 = casecontainer.newDriveContainer(450,20)
		drivecontainer4.resize(150,61)
		
		val drivecontainer5 = casecontainer.newDriveContainer(450,100)
		drivecontainer5.resize(150,51)
		
		val drivecontainer7 = casecontainer.newDriveContainer(450,220)
		drivecontainer7.resize(150,51)
		
		val drivecontainer8 = casecontainer.newDriveContainer(450,284)
		drivecontainer8.resize(150,47)
		}
		
	}
	
}