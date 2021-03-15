import numpy as np
from numpy import  cos
from numpy import sin


class Kinematics(object):
    def __init__(self):
        self._Theta=np.zeros(8)
        self._q1=self._Theta[0]
        self._q2=self._Theta[1]
        self._q3=self._Theta[2]
        self._q4=self._Theta[3]
        self._q5=self._Theta[4]
        self._q6=self._Theta[5]
        self._q7=self._Theta[6]
        self._q8=self._Theta[7]
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
        print("set Theta,old value is: %s ,(in radian )" % self._Theta)
        print("set Theta,new value is: %s ,(in radian )" % value)
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
    
    @property
    def q1(self):
        return self._Theta[0]
    
    @q1.setter
    def q1(self,value):
        print("q1 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[0]=np.radians(value) 
        self.Theta=copy

    @property
    def q2(self):
        return self._Theta[1]
    
    @q2.setter	
    def q2(self,value):
        print("q2 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[1]=np.radians(value)   
        self.Theta=copy

    @property
    def q3(self):
        return self._Theta[2]

    @q3.setter
    def q3(self,value):
        print("q3 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[2]=np.radians(value)
        self.Theta=copy

    @property
    def q4(self):
        return self._Theta[3]

    @q4.setter
    def q4(self,value):
        print("q4 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[3]=np.radians(value)
        self.Theta=copy
    
    @property
    def q5(self):
        return self._Theta[4]
    
    @q5.setter
    def q5(self,value):
        print("q5 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[4]=np.radians(value)
        self.Theta=copy
    
    @property
    def q6(self):
        return self._Theta[5]
    
    @q6.setter
    def q6(self,value):
        print("q6 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[5]=np.radians(value)
        self.Theta=copy

    @property
    def q7(self):
        return self._Theta[6]
    
    @q7.setter
    def q7(self,value):
        print("q7 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[6]=np.radians(value)
        self.Theta=copy

    @property
    def q8(self):
        return self._Theta[7]
    
    @q8.setter
    def q8(self,value):
        print("q8 changed to : %s degrees , %s  radians " % (value ,np.radians(value)))
        copy=np.copy(self._Theta)
        copy[7]=np.radians(value)
        self.Theta=copy




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
        theta1,theta2,theta3,theta4,theta5,theta6,theta7,theta8=self._Theta
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

    @property
    def T01(self):
        return self.GetTransformMatrices()[0]
    
    @property
    def T02(self):
        return self.GetTransformMatrices()[1]
    
    @property
    def T03(self):
        return self.GetTransformMatrices()[2]
    
    @property
    def T04(self):
        return self.GetTransformMatrices()[3]
    
    @property
    def T05(self):
        return self.GetTransformMatrices()[4]

    @property
    def T06(self):
        return self.GetTransformMatrices()[5]

    @property
    def T07(self):
        return self.GetTransformMatrices()[6]

    @property
    def T08(self):
        return self.GetTransformMatrices()[7]


    def Jacobian(self):
        # Matrix should be at least 3*8

        q1,q2,q3,q4,q5,q6,q7,q8=self._Theta
        # all expression comes from matlab symbolic algebra
        # dx/dq1
        J_11=(16389*cos(q1 + q2))/100 + (2858*cos(q3 + q4)*sin(q1 + q2))/5 + (461*cos(q1 + q2)*cos(q6))/5 + sin(q6)*((461*cos(q3 + q4)*sin(q1 + q2)*sin(q5))/5 + (461*sin(q1 + q2)*sin(q3 + q4)*cos(q5))/5) + (6129*sin(q1 + q2)*cos(q3))/10 + (1157*cos(q3 + q4)*sin(q1 + q2)*cos(q5))/10 - (1157*sin(q1 + q2)*sin(q3 + q4)*sin(q5))/10    
        # dx/dq2
        J_12=(16389*cos(q1 + q2))/100 + (2858*cos(q3 + q4)*sin(q1 + q2))/5 + (461*cos(q1 + q2)*cos(q6))/5 + sin(q6)*((461*cos(q3 + q4)*sin(q1 + q2)*sin(q5))/5 + (461*sin(q1 + q2)*sin(q3 + q4)*cos(q5))/5) + (6129*sin(q1 + q2)*cos(q3))/10 + (1157*cos(q3 + q4)*sin(q1 + q2)*cos(q5))/10 - (1157*sin(q1 + q2)*sin(q3 + q4)*sin(q5))/10
        # dx/dq3
        J_13=(2858*cos(q1 + q2)*sin(q3 + q4))/5 - sin(q6)*((461*cos(q1 + q2)*cos(q3 + q4)*cos(q5))/5 - (461*cos(q1 + q2)*sin(q3 + q4)*sin(q5))/5) + (6129*cos(q1 + q2)*sin(q3))/10 + (1157*cos(q1 + q2)*cos(q3 + q4)*sin(q5))/10 + (1157*cos(q1 + q2)*sin(q3 + q4)*cos(q5))/10
        # dx/dq4
        J_14=(2858*cos(q1 + q2)*sin(q3 + q4))/5 - sin(q6)*((461*cos(q1 + q2)*cos(q3 + q4)*cos(q5))/5 - (461*cos(q1 + q2)*sin(q3 + q4)*sin(q5))/5) + (1157*cos(q1 + q2)*cos(q3 + q4)*sin(q5))/10 + (1157*cos(q1 + q2)*sin(q3 + q4)*cos(q5))/10
        # dx/dq5
        J_15=(1157*cos(q1 + q2)*cos(q3 + q4)*sin(q5))/10 - sin(q6)*((461*cos(q1 + q2)*cos(q3 + q4)*cos(q5))/5 - (461*cos(q1 + q2)*sin(q3 + q4)*sin(q5))/5) + (1157*cos(q1 + q2)*sin(q3 + q4)*cos(q5))/10
        # dx/dq6
        J_16=- cos(q6)*((461*cos(q1 + q2)*cos(q3 + q4)*sin(q5))/5 + (461*cos(q1 + q2)*sin(q3 + q4)*cos(q5))/5) - (461*sin(q1 + q2)*sin(q6))/5
        # dx/dq7
        J_17=0.
        # dx/dq8
        J_18=0.

        # dy/dq1
        J_21=(16389*sin(q1 + q2))/100 - (2858*cos(q1 + q2)*cos(q3 + q4))/5 - sin(q6)*((461*cos(q1 + q2)*cos(q3 + q4)*sin(q5))/5 + (461*cos(q1 + q2)*sin(q3 + q4)*cos(q5))/5) - (6129*cos(q1 + q2)*cos(q3))/10 + (461*sin(q1 + q2)*cos(q6))/5 - (1157*cos(q1 + q2)*cos(q3 + q4)*cos(q5))/10 + (1157*cos(q1 + q2)*sin(q3 + q4)*sin(q5))/10
        # dy/dq2
        J_22=(16389*sin(q1 + q2))/100 - (2858*cos(q1 + q2)*cos(q3 + q4))/5 - sin(q6)*((461*cos(q1 + q2)*cos(q3 + q4)*sin(q5))/5 + (461*cos(q1 + q2)*sin(q3 + q4)*cos(q5))/5) - (6129*cos(q1 + q2)*cos(q3))/10 + (461*sin(q1 + q2)*cos(q6))/5 - (1157*cos(q1 + q2)*cos(q3 + q4)*cos(q5))/10 + (1157*cos(q1 + q2)*sin(q3 + q4)*sin(q5))/10
        # dy/dq3
        J_23=(2858*sin(q1 + q2)*sin(q3 + q4))/5 - sin(q6)*((461*cos(q3 + q4)*sin(q1 + q2)*cos(q5))/5 - (461*sin(q1 + q2)*sin(q3 + q4)*sin(q5))/5) + (6129*sin(q1 + q2)*sin(q3))/10 + (1157*cos(q3 + q4)*sin(q1 + q2)*sin(q5))/10 + (1157*sin(q1 + q2)*sin(q3 + q4)*cos(q5))/10
        # dy/dq4
        J_24=(2858*sin(q1 + q2)*sin(q3 + q4))/5 - sin(q6)*((461*cos(q3 + q4)*sin(q1 + q2)*cos(q5))/5 - (461*sin(q1 + q2)*sin(q3 + q4)*sin(q5))/5) + (1157*cos(q3 + q4)*sin(q1 + q2)*sin(q5))/10 + (1157*sin(q1 + q2)*sin(q3 + q4)*cos(q5))/10
        # dy/dq5
        J_25=(1157*cos(q3 + q4)*sin(q1 + q2)*sin(q5))/10 - sin(q6)*((461*cos(q3 + q4)*sin(q1 + q2)*cos(q5))/5 - (461*sin(q1 + q2)*sin(q3 + q4)*sin(q5))/5) + (1157*sin(q1 + q2)*sin(q3 + q4)*cos(q5))/10
        # dy/dq6
        J_26=(461*cos(q1 + q2)*sin(q6))/5 - cos(q6)*((461*cos(q3 + q4)*sin(q1 + q2)*sin(q5))/5 + (461*sin(q1 + q2)*sin(q3 + q4)*cos(q5))/5)
        # dy/dq7
        J_27=0.
        # dy/dq8
        J_28=0.

        # dz/dq1
        J_31=0
        # dz/dq2
        J_32=0.
        # dz/dq3
        J_33=(1157*sin(q3 + q4)*sin(q5))/10 - (6129*cos(q3))/10 - sin(q6)*((461*cos(q3 + q4)*sin(q5))/5 + (461*sin(q3 + q4)*cos(q5))/5) - (1157*cos(q3 + q4)*cos(q5))/10 - (2858*cos(q3 + q4))/5
        # dz/dq4
        J_34=(1157*sin(q3 + q4)*sin(q5))/10 - sin(q6)*((461*cos(q3 + q4)*sin(q5))/5 + (461*sin(q3 + q4)*cos(q5))/5) - (1157*cos(q3 + q4)*cos(q5))/10 - (2858*cos(q3 + q4))/5
        # dz/dq5
        J_35=(1157*sin(q3 + q4)*sin(q5))/10 - (1157*cos(q3 + q4)*cos(q5))/10 - sin(q6)*((461*cos(q3 + q4)*sin(q5))/5 + (461*sin(q3 + q4)*cos(q5))/5)
        # dz/dq6
        J_36=cos(q6)*((461*cos(q3 + q4)*cos(q5))/5 - (461*sin(q3 + q4)*sin(q5))/5)
        # dz/dq7
        J_37=0.
        # dz/dq8
        J_38=0.

        # second half of Jacobian
        omega01=self.T01[0:3,2].reshape([3,1])
        omega02=self.T02[0:3,2].reshape([3,1])
        omega03=self.T03[0:3,2].reshape([3,1])
        omega04=self.T04[0:3,2].reshape([3,1])
        omega05=self.T05[0:3,2].reshape([3,1])
        omega06=self.T06[0:3,2].reshape([3,1])
        omega07=self.T07[0:3,2].reshape([3,1])
        omega08=self.T08[0:3,2].reshape([3,1])

        J_second_half=np.hstack([omega01,omega02,omega03,omega04,omega05,omega06,omega07,omega08])


        J_first_half=np.array([
            [J_11,J_12,J_13,J_14,J_15,J_16,J_17,J_18],
            [J_21,J_22,J_23,J_24,J_25,J_26,J_27,J_28],
            [J_31,J_32,J_33,J_34,J_35,J_36,J_37,J_38]
        ])
        return np.vstack([J_first_half,J_second_half])

    def isRotationMatrix(self,R):
        """
        Checks if a matrix is a valid rotation matrix.
        Link :    https://learnopencv.com/rotation-matrix-to-euler-angles/
        """
        Rt = np.transpose(R)
        shouldBeIdentity = np.dot(Rt, R)
        I = np.identity(3, dtype = R.dtype)
        n = np.linalg.norm(I - shouldBeIdentity)
        return n < 1e-6

    def rotationMatrixToEulerAngles(self,R):
        """
        Calculates rotation matrix to euler angles,The result is the same as MATLAB except the order
        of the euler angles ( x and z are swapped )
        so  this implement is for XYZ order
        """
        assert(self.isRotationMatrix(R))

        sy = math.sqrt(R[0,0] * R[0,0] +  R[1,0] * R[1,0])

        singular = sy < 1e-6

        if  not singular :
            x = math.atan2(R[2,1] , R[2,2])
            y = math.atan2(-R[2,0], sy)
            z = math.atan2(R[1,0], R[0,0])
        else :
            x = math.atan2(-R[1,2], R[1,1])
            y = math.atan2(-R[2,0], sy)
            z = 0

        return np.array([x, y, z])



    def ComputerInverse(Target):
        """
        stop to develop, shoudl writing Report first
        """
        #retriece current joint angles
        q_current=self._Theta
        

    
    

        







    


if __name__ == '__main__':
    kn=Kinematics()
    #kn.Theta=np.array([0,np.radians(37),np.radians(60),0,0,0,0,0],dtype=float)
    #T01,T02,T03,T04,T05,T06,T07,T08=kn.GetTransformMatrices()
    #print(T06)
    kn.q1=0
    kn.q2=90
    kn.q3=30
    #print(kn.Jacobian())
    #print(kn.Jacobian().shape)
    print(kn.T08)


    
    

