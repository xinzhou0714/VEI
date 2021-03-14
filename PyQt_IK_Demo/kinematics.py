import numpy as np



class Kinematics(object):
    def __init__(self):
        self._Theta=np.zeros(8)
        self._Rx=np.radians(np.array([0,   0,  90,   0,   0,   0,   0,   0]))
        self._Ry=np.radians(np.array([0,   0,   0,   0,   0, -90,  90,   0]))
        self._Rz=np.radians(np.array([0,   0,   0,   0,   0,   0,   0,   0]))
        self._Px=np.array([0,   0,   0,-612.9,-571.6, -61.7, 61.7,    0])
        self._Py=np.array([0,   0, -86,     0,     0,     0,    0,    0])
        self._Pz=np.array([0,  38,  90, 21.89,     2,    54,   54, 30.5])

    

    @property
    def Theta(self):
        print("get Theta: %s" % self._Theta)
        return self._Theta

    @Theta.setter
    def Theta(self, value):
        if len(value)!=8:
            raise ValueError(" Theta must be array with length 8")
        if value[0]!=0 or  value[-1]!=0 :
            raise ValueError(" the  angle of first and  last joint must be  zero   ")
        print("set Theta,old value is: %s" % self._Theta)
        print("set Theta,new value is: %s" % value)
        self._Theta=value

    @Theta.deleter
    def Theta(self):
        print("del Theta: %s" % self._Theta)
        del self._Theta

    @property
    def Rx(self):
        return self._Rx

    @property
    def Ry(self):
        return self._Ry

    @property
    def Rz(self):
        return self._Rz

    @property
    def Px(self):
        return self._Px
    
    @property
    def Py(self):
        return self._Py
    
    @property
    def Pz(self):
        return self._Pz

    def trotx(self, alpha):
        return np.array([
        [1,            0,              0,      0],
        [0, np.cos(alpha), -np.sin(alpha),      0],
        [0, np.sin(alpha),  np.cos(alpha),      0],
        [0,             0,           0,         1]
        ])
    
    def troty(self, beta):
        return np.array([
        [ np.cos(beta),  0, np.sin(beta), 0],
        [             0, 1,            0, 0],
        [ -np.sin(beta), 0, np.cos(beta), 0],
        [             0, 0,            0, 1]
        ])

    def trotz(self, gamma):
        return np.array([
        [np.cos(gamma), -np.sin(gamma), 0, 0],
        [np.sin(gamma),  np.cos(gamma), 0, 0],
        [            0,              0, 1, 0],
        [            0,              0, 0, 1]
        ])

    def  transl(self, px,py,pz):
        return np.array([
        [1, 0, 0, px],
        [0, 1, 0, py],
        [0, 0, 1, pz],
        [0, 0, 0,  1]
        ])

    def T_adjacenct(self,rx,ry,rz,px,py,pz,theta):
        return self.transl(px,py,pz)@self.trotx(rx)@self.troty(ry)@self.trotz(rz+theta)

    def GetTransformMatrices(self):
        theta1,theta2,theta3,theta4,theta5,theta6,theta7,theta8=self.Theta
        rx1,rx2,rx3,rx4,rx5,rx6,rx7,rx8=self.Rx
        ry1,ry2,ry3,ry4,ry5,ry6,ry7,ry8=self.Ry
        rz1,rz2,rz3,rz4,rz5,rz6,rz7,rz8=self.Rz
        px1,px2,px3,px4,px5,px6,px7,px8=self.Px
        py1,py2,py3,py4,py5,py6,py7,py8=self.Py
        pz1,pz2,pz3,pz4,pz5,pz6,pz7,pz8=self.Pz
        T01=self.T_adjacenct(rx1,ry1,rz1,px1,py1,pz1,theta1)
        T12=self.T_adjacenct(rx2,ry2,rz2,px2,py2,pz2,theta2)
        T23=self.T_adjacenct(rx3,ry3,rz3,px3,py3,pz3,theta3)
        T34=self.T_adjacenct(rx4,ry4,rz4,px4,py4,pz4,theta4)
        T45=self.T_adjacenct(rx5,ry5,rz5,px5,py5,pz5,theta5)
        T56=self.T_adjacenct(rx6,ry6,rz6,px6,py6,pz6,theta6)
        T67=self.T_adjacenct(rx7,ry7,rz7,px7,py7,pz7,theta7)
        T78=self.T_adjacenct(rx8,ry8,rz8,px8,py8,pz8,theta8)

        T02=T01@T12
        T03=T01@T12@T23
        T04=T01@T12@T23@T34
        T05=T01@T12@T23@T34@T45
        T06=T01@T12@T23@T34@T45@T56
        T07=T01@T12@T23@T34@T45@T56@T67
        T08=T01@T12@T23@T34@T45@T56@T67@T78
        return T01,T02,T03,T04,T05,T06,T07,T08





    


if __name__ == '__main__':
    kn=Kinematics()
    kn.Theta=np.array([0,np.radians(37),np.radians(60),0,0,0,0,0],dtype=float)
    T01,T02,T03,T04,T05,T06,T07,T08=kn.GetTransformMatrices()
    print(T06)
    

