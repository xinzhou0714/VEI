within MECS_Simulation.Components.Processing;
model FK_planar "Forward kinematic of a RRR-planar manipulator"

  // parameters
  parameter Modelica.SIunits.Length H=1 "Height offset of Joint 1 " annotation (Dialog(group="Gemetry"));
  parameter Modelica.SIunits.Length L1=1 "Length of  Link 1 " annotation (Dialog(group="Gemetry"));
  parameter Modelica.SIunits.Length L2(displayUnit="m") = 1 "Length of  Link 2" annotation (Dialog(group="Gemetry"));
  final parameter Modelica.SIunits.Angle Rx=Modelica.Constants.pi/2 "joint 1 orientation correction around x axis";

  Real T[4, 4];

  // connectors
  Modelica.Blocks.Interfaces.RealInput in_q1 "joint 1 angle input" annotation (Placement(transformation(origin={-94.0,48.00000000000001}, extent={{-14.0,-14.0},{14.0,14.0}})));
  Modelica.Blocks.Interfaces.RealInput in_q2 "joint 2 angle input" annotation (Placement(transformation(origin={-94.0,4.0}, extent={{-14.0,-14.0},{14.0,14.0}})));
  Modelica.Blocks.Interfaces.RealInput in_q3 "joint 3 angle input" annotation (Placement(transformation(origin={-94.00000000000001,-47.99999999999999}, extent={{-14.0,-14.0},{14.0,14.0}})));
  Modelica.Blocks.Interfaces.RealOutput Px "end effector coordinate in x axis " annotation (Placement(transformation(origin={106.0,54.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Pz "end effector coordinate in z axis " annotation (Placement(transformation(origin={106.0,2.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealOutput gamma "total euler rotation around z  axis  ,XYZ" annotation (Placement(transformation(origin={106.0,-58.0}, extent={{-10.0,-10.0},{10.0,10.0}})));

  // function

  // equation
equation
  T = calculatePose(in_q1, in_q2, in_q3, H, L1, L2, Rx);
  Px = T[1, 4];
  Pz = T[3, 4];
  gamma = in_q1 + in_q2 + in_q3;

  // graphics
  annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Rectangle(origin={71.0,-3.0}, fillColor={255,255,255},
            lineThickness =                                                                                                                                                                                                        1, extent={{-13.0,67.0},{13.0,-67.0}}), Text(origin={72.0,50.0}, extent={{-12.0,10.0},{12.0,-10.0}}, textString
            =                                                                                                                                                                                                        "X", textStyle={TextStyle.None}), Text(origin={72.0,30.0}, extent={{-12.0,10.0},{12.0,-10.0}}, textString
            =                                                                                                                                                                                                        "Y", textStyle={TextStyle.None}),Text(origin={71.0,5.0}, extent={{-13.0,9.0},{13.0,-9.0}}, textString
            =                                                                                                                                                                                                        "Z", textStyle={TextStyle.None}),Text(origin={69.0,-11.0}, extent={{-15.0,9.0},{15.0,-9.0}}, textString
            =                                                                                                                                                                                                        "α", textStyle={TextStyle.None}),Text(origin={71.0,-34.0}, extent={{-11.0,10.0},{11.0,-10.0}}, textString
            =                                                                                                                                                                                                        "ß", textStyle={TextStyle.None}),Text(origin={72.0,-55.0}, extent={{-12.0,11.0},{12.0,-11.0}}, textString
            =                                                                                                                                                                                                        "γ", textStyle={TextStyle.None}),Text(origin={-64.0,49.0}, extent={{-12.0,13.0},{12.0,-13.0}}, textString
            =                                                                                                                                                                                                        "q1", textStyle={TextStyle.None}),Text(origin={-64.0,5.0}, extent={{-12.0,15.0},{12.0,-15.0}}, textString
            =                                                                                                                                                                                                        "q2", textStyle={TextStyle.None}),Text(origin={-63.0,-44.0}, extent={{-13.0,14.0},{13.0,-14.0}}, textString
            =                                                                                                                                                                                                        "q3", textStyle={TextStyle.None}),Rectangle(origin={-64.0,-3.0}, fillColor={255,255,255},
            lineThickness =                                                                                                                                                                                                        1, extent={{-14.0,67.0},{14.0,-67.0}}), Polygon(origin={7.0,4.0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points={{-43.0,12.0},{-43.0,-12.0},{17.0,-12.0},{17.0,-34.0},{43.0,0.0},{17.0,34.0},{17.0,12.0}}), Rectangle(origin={2.0,-4.0}, fillColor={255,255,255},
            lineThickness =                                                                                                                                                                                                        1, extent={{-90.0,74.0},{90.0,-74.0}}), Text(origin={-2.169696969696986,88.16969696969696}, extent={{-58.169696969696965,12.169696969696972},{58.169696969696986,-12.169696969696957}}, textString
            =                                                                                                                                                                                                        "%name", textStyle={TextStyle.None}), Line(origin={72.0,29.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0),Line(origin={70.0,-11.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0),Line(origin={70.0,-33.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0)}));
public
 function calculatePose
   input Real q1;
   input Real q2;
   input Real q3;
   input Real H;
   input Real L1;
   input Real L2;
   input Real Ax;
   output Real Tbee[4, 4];
  protected
   Real Tb1[4, 4];
   Real T12[4, 4];
   Real T2ee[4, 4];
 algorithm
   // intial
   Tb1 := [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, H; 0, 0, 0, 1]*[1, 0, 0, 0; 0, cos(Ax), -sin(Ax), 0; 0, sin(Ax), cos(Ax), 0; 0, 0, 0, 1]*[cos(q1), -sin(q1), 0, 0; sin(q1), cos(q1), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
   T12 := [1, 0, 0, L1; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]*[cos(q2), -sin(q2), 0, 0; sin(q2), cos(q2), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
   T2ee := [1, 0, 0, L2; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]*[cos(q3), -sin(q3), 0, 0; sin(q3), cos(q3), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
   Tbee := Tb1*T12*T2ee;

 end calculatePose;
end FK_planar;
