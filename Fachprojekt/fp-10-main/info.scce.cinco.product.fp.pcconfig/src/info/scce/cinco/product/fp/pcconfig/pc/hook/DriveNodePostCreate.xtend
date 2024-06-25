package info.scce.cinco.product.fp.pcconfig.pc.hook

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.DriveNode

class DriveNodePostCreate extends CincoPostCreateHook<DriveNode>{
	
	override postCreate(DriveNode dnode) {
		dnode.x = 0 
		dnode.y = 0
		dnode.resize(dnode.container.width,dnode.container.height)
	}
	
}