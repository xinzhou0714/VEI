within MECS_Simulation.Components.Processing;
model IK_solver_planar
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-69.0, -3.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-13.0, 67.0}, {13.0, -67.0}}), Text(origin = {-68.0, 50.0}, 
      extent = {{-12.0, 10.0}, {12.0, -10.0}}, 
      textString = "X", 
      textStyle = {TextStyle.None}), Text(origin = {-68.0, 30.0}, 
      extent = {{-12.0, 10.0}, {12.0, -10.0}}, 
      textString = "Y", 
      textStyle = {TextStyle.None}), Text(origin = {-69.0, 5.0}, 
      extent = {{-13.0, 9.0}, {13.0, -9.0}}, 
      textString = "Z", 
      textStyle = {TextStyle.None}), Text(origin = {-71.0, -11.0}, 
      extent = {{-15.0, 9.0}, {15.0, -9.0}}, 
      textString = "α", 
      textStyle = {TextStyle.None}), Text(origin = {-69.0, -34.0}, 
      extent = {{-11.0, 10.0}, {11.0, -10.0}}, 
      textString = "ß", 
      textStyle = {TextStyle.None}), Text(origin = {-68.0, -55.0}, 
      extent = {{-12.0, 11.0}, {12.0, -11.0}}, 
      textString = "γ", 
      textStyle = {TextStyle.None}), Text(origin = {62.0, 49.0}, 
      extent = {{-12.0, 13.0}, {12.0, -13.0}}, 
      textString = "q1", 
      textStyle = {TextStyle.None}), Text(origin = {62.0, 5.0}, 
      extent = {{-12.0, 15.0}, {12.0, -15.0}}, 
      textString = "q2", 
      textStyle = {TextStyle.None}), Text(origin = {63.0, -44.0}, 
      extent = {{-13.0, 14.0}, {13.0, -14.0}}, 
      textString = "q3", 
      textStyle = {TextStyle.None}), Rectangle(origin = {62.0, -3.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-14.0, 67.0}, {14.0, -67.0}}), Polygon(origin = {-1.0, -6.0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-43.0, 12.0}, {-43.0, -12.0}, {17.0, -12.0}, {17.0, -34.0}, {43.0, 0.0}, {17.0, 34.0}, {17.0, 12.0}}), Rectangle(origin = {-2.0, -4.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-90.0, 74.0}, {90.0, -74.0}}), Text(origin = {1.8303030303030141, 84.16969696969696}, 
      extent = {{-58.169696969696965, 12.169696969696972}, {58.169696969696986, -12.169696969696957}}, 
      textString = "%name", 
      textStyle = {TextStyle.None}), Line(origin = {-68.00000000000001, 29.0}, 
      points = {{-9.999999999999986, 5.0}, {10.000000000000014, -5.0}}, 
      color = {255, 0, 0}, 
      thickness = 3.0), Line(origin = {-70.00000000000001, -11.0}, 
      points = {{-9.999999999999986, 5.0}, {10.000000000000014, -5.0}}, 
      color = {255, 0, 0}, 
      thickness = 3.0), Line(origin = {-70.00000000000001, -33.0}, 
      points = {{-9.999999999999986, 5.0}, {10.000000000000014, -5.0}}, 
      color = {255, 0, 0}, 
      thickness = 3.0)}));//  Imports



  // Parameters
  parameter Modelica.SIunits.Length H = 1 "Height offset of Joint 1 " annotation (Dialog(group = "Gemetry"));
  parameter Modelica.SIunits.Length L1 = 1 "Length of  Link 1 " annotation (Dialog(group = "Gemetry"));
  parameter Modelica.SIunits.Length L2(displayUnit = "m") = 1 "Length of  Link 2" annotation (Dialog(group = "Gemetry"));
  final parameter Modelica.SIunits.Angle Rx = Modelica.Constants.pi / 2 "rotation around x axis" annotation (Dialog(group = "Tranformation"));

  Modelica.SIunits.Angle q1;
  Modelica.SIunits.Angle q2;
  Modelica.SIunits.Angle q3;

  Modelica.Blocks.Interfaces.RealInput Px "Position in x  axis w.r.t base frame" 
    annotation (Placement(transformation(origin = {-92.0, 52.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Blocks.Interfaces.RealInput Pz "Position in z  axis w.r.t base frame" 
    annotation (Placement(transformation(origin = {-92.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Rz "rotation around z axis, can vary" 
    annotation (Placement(transformation(origin = {-94.0, -58.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Out_q1 "Joint 1 angle" 
    annotation (Placement(transformation(origin = {98.0, 52.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Out_q2 "Joint 2 angle" 
    annotation (Placement(transformation(origin = {98.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Out_q3 "Joint 3 angle" 
    annotation (Placement(transformation(origin = {98.0, -44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  Px = L2 * cos(q1 + q2) + L1 * cos(q1);
  Pz = H + L2 * sin(q1 + q2) + L1 * sin(q1);
  Rz = q1 + q2 + q3;
  Out_q1 = rem(q1, 2 * Modelica.Constants.pi);
  Out_q2 = rem(q2, 2 * Modelica.Constants.pi);
  Out_q3 = rem(q3, 2 * Modelica.Constants.pi);

end IK_solver_planar;