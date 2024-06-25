package info.scce.cinco.product.fp.pcconfig.mb.mgl.checks

import info.scce.cinco.product.fp.pcconfig.mb.mgl.mcam.modules.checks.MainboardCheck
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.CpuNode


class SocketCheck extends MainboardCheck{
	
	override check(Mainboard mainboard) {
		
		// mainboard socket type
			val mainboardsocket = (mainboard.mbContainers.get(0).referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).socket.toString
		//CPUNode from mainboard
		val cpuNode = mainboard.findThe(CpuNode)
		println("CpuNode" + cpuNode)
		//cpu socket from cpu node
			val CpuSocket = (cpuNode?.referencedCpu as info.scce.cinco.fp.compdsl.componentDsl.CPU).socket.toString
			
			//check if they have the same sockettype
			if(!CpuSocket.equals(mainboardsocket)){
				cpuNode.addError("The socket type does not match")
			}
		}
		
		}