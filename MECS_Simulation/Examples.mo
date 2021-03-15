within MECS_Simulation;
package Examples "some  example for Mobile Electro Charging System (MECS)"
  extends Modelica.Icons.ExamplesPackage;
  annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
 model OneJoint_MaxLoad
   extends Modelica.Icons.Example;
   import SI = Modelica.SIunits;
   parameter Real kp=5 "Gain of position controller of ax
  is 2"  annotation (Dialog(group="controller"));
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
   connect(initializeFlange.phi_start, axisControlBus.angle_ref) annotation (Line(origin={15.0,-61.0}, points={{29.0,-5.0},{-31.0,-5.0},{-31.0,-1.0}}, color={0,0,127}));
   connect(initializeFlange.w_start, axisControlBus.speed_ref) annotation (Line(origin={16.0,-68.0}, points={{28.0,-6.0},{-32.0,-6.0},{-32.0,6.0}}, color={0,0,127}));
   connect(const.y, initializeFlange.a_start) annotation (Line(origin={13.0,-84.0}, points={{-36.0,-2.0},{31.0,-2.0},{31.0,2.0}}, color={0,0,127}));
   connect(Gearbox.flange_b, initializeFlange.flange) annotation (Line(origin={67.0,-38.0}, points={{-3.0,36.0},{7.0,36.0},{7.0,-36.0},{-1.0,-36.0}}));
   connect(accSensor.flange, Gearbox.flange_b) annotation (Line(origin={67.0,14.0}, points={{3.0,16.0},{-3.0,16.0},{-3.0,-16.0}}));
   connect(speedSensor.flange, Gearbox.flange_b) annotation (Line(origin={67.0,24.0}, points={{3.0,26.0},{-3.0,26.0},{-3.0,-26.0}}));
   connect(angleSensor.flange, Gearbox.flange_b) annotation (Line(origin={67.0,34.0}, points={{3.0,36.0},{-3.0,36.0},{-3.0,-36.0}}));
   connect(angleSensor.phi, axisControlBus.angle) annotation (Line(origin={38.0,4.0}, points={{53.0,66.0},{53.0,80.0},{-36.0,80.0},{-36.0,-66.0},{-54.0,-66.0}}, color={0,0,127}));
   connect(speedSensor.w, axisControlBus.speed) annotation (Line(origin={38.0,-6.0}, points={{53.0,56.0},{62.0,56.0},{62.0,98.0},{-36.0,98.0},{-36.0,-56.0},{-54.0,-56.0}}, color={0,0,127}));
   connect(accSensor.a, axisControlBus.acceleration) annotation (Line(origin={38.0,-16.0}, points={{53.0,46.0},{74.0,46.0},{74.0,114.0},{-36.0,114.0},{-36.0,-46.0},{-54.0,-46.0}}, color={0,0,127}));
 end OneJoint_MaxLoad;

 model OneJoint_MaxLoad_RealTime
   extends Modelica.Icons.Example;
   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
 end OneJoint_MaxLoad_RealTime;

 model IK_2Link

   // Parameters
   parameter Modelica.SIunits.Length H=1 "Height offset of Joint 1 " annotation (Dialog(group="Gemetry"));
   parameter Modelica.SIunits.Length L1=1 "Length of  Link 1 " annotation (Dialog(group="Gemetry"));
   parameter Modelica.SIunits.Length L2(displayUnit="m") = 1 "Length of  Link 2" annotation (Dialog(group="Gemetry"));
   final parameter Modelica.SIunits.Angle Rx=Modelica.Constants.pi/2 "rotation around x axis" annotation (Dialog(group="Tranformation"));

   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), experiment(StartTime=0, StopTime=8, NumberOfIntervals=500, Algorithm="Dassl", Tolerance=0.0001, DoublePrecision=true, StoreEventValue=true));
   extends Modelica.Icons.Example;
   Modelica.Blocks.Sources.TimeTable timeTable_X(table={{0,2},{5,1},{6,1}}) annotation (Placement(transformation(origin={-110.0,62.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Blocks.Sources.TimeTable timeTable_Z(table={{0,1},{5,2.5},{6,2.5}}) annotation (Placement(transformation(origin={-108.0,22.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Blocks.Sources.TimeTable timeTable_Gamma(table={{0,0},{5,30},{6,30}}) annotation (Placement(transformation(origin={-110.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation (Placement(transformation(origin={-76.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Components.Processing.IK_solver_planar iK_solver_planar annotation (Placement(transformation(origin={-16.0,21.0}, extent={{-26.0,-35.0},{26.0,35.0}})));
   Modelica.Blocks.Math.UnitConversions.To_deg to_deg annotation (Placement(transformation(origin={36.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Blocks.Math.UnitConversions.To_deg to_deg1 annotation (Placement(transformation(origin={74.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Blocks.Math.UnitConversions.To_deg to_deg2 annotation (Placement(transformation(origin={112.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Components.Mechanical.IK_3DOF_Structure iK_3DOF_Structure(H=H, L1=L1, L2=L2) annotation (Placement(transformation(origin={108.0,-34.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
   Modelica.Mechanics.Rotational.Sources.Position position annotation (Placement(transformation(origin={62.0,42.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Mechanics.Rotational.Sources.Position position1 annotation (Placement(transformation(origin={54.0,8.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
   Modelica.Mechanics.Rotational.Sources.Position position2 annotation (Placement(transformation(origin={40.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
 equation
   connect(timeTable_Gamma.y, from_deg.u) annotation (Line(origin={-93.0,-38.0}, points={{-6.0,8.0},{5.0,8.0}}, color={0,0,127}));
   connect(timeTable_X.y, iK_solver_planar.Px) annotation (Line(origin={-69.0,51.0}, points={{-30,11},{29.08,11},{29.08,-11.8}}, color={0,0,127}));
   connect(timeTable_Z.y, iK_solver_planar.Pz) annotation (Line(origin={-69.0,18.0}, points={{-28,4},{-7,4},{-7,5.1},{29.08,5.1}}, color={0,0,127}));
   connect(from_deg.y, iK_solver_planar.Rz) annotation (Line(origin={-52.0,-14.0}, points={{-13,-16},{11.56,-16},{11.56,14.7}}, color={0,0,127}));
   connect(iK_solver_planar.Out_q1, to_deg.u) annotation (Line(origin={17.0,65.0}, points={{-7.52,-25.8},{-5,-25.8},{-5,25},{7,25}}, color={0,0,127}));
   connect(iK_solver_planar.Out_q2, to_deg1.u) annotation (Line(origin={36.0,57.0}, points={{-26.52,-33.2},{-24,-33.2},{-24,19},{18,19},{18,33},{26,33}}, color={0,0,127}));
   connect(iK_solver_planar.Out_q3, to_deg2.u) annotation (Line(origin={55.0,48.0}, points={{-45.52,-42.4},{-43,-42.4},{-43,18},{45,18},{45,42}}, color={0,0,127}));
   connect(iK_solver_planar.Out_q1, position.phi_ref) annotation (Line(origin={30.0,41.0}, points={{-20.52,-1.8},{-18,-1.8},{-18,1},{20,1}}, color={0,0,127}));
   connect(position.flange, iK_3DOF_Structure.flange_a) annotation (Line(origin={86.0,8.0}, points={{-14,34},{36,34},{36,-34.2},{13.8,-34.2}}));
   connect(iK_solver_planar.Out_q2, position1.phi_ref) annotation (Line(origin={26.0,16.0}, points={{-16.52,7.8},{16,7.8},{16,-8}}, color={0,0,127}));
   connect(position1.flange, iK_3DOF_Structure.flange_a2) annotation (Line(origin={86.0,-6.0}, points={{-22,14},{21.8,14},{21.8,-15.2}}));
   connect(iK_solver_planar.Out_q3, position2.phi_ref) annotation (Line(origin={23.0,-11.0}, points={{-13.52,16.6},{5,16.6},{5,-19}}, color={0,0,127}));
   connect(position2.flange, iK_3DOF_Structure.flange_a1) annotation (Line(origin={89.0,-31.0}, points={{-39,1},{-39,-19},{29.6,-19},{29.6,-4}}));
 end IK_2Link;

 model IK_2Link_Realtime
   extends Modelica.Icons.Example;
   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
 end IK_2Link_Realtime;
end Examples;
