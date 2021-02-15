function T = T_SingleJoint(OX	 ,OY    ,OZ    ,PX    ,PY	 ,PZ)
%T_JOINT Summary of this function goes here
%   Detailed explanation goes here
%   OX:rotation around old x axis
%   OY:rotation around old y axis
%   OZ:rotation around old z axis
%   PX: relativ offset along new x axis
%   PY: relativ offset along new y axis
%   PZ: relativ offset along new z axis


T =trotx(OX) *troty(OY)*trotz(OZ)*transl(PX,PY,PZ);

end
