import numpy as np



class Kinematics(object):
    def __init__(self):
        self._theta=np.zeros(8)
    

    @property
    def theta(self):
        print("get theta: %s" % self._theta)
        return self._theta

    @theta.setter
    def theta(self, value):
        if len(value)!=8:
            raise ValueError(" theta must be array with length 8")
        if value[0]!=0 or  value[-1]!=0 :
            raise ValueError(" the  angle of first and  last joint must be  zero   ")
        print("set theta,old value is: %s" % self._theta)
        print("set theta,new value is: %s" % value)
        self._theta=value

    @theta.deleter
    def theta(self):
        print("del theta: %s" % self._theta)
        del self._theta

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

    def  transl(self, Px,Py,Pz):
        return np.array([
        [1, 0, 0, Px],
        [0, 1, 0, Py],
        [0, 0, 1, Pz],
        [0, 0, 0,  1]
        ])

if __name__ == '__main__':
    kn=Kinematics()
    kn.theta=np.array([0,0,20,0,0,0,0,0],dtype=float)
    print(kn.trotx(np.pi/2))
    

