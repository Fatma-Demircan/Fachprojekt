package info.scce.cinco.product.fp.pcconfig.mb.mgl.hook

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.fp.compdsl.componentDsl.Mainboard

class MbContainerPostCreate extends CincoPostCreateHook<MbContainer>{
	
	override postCreate(MbContainer mbCon) {
				//number of memoryslots from mainboard
		val mbcomp = (mbCon.referencedMainboard as Mainboard).numMemorySlots
		if(mbcomp == 2){
			mbCon.resize(400,300)
		val cpuslot = mbCon.newCpuslot(20,20)
		cpuslot.resize(120,120)
		
		val gpuslot = mbCon.newGpuSlot(20,165)
		gpuslot.resize(120,120)
		
		val ramslot1 = mbCon.newRamslot(180,20)
		ramslot1.resize(200,80)
		
		val ramslot2 = mbCon.newRamslot(180,205)
		ramslot2.resize(200,80)
		
		
		val cpusocket = (mbCon.referencedMainboard as Mainboard).socket.toString
		cpuslot.socketType = cpusocket
		
		val ramtype = (mbCon.referencedMainboard as Mainboard).typeMemorySlots.toString
		ramslot1.ramType = ramtype
		ramslot2.ramType = ramtype
		}
		else{
			mbCon.resize(431,400)
		val cpuslot = mbCon.newCpuslot(20,20)
		cpuslot.resize(120,120)
		
		val gpuslot = mbCon.newGpuSlot(20,165)
		gpuslot.resize(120,120)
		
		val ramslot1 = mbCon.newRamslot(180,10)
		ramslot1.resize(200,80)
		
		val ramslot2 = mbCon.newRamslot(180,110)
		ramslot2.resize(200,80)
		
		val ramslot3 = mbCon.newRamslot(180,305)
		ramslot3.resize(200,80)
		
		val ramslot4 = mbCon.newRamslot(180,210)
		ramslot4.resize(200,80)
		
		val cpusocket = (mbCon.referencedMainboard as Mainboard).socket.toString
		cpuslot.socketType = cpusocket
		
		val ramtype = (mbCon.referencedMainboard as Mainboard).typeMemorySlots.toString
		ramslot1.ramType = ramtype
		ramslot2.ramType = ramtype
		ramslot3.ramType = ramtype
		ramslot4.ramType = ramtype
		}
		}
	}
