within MECS_Simulation.Examples;
model OneJoint_MaxLoad
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  parameter Real kp = 5 "Gain of position controller of ax
  is 2"annotation (Dialog(group = "controller"));
  parameter Real ks = 0.5 "Gain of speed controller of axis 2" 
    annotation (Dialog(group = "controller"));
  parameter SI.Time Ts = 0.05
    "Time constant of integrator of speed controller of axis 2" 
    annotation (Dialog(group = "controller"));
  parameter Real startAngle(unit = "deg") = 0 "Start angle of axis 2" 
    annotation (Dialog(group = "motion"));
  parameter Real endAngle(unit = "deg") = 120 "End angle of axis 2" 
    annotation (Dialog(group = "motion"));

  parameter SI.Time swingTime = 0.5
    "Additional time after reference motion is in rest before simulation is stopped";
  parameter SI.AngularVelocity refSpeedMax = 3 "Maximum reference speed" 
    annotation (Dialog(group = "motion"));
  parameter SI.AngularAcceleration refAccMax = 10
    "Maximum reference acceleration" 
    annotation (Dialog(group = "motion"));
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 5, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
  Components.Mechanical.SimpleStructure simpleStructure(joint_rotational(frameOfReference(animation = true)))
    annotation (Placement(transformation(origin = {98.0, -2.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.GearType1 Gearbox(i = 200)
    annotation (Placement(transformation(origin = {54.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.Motor motor
    annotation (Placement(transformation(origin = {14.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.Controller controller(kp = kp, ks = ks, Ts = Ts, ratio = 200)
    annotation (Placement(transformation(origin = {-16.0, -4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus axisControlBus
    annotation (Placement(transformation(origin = {-16.0, -62.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis1
    annotation (Placement(transformation(origin = {-58.0, -4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.KinematicPTP2 kinematicPTP
    annotation (Placement(transformation(origin = {-106.0, -4.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(Gearbox.flange_b, simpleStructure.flange_a)
    annotation (Line(origin = {71.0, 0.0}, 
      points = {{-7.0, -2.0}, {9.0, -2.0}}));
  connect(motor.flange_motor, Gearbox.flange_a)
    annotation (Line(origin = {34.0, -2.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}));
  connect(kinematicPTP.q, pathToAxis1.q)
    annotation (Line(origin = {-82.0, 4.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(kinematicPTP.qd, pathToAxis1.qd)
    annotation (Line(origin = {-82.0, -1.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(kinematicPTP.qdd, pathToAxis1.qdd)
    annotation (Line(origin = {-82.0, -7.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(kinematicPTP.moving, pathToAxis1.moving)
    annotation (Line(origin = {-82.0, -12.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(pathToAxis1.axisControlBus, axisControlBus)
    annotation (Line(origin = {-32.0, -33.0}, 
      points = {{-16.0, 29.0}, {-14.0, 29.0}, {-14.0, -29.0}, {16.0, -29.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(controller.axisControlBus, axisControlBus)
    annotation (Line(origin = {-18.0, -38.0}, 
      points = {{2.0, 24.0}, {2.0, -24.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(motor.axisControlBus, axisControlBus)
    annotation (Line(origin = {3.0, -37.0}, 
      points = {{19.0, 25.0}, {19.0, -25.0}, {-19.0, -25.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
end OneJoint_MaxLoad;