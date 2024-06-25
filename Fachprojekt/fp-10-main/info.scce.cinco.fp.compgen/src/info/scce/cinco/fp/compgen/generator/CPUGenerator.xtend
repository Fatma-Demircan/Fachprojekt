package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.descriptor.CPUDescriptor
import info.scce.cinco.fp.prodserv.ProductService
import java.util.ArrayList

class CPUGenerator {
	
	ArrayList<CPUDescriptor> cpus
	
	def run() {
		cpus = ProductService.CPUs
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	
		«cpus.map[toString].join('\n')»
	'''
}