package info.scce.cinco.product.fp.pcconfig.mb.mgl.hook

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.RamNode

class RamNodePostCreate extends CincoPostCreateHook<RamNode>{
	
	override postCreate(RamNode ramnode) {
		ramnode.x = 0
		ramnode.y = 0
		ramnode.resize(ramnode.container.width,ramnode.container.height)
		
	}
	
}