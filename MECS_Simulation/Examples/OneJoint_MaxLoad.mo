within MECS_Simulation.Examples;
model OneJoint_MaxLoad
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  parameter Real kp = 5 "Gain of position controller of axis 2";
  parameter Real ks = 0.5 "Gain of speed controller of axis 2";
  parameter SI.Time Ts = 0.05
    "Time constant of integrator of speed controller of axis 2";
  parameter Real startAngle(unit = "deg") = 0 "Start angle of axis 2";
  parameter Real endAngle(unit = "deg") = 120 "End angle of axis 2";

  parameter SI.Time swingTime = 0.5
    "Additional time after reference motion is in rest before simulation is stopped";
  parameter SI.AngularVelocity refSpeedMax = 3 "Maximum reference speed";
  parameter SI.AngularAcceleration refAccMax = 10
    "Maximum reference acceleration";
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathPlanning1 pathPlanning1_1
    annotation (Placement(transformation(origin = {-76.0, -6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axisType1_1
    annotation (Placement(transformation(origin = {16.0, -4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
end OneJoint_MaxLoad;