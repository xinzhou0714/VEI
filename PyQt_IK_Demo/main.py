# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import QApplication , QMainWindow
from UI_IK_Demo import  Ui_MainWindow

class  myMainWindow(QMainWindow,Ui_MainWindow):
    def __init__(self,parent=None):
        super().__init__(parent)
        self.setupUi(self)


if __name__=="__main__":  
	app = QApplication(sys.argv)  
	win = myMainWindow()  
	win.show()  
	sys.exit(app.exec_()) 