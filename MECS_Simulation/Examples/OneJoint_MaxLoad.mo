within MECS_Simulation.Examples;
model OneJoint_MaxLoad
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  parameter Real kp=5 "Gain of position controller of ax
  is 2" annotation (Dialog(group="controller"));
  parameter Real ks=0.5 "Gain of speed controller of axis 2"
    annotation (Dialog(group="controller"));
  parameter SI.Time Ts=0.05 "Time constant of integrator of speed controller of axis 2"
    annotation (Dialog(group="controller"));
  parameter SI.Angle startAngle=-6.28318530717959 "Start angle of axis 2"
    annotation (Dialog(group="motion"));
  parameter SI.Angle endAngle=6.28318530717959 "End angle of axis 2"
    annotation (Dialog(group="motion"));

  parameter SI.Time swingTime=0.5 "Additional time after reference motion is in rest before simulation is stopped";
  parameter SI.AngularVelocity refSpeedMax=2.1 "Maximum reference speed"
    annotation (Dialog(group="motion"));
  parameter SI.AngularAcceleration refAccMax=10.47 "Maximum reference acceleration"
    annotation (Dialog(group="motion"));
  annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), experiment(StartTime=0, StopTime=60, Interval=0.001, Algorithm="Dassl", Tolerance=0.0001, DoublePrecision=true, StoreEventValue=true));
  Components.Mechanical.SimpleStructure simpleStructure(joint_rotational(frameOfReference(animation=true))) annotation (Placement(transformation(origin={98.0,-2.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.GearType1 Gearbox(i=200) annotation (Placement(transformation(origin={54.0,-2.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.Motor motor annotation (Placement(transformation(origin={14.0,-2.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.Controller controller(kp=kp, ks=ks, Ts=Ts, ratio=200) annotation (Placement(transformation(origin={-16.0,-4.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus axisControlBus annotation (Placement(transformation(origin={-16.0,-62.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis1(nAxis=1) annotation (Placement(transformation(origin={-58.0,-4.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.KinematicPTP2 kinematicPTP(q_begin={startAngle}, q_end={endAngle}, qd_max={refSpeedMax}, qdd_max={refAccMax}, startTime=0) annotation (Placement(transformation(origin={-118.0,-4.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.Rotational.Components.InitializeFlange initializeFlange annotation (Placement(transformation(origin={56.0,-74.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(origin={-34.0,-86.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor annotation (Placement(transformation(origin={80.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (Placement(transformation(origin={80.0,50.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (Placement(transformation(origin={80.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition=time >= kinematicPTP.endTime + swingTime) annotation (Placement(transformation(origin={-76.0,62.0}, extent={{-40.0,-4.0},{40.0,4.0}})));
equation
  connect(Gearbox.flange_b, simpleStructure.flange_a) annotation (Line(origin={71.0,0.0}, points={{-7.0,-2.0},{9.0,-2.0}}));
  connect(motor.flange_motor, Gearbox.flange_a) annotation (Line(origin={34.0,-2.0}, points={{-10.0,0.0},{10.0,0.0}}));
  connect(kinematicPTP.q, pathToAxis1.q) annotation (Line(origin={-82.0,4.0}, points={{-25.0,0.0},{12.0,0.0}}, color={0,0,127}));
  connect(kinematicPTP.qd, pathToAxis1.qd) annotation (Line(origin={-82.0,-1.0}, points={{-25.0,0.0},{12.0,0.0}}, color={0,0,127}));
  connect(kinematicPTP.qdd, pathToAxis1.qdd) annotation (Line(origin={-82.0,-7.0}, points={{-25.0,0.0},{12.0,0.0}}, color={0,0,127}));
  connect(kinematicPTP.moving, pathToAxis1.moving) annotation (Line(origin={-82.0,-12.0}, points={{-25.0,0.0},{12.0,0.0}}, color={255,0,255}));
  connect(pathToAxis1.axisControlBus, axisControlBus) annotation (Line(origin={-32.0,-33.0}, points={{-16.0,29.0},{-14.0,29.0},{-14.0,-29.0},{16.0,-29.0}}, color={255,204,51}, thickness=0.5));
  connect(controller.axisControlBus, axisControlBus) annotation (Line(origin={-18.0,-38.0}, points={{2.0,24.0},{2.0,-24.0}}, color={255,204,51}, thickness=0.5));
  connect(motor.axisControlBus, axisControlBus) annotation (Line(origin={3.0,-37.0}, points={{19.0,25.0},{19.0,-25.0},{-19.0,-25.0}}, color={255,204,51}, thickness=0.5));
  connect(initializeFlange.phi_start, axisControlBus.angle_ref) annotation (Line(origin={15.0,-61.0}, points={{29,-5},
          {-30.95,-5},{-30.95,-0.95}},                                                                                                                color={0,0,127}));
  connect(initializeFlange.w_start, axisControlBus.speed_ref) annotation (Line(origin={16.0,-68.0}, points={{28,-6},
          {-31.95,-6},{-31.95,6.05}},                                                                                                              color={0,0,127}));
  connect(const.y, initializeFlange.a_start) annotation (Line(origin={13.0,-84.0}, points={{-36.0,-2.0},{31.0,-2.0},{31.0,2.0}}, color={0,0,127}));
  connect(Gearbox.flange_b, initializeFlange.flange) annotation (Line(origin={67.0,-38.0}, points={{-3.0,36.0},{7.0,36.0},{7.0,-36.0},{-1.0,-36.0}}));
  connect(accSensor.flange, Gearbox.flange_b) annotation (Line(origin={67.0,14.0}, points={{3.0,16.0},{-3.0,16.0},{-3.0,-16.0}}));
  connect(speedSensor.flange, Gearbox.flange_b) annotation (Line(origin={67.0,24.0}, points={{3.0,26.0},{-3.0,26.0},{-3.0,-26.0}}));
  connect(angleSensor.flange, Gearbox.flange_b) annotation (Line(origin={67.0,34.0}, points={{3.0,36.0},{-3.0,36.0},{-3.0,-36.0}}));
  connect(angleSensor.phi, axisControlBus.angle) annotation (Line(origin={38.0,4.0}, points={{53,66},
          {53,80},{-36,80},{-36,-65.95},{-53.95,-65.95}},                                                                                                       color={0,0,127}));
  connect(speedSensor.w, axisControlBus.speed) annotation (Line(origin={38.0,-6.0}, points={{53,56},
          {62,56},{62,98},{-36,98},{-36,-55.95},{-53.95,-55.95}},                                                                                                          color={0,0,127}));
  connect(accSensor.a, axisControlBus.acceleration) annotation (Line(origin={38.0,-16.0}, points={{53,46},
          {74,46},{74,114},{-36,114},{-36,-45.95},{-53.95,-45.95}},                                                                                                                color={0,0,127}));
end OneJoint_MaxLoad;
