package info.scce.cinco.product.fp.pcconfig.mb.mgl.generator

import de.jabc.cinco.meta.runtime.CincoRuntimeBaseClass
import de.jabc.cinco.meta.plugin.generator.runtime.IGenerator
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PC
import org.eclipse.core.runtime.IPath
import org.eclipse.core.runtime.IProgressMonitor
import de.jabc.cinco.meta.core.utils.EclipseFileUtils
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.MBNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.MbContainer
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.RamNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.CpuNode
import info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.GpuNode
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.CaseContainer
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.PowerSNode
import info.scce.cinco.product.fp.pcconfig.pc.mgl.pc.DriveNode

class PCHTML extends CincoRuntimeBaseClass implements IGenerator<PC> {
	
	String fileName
	override generate(PC pc, IPath path, IProgressMonitor arg2) {
 	    val fullFileName = pc.file.name
 	    fileName = fullFileName.substring(0, fullFileName.lastIndexOf('.'))
        val targetFile = workspaceRoot.getFileForLocation(path.append(fileName + ".html"))
 	    EclipseFileUtils.writeToFile(targetFile, template(pc))
 	    
	}
	
	def template(PC pc) {
		// pcmainboardnode
		val pcmainboard = pc.findThe(MBNode)
		
		//mainboardgraphmodel
		val mainboardgraph = pcmainboard.referencedMB as info.scce.cinco.product.fp.pcconfig.mb.mgl.mainboard.Mainboard
		
		    //mainboard nodes
			val ramNodes = mainboardgraph.find(RamNode)
			 
			 //mainboardnodes totalprice
			 var ramnodetotalprice = 0.0
			 // ram name
			 var ramname = ""
			 for(ramNode : ramNodes){
			 	ramnodetotalprice += (ramNode.referencedRam as info.scce.cinco.fp.compdsl.componentDsl.RAM).price
			 	ramname = (ramNode.referencedRam as info.scce.cinco.fp.compdsl.componentDsl.RAM).name
			 }
			 
			 
			 //cpuprice
			 val cpuprice = ((mainboardgraph.findThe(CpuNode)).referencedCpu as info.scce.cinco.fp.compdsl.componentDsl.CPU).price
			 //cpuname
			 val cpuname = ((mainboardgraph.findThe(CpuNode)).referencedCpu as info.scce.cinco.fp.compdsl.componentDsl.CPU).name
			 
			 //gpuprice 
			 val gpuprice = ((mainboardgraph.findThe(GpuNode)).referencedGpu as info.scce.cinco.fp.compdsl.componentDsl.GPU).price
			 //gpuname
			 val gpuname = ((mainboardgraph.findThe(GpuNode)).referencedGpu as info.scce.cinco.fp.compdsl.componentDsl.GPU).name
			 
			 //mainboardprice
			 val mainboardprice = ((mainboardgraph.findThe(MbContainer)).referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).price
			 
			 //mainboardname
			 val mainboardname = ((mainboardgraph.findThe(MbContainer)).referencedMainboard as info.scce.cinco.fp.compdsl.componentDsl.Mainboard).name
			 
			 //pccase price
			 val pccaseprice = ((pc.findThe(CaseContainer)).referencedcase as info.scce.cinco.fp.compdsl.componentDsl.Case).price
			 //pccase name
			 val pccasename = ((pc.findThe(CaseContainer)).referencedcase as info.scce.cinco.fp.compdsl.componentDsl.Case).name
			 
			 //pc power supply price
			 val psuprice = ((pc.findThe(PowerSNode)).referencdpsu as info.scce.cinco.fp.compdsl.componentDsl.PowerSupply).price
			 //pc power supply name
			 val psuname = ((pc.findThe(PowerSNode)).referencdpsu as info.scce.cinco.fp.compdsl.componentDsl.PowerSupply).name
			 
			 // total price and name of all drives 
			 var totaldriveprice = 0.0
			 var drivename = ""
			 val drivenodelist = pc.find(DriveNode)
			 
			 for(drivenode : drivenodelist){
			 	totaldriveprice += (drivenode.referenceddrive as info.scce.cinco.fp.compdsl.componentDsl.Drive).price
			 	drivename = (drivenode.referenceddrive as info.scce.cinco.fp.compdsl.componentDsl.Drive).name
			 }
			 
			 
			  // calc total price
    val totalPrice = ramnodetotalprice + cpuprice + gpuprice + mainboardprice + pccaseprice + psuprice + totaldriveprice;

    // create html site
    return '''
    
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8"/>
        <title>PC Komponenten Preisliste</title>
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
        <h1>PC Komponenten Preisliste</h1>
        <table>
            <tr style="background-color: #4CAF50;">
                <th>Komponente</th>
                <th>Preis</th>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>Mainboard: ''' + mainboardname + '''</td>
                <td>''' + String.format("%.2f", mainboardprice) + ''' Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>CPU: ''' + cpuname + '''</td>
                <td>''' + String.format("%.2f", cpuprice) + ''' Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>GPU: ''' + gpuname + '''</td>
                <td>''' + String.format("%.2f", gpuprice) + ''' Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>RAM: ''' + ramname + '''</td>
                <td>''' + String.format("%.2f", ramnodetotalprice) + ''' Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>Gehäuse: ''' + pccasename + '''</td>
                <td>''' + String.format("%.2f", pccaseprice) + ''' Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>Netzteil: ''' + psuname + '''</td>
                <td>''' + String.format("%.2f", psuprice) + ''' Euro</td>
            </tr>
            <tr style="background-color: #D3D3D3;">
                <td>Laufwerke: ''' + drivename + '''</td>
                <td>''' + String.format("%.2f", totaldriveprice) + ''' Euro</td>
            </tr>
            <tr class="total", style="background-color: #D3D3D3;">
                <td><strong>Gesamtpreis:</strong></td>
                <td>''' + String.format("%.2f", totalPrice) + ''' Euro</td>
            </tr>
        </table>
    </body>
    </html>

    ''';
	}
	
}