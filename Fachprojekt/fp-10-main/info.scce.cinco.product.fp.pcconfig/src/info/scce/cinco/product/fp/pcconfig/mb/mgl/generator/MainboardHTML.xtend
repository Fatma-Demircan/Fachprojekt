package info.scce.cinco.product.fp.pcconfig.mb.mgl.generator

import de.jabc.cinco.meta.core.utils.EclipseFileUtils
import de.jabc.cinco.meta.plugin.generator.runtime.IGenerator
import de.jabc.cinco.meta.runtime.CincoRuntimeBaseClass
import info.scce.cinco.fp.compdsl.componentDsl.CPU
import info.scce.cinco.fp.compdsl.componentDsl.GPU
import info.scce.cinco.fp.compdsl.componentDsl.RAM
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.CpuNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.GpuNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.RamNode
import org.eclipse.core.runtime.IPath
import org.eclipse.core.runtime.IProgressMonitor

class MainboardHTML extends CincoRuntimeBaseClass implements IGenerator<Mainboard>

{
	String name
	
 override generate(Mainboard mb, IPath path, IProgressMonitor ipm) {
		val nameFile = mb.file.name
		name = nameFile.substring(0, nameFile.lastIndexOf("."))
		val tfile = workspaceRoot.getFileForLocation(path.append(name + ".html"))
		EclipseFileUtils.writeToFile(tfile, template(mb))
	}
	
	def template(Mainboard mb) {
		
			val mcontainer = mb.findThe(MbContainer)
			val ramNodes = mb.find(RamNode)
			 return th(mcontainer, ramNodes)
		
	}
	
	def th(MbContainer mContainer, Iterable<RamNode> ram) {
		
		val cpu = mContainer.getCpuslots().get(0).getCpuNodes().get(0)
	    val gpu = mContainer.getGpuSlots().get(0).getGpuNodes().get(0) 		
	    
   		
		return '''
		<!DOCTYPE html>
		<html>
		<head>
		    <meta charset="utf-8"/>
		    <title>Preisliste des Mainboards</title>
		    <style>
		        body {
		            font-family: Arial, sans-serif;
		            text-align: center;
		            margin: 0;
		            padding: 0;
		            background-color: #f5f5dc; 
		        }
		        #page-title {
		            color: #333;
		            margin-top: 30px;
		        }
		        #total-price-container {
		            background-color: #fff;
		            border-radius: 5px;
		            display: inline-block;
		            padding: 20px;
		            margin-top: 20px;
		            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		        }
		        #total-price-container h2 {
		            margin: 0;
		            color: #444;
		        }
		        #total-price-container p {
		            font-size: 20px;
		            color: #888;
		        }
		        table {
		            margin-top: 30px;
		            margin-bottom: 30px;
		            border-collapse: collapse;
		            margin-left: auto;
		            margin-right: auto;
		        }
		        th, td {
		            padding: 8px 16px;
		            border: 1px solid #ddd;
		        }
		        th {
		            background-color: #4CAF50;
		            color: white;
		        }
		        tr:nth-child(even) {
		            background-color: #f2f2f2;
		        }
		    </style>
		</head>
		<body>
		    <h1 id="page-title">Preisliste des Mainboards</h1>
		    «mbh(mContainer,cpu,gpu,ram)»
		</body>
		</html>
		'''	
	}
	
	
	
	
def mbh(MbContainer m, CpuNode cpu, GpuNode gpu, Iterable<RamNode> ram) {
    
    val refmb = m.referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard
    val refcpu = cpu.referencedCpu as CPU
    val refgpu = gpu.referencedGpu as GPU
    //calculateTotalPrice
    var totalPrice = refmb.price + refcpu.price + refgpu.price
    // add raNodes to totalPrice
    for (RamNode r : ram) {
        val refram = r.referencedRam as RAM
        totalPrice += refram.price
    }
    
    '''
    <div class="component">
        <h2>Mainboard</h2>
        <table style="width: 50%; margin: auto;">
            <tr style="background-color: #4CAF50;">
                <th>Name</th>
                <th>Preis</th>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>«refmb.name»</td>
                <td>«refmb.price» Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>«refcpu.name»</td>
                <td>«refcpu.price» Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>«refgpu.name»</td>
                <td>«refgpu.price» Euro</td>
            </tr>
           
            «FOR r : ram»
            «val refram = r.referencedRam as RAM»
            <tr style="background-color: #D3D3D3;">
                <td>«refram.name»</td>
                <td>«refram.price» Euro</td>
            </tr>
            «ENDFOR»
            <tr style="background-color: #D3D3D3;">
                <td><strong>Gesamtpreis:</strong></td>
                <td>«String.format("%.2f", totalPrice)» Euro</td>
            </tr>
        </table> 
    </div>
    '''
}

	
	
	
	
}
	
	

	
