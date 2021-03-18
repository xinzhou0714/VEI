within MECS_Simulation.Examples;
model FDMU_UR10_Realtime
  extends Modelica.Icons.Example;
  Components.Communication.ReceiveModule6axis receiveModule
    annotation (Placement(transformation(extent={{-94,60},{-64,90}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false)));

  import SI = Modelica.SIunits;

  parameter SI.Time refStartTime=0 "Start time of reference motion";
  parameter SI.Time refSwingTime=0.5 "Additional time after reference motion is in rest before simulation is stopped";
  parameter Real startAngle1(unit="deg") = 0 "Start angle of axis 1"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle2(unit="deg") = -90 "Start angle of axis 2"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle3(unit="deg") = 0 "Start angle of axis 3"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle4(unit="deg") = 0 "Start angle of axis 4"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle5(unit="deg") = 0 "Start angle of axis 5"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle6(unit="deg") = 0 "Start angle of axis 6"
    annotation (Dialog(tab="Reference", group="startAngles"));

  parameter Real endAngle1=10 "End angle of axis 1"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle2(unit="deg") = -50 "End angle of axis 2"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle3(unit="deg") = 88 "End angle of axis 3"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle4(unit="deg") = -93 "End angle of axis 4"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle5(unit="deg") = -89 "End angle of axis 5"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle6=0 "End angle of axis 6"
    annotation (Dialog(tab="Reference", group="endAngles"));

  parameter SI.AngularVelocity refSpeedMax[6]={3.1415926535898,3.1415926535898,3.1415926535898,2.0943951023932,2.0943951023932,2.0943951023932} "Maximum reference speeds of all joints"
    annotation (Dialog(tab="Reference", group="Limits"));
  parameter SI.AngularAcceleration refAccMax[6]={15.707963267949,15.707963267949,15.707963267949,10.471975511966,10.471975511966,10.471975511966} "Maximum reference accelerations of all joints"
    annotation (Dialog(tab="Reference", group="Limits"));

  parameter Real kp1=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 1"));
  parameter Real ks1=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 1"));
  parameter SI.Time Ts1=0.05 "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 1"));
  parameter Real kp2=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 2"));
  parameter Real ks2=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 2"));
  parameter SI.Time Ts2=0.05 "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 2"));
  parameter Real kp3=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 3"));
  parameter Real ks3=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 3"));
  parameter SI.Time Ts3=0.05 "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 3"));
  parameter Real kp4=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 4"));
  parameter Real ks4=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 4"));
  parameter SI.Time Ts4=0.05 "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 4"));
  parameter Real kp5=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 5"));
  parameter Real ks5=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 5"));
  parameter SI.Time Ts5=0.05 "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 5"));
  parameter Real kp6=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 6"));
  parameter Real ks6=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 6"));
  parameter SI.Time Ts6=0.05 "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 6"));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.ControlBus controlBus annotation (Placement(transformation(origin={-70.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType2 axis4(kp=kp4, ks=ks4, Ts=Ts4, k=0.2365, w=6250, D=0.55, J=1.6e-4, ratio=200, Rv0=21.8, Rv1=9.8, peak=26.7/21.8) annotation (Placement(transformation(origin={-18.0,-6.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axis1(kp=kp1, ks=ks1, Ts=Ts1) annotation (Placement(transformation(origin={-18.0,-72.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axis2(kp=kp2, ks=ks2, Ts=Ts2, w=5500, ratio=200, Rv0=0.5, c=8, cd=0.01) annotation (Placement(transformation(origin={-18.0,-48.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axis3(kp=kp3, ks=ks3, Ts=Ts3, w=5500, ratio=60, Rv0=0.7, Rv1=(0.2/130), peak=1, c=58, cd=0.04) annotation (Placement(transformation(origin={-18.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType2 axis5(kp=kp5, ks=ks5, Ts=Ts5, k=0.2608, w=6250, D=0.55, J=1.8e-4, ratio=200, Rv0=30.1, Rv1=0.03, peak=39.6/30.1) annotation (Placement(transformation(origin={-18.0,16.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType2 axis6(kp=kp6, ks=ks6, Ts=Ts6, k=0.0842, w=7400, D=0.27, J=4.3e-5, ratio=200, Rv0=10.9, Rv1=3.92, peak=16.8/10.9) annotation (Placement(transformation(origin={-18.0,42.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Components.Mechanical.UR10_Structure uR10_Structure annotation (Placement(transformation(origin={54.00000000000001,-2.0}, extent={{-30.0,-30.0},{30.0,30.0}})));
equation
  connect(axis1.axisControlBus, controlBus.axisControlBus1) annotation (Line(origin={-49.0,-36.0}, points={{21,-36},{-20.95,-36},{-20.95,36.05}}, color={255,204,51}, thickness=0.5));
  connect(controlBus.axisControlBus2, axis2.axisControlBus) annotation (Line(origin={-49.0,-24.0}, points={{-20.95,24.05},{-20.95,-24},{21,-24}}, color={255,204,51}, thickness=0.5));
  connect(axis3.axisControlBus, controlBus.axisControlBus3) annotation (Line(origin={-49.0,-15.0}, points={{21,-15},{-20.95,-15},{-20.95,15.05}}, color={255,204,51}, thickness=0.5));
  connect(axis4.axisControlBus, controlBus.axisControlBus4) annotation (Line(origin={-49.0,-3.0}, points={{21,-3},{-20.95,-3},{-20.95,3.05}}, color={255,204,51}, thickness=0.5));
  connect(axis5.axisControlBus, controlBus.axisControlBus5) annotation (Line(origin={-49.0,8.0}, points={{21,8},{-20.95,8},{-20.95,-7.95}}, color={255,204,51}, thickness=0.5));
  connect(axis6.axisControlBus, controlBus.axisControlBus6) annotation (Line(origin={-49.0,21.0}, points={{21,21},{-20.95,21},{-20.95,-20.95}}, color={255,204,51}, thickness=0.5));
  connect(uR10_Structure.flange_1, axis1.flange) annotation (Line(origin={11.0,-46.0}, points={{19.0,26.0},{19.0,24.0},{11.0,24.0},{11.0,-26.0},{-19.0,-26.0}}));
  connect(uR10_Structure.flange_2, axis2.flange) annotation (Line(origin={11.0,-30.0}, points={{19,17.5},{3,17.5},{3,-18},{-19,-18}}));
  connect(uR10_Structure.flange_3, axis3.flange) annotation (Line(origin={11.0,-17.0}, points={{19.0,12.0},{-3.0,12.0},{-3.0,-13.0},{-19.0,-13.0}}));
  connect(uR10_Structure.flange_4, axis4.flange) annotation (Line(origin={11.0,-1.0}, points={{19,4.1},{-9,4.1},{-9,-5},{-19,-5}}));
  connect(uR10_Structure.flange_5, axis5.flange) annotation (Line(origin={11.0,14.0}, points={{19,-3.4},{-9,-3.4},{-9,2},{-19,2}}));
  connect(uR10_Structure.flange_6, axis6.flange) annotation (Line(origin={11.0,30.0}, points={{19.3,-12.5},{4,-12.5},{4,12},{-19,12}}));

  connect(receiveModule.controlBus, controlBus) annotation (Line(points={{-65.65,75.75},{-66,75.75},{-66,76},{-52,76},{-52,42},{-70,42},{-70,0}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,8}}));
end FDMU_UR10_Realtime;
