#----------------------------------------------------
#  user defined Widget for matplotlib
#----------------------------------------------------

from  PyQt5.QtWidgets  import * 
from  matplotlib.backends.backend_qt5agg  import  FigureCanvas 
from  matplotlib.figure  import  Figure 
import numpy as np
from matplotlib import cm
import sys
#  implement our own Widget
class MplWidget(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.canvas=FigureCanvas(Figure())
        vertical_layout =  QVBoxLayout (self) 
        vertical_layout.addWidget(self.canvas)
        self.canvas.axes =  self.canvas.figure.add_subplot (111, projection='3d',position=[0.01, 0.01, 1, 1] ) 
        self.setLayout(vertical_layout )

    def defcanvas(self):
        self.canvas.axes.set_xlim([-1400,1400])
        self.canvas.axes.set_ylim([-1400,1400])
        self.canvas.axes.set_zlim([0,1400]) 
        self.canvas.axes.set_xlabel('x')
        self.canvas.axes.set_ylabel('y')
        self.canvas.axes.set_zlabel('z')

#### testing example 

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ui = MplWidget()
    ui.defcanvas()
    #plot initial configuration
    ui.canvas.axes.plot([0,0],[0,0],[0,38], color='green', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.plot([0,0],[0,-86],[38,128], color='green', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.plot([0,-612.9],[-86,-107.89],[128,128], color='red', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.plot([-612.9,-1184.5],[-107.89,-109.89],[128,128], color='blue', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.plot([-1184.5,-1246.2],[-109.89,-163.89],[128,128], color='black', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.plot([-1246.2,-1300.2],[-163.89,-225.59],[128,128], color='yellow', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.plot([-1300.2,-1300.2],[-225.59,-256.09],[128,128], color='red', marker='o', linestyle='solid', linewidth=1, markersize=3)
    ui.canvas.axes.text(-1300.2,-256.09,128,'({:.2f}, {:.2f}, {:.2f})'.format(-1300.2,-256.09,128), weight='bold', fontsize=12)

    ui.show()
    sys.exit(app.exec_()) 