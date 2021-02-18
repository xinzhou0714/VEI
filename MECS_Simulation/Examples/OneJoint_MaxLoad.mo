﻿within MECS_Simulation.Examples;
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
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 5, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));Components.Mechanical.SimpleStructure simpleStructure(joint_rotational(frameOfReference(animation = true)))
    annotation (Placement(transformation(origin = {0.0, -16.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
end OneJoint_MaxLoad;