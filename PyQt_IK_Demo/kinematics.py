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
        print("set theta,old value is: %s" % self._theta)
        print("set theta,new value is: %s" % value)
        self._theta=value

    @theta.deleter
    def theta(self):
        print("del theta: %s" % self._theta)
        del self._theta

if __name__ == '__main__':
    kn=Kinematics()
    kn.theta=np.ones(8)
    