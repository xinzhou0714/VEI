function T = T_adjacent(OX	 ,OY    ,OZ    ,PX    ,PY	 ,PZ)
%   OX:rotation around old x axis
%   OY:rotation around old y axis
%   OZ:rotation around old z axis
%   PX: relativ offset along new x axis
%   PY: relativ offset along new y axis
%   PZ: relativ offset along new z axis


T =transl(PX,PY,PZ)*trotx(OX) *troty(OY)*trotz(OZ);

end
