package info.scce.cinco.product.fp.pcconfig.mb.mgl.hook

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.GpuNode

class GpuNodePostCreate extends CincoPostCreateHook<GpuNode>{
	
	override postCreate(GpuNode node) {
		node.x = 0
		node.y = 0
		node.resize(node.container.width,node.container.height)
	}
	
}