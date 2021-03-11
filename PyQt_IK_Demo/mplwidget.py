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

#### testing example 

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ui = MplWidget()
    # plot a 3D surface like in the example mplot3d/surface3d_demo
    X = np.arange(-5, 5, 0.25)
    Y = np.arange(-5, 5, 0.25)
    X, Y = np.meshgrid(X, Y)
    R = np.sqrt(X**2 + Y**2)
    Z = np.sin(R)
    ui.canvas.axes.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap=cm.coolwarm,linewidth=0, antialiased=False)

    ui.show()
    sys.exit(app.exec_()) 