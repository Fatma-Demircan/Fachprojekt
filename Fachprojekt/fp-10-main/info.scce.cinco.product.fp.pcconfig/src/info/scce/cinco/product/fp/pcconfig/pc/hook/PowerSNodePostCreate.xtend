package info.scce.cinco.product.fp.pcconfig.pc.hook

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PowerSNode

class PowerSNodePostCreate extends CincoPostCreateHook<PowerSNode>{
	
	override postCreate(PowerSNode pnode) {
		pnode.x = 0
		pnode.y = 0
		pnode.resize(pnode.container.width,pnode.container.height)
	}
	
}