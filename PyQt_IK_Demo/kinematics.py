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

if __name__ == '__main__':
    kn=Kinematics()
    kn.theta=np.array([0,0,20,0,0,0,0,0],dtype=float)
    