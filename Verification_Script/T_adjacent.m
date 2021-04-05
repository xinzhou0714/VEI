function T = T_adjacent(OX	 ,OY    ,OZ    ,PX    ,PY	 ,PZ)
%   PX: relativ offset along old x axis
%   PY: relativ offset along old y axis
%   PZ: relativ offset along old z axis
%   OX:rotation around old x axis
%   OY:rotation around old y axis
%   OZ:rotation around old z axis
T =transl(PX,PY,PZ)*trotx(OX) *troty(OY)*trotz(OZ);
end
