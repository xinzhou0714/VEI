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




    


if __name__ == '__main__':
    kn=Kinematics()
    kn.Theta=np.array([0,0,20,0,0,0,0,0],dtype=float)
    print(kn.trotx(np.pi/2))
    

