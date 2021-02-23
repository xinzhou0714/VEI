within MECS_Simulation.Examples;
model IK_2Link

  // Parameters
  parameter Modelica.SIunits.Length H = 1 "Height offset of Joint 1 " annotation (Dialog(group = "Gemetry"));
  parameter Modelica.SIunits.Length L1 = 1 "Length of  Link 1 " annotation (Dialog(group = "Gemetry"));
  parameter Modelica.SIunits.Length L2(displayUnit = "m") = 1 "Length of  Link 2" annotation (Dialog(group = "Gemetry"));
  final parameter Modelica.SIunits.Angle Rx = Modelica.Constants.pi / 2 "rotation around x axis" annotation (Dialog(group = "Tranformation"));



  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})));
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.TimeTable timeTable_X(table = {{0, 2}, {5, 1}, {6, 1}})
    annotation (Placement(transformation(origin = {-110.0, 62.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable_Z(table = {{0, 1}, {5, 2}, {6, 2}})
    annotation (Placement(transformation(origin = {-108.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable_Gamma(table = {{0, 0}, {5, 30}, {6, 30}})
    annotation (Placement(transformation(origin = {-110.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg
    annotation (Placement(transformation(origin = {-76.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.Processing.IK_solver_planar iK_solver_planar
    annotation (Placement(transformation(origin = {-16.0, 21.0}, 
      extent = {{-26.0, -35.0}, {26.0, 35.0}})));
equation 
  connect(timeTable_Gamma.y, from_deg.u)
    annotation (Line(origin = {-93.0, -38.0}, 
      points = {{-6.0, 8.0}, {5.0, 8.0}}, 
      color = {0, 0, 127}));
  connect(timeTable_X.y, iK_solver_planar.Px)
    annotation (Line(origin = {-69.0, 51.0}, 
      points = {{-30.0, 11.0}, {29.0, 11.0}, {29.0, -12.0}}, 
      color = {0, 0, 127}));
  connect(timeTable_Z.y, iK_solver_planar.Pz)
    annotation (Line(origin = {-69.0, 18.0}, 
      points = {{-28.0, 4.0}, {-7.0, 4.0}, {-7.0, 5.0}, {29.0, 5.0}}, 
      color = {0, 0, 127}));
  connect(from_deg.y, iK_solver_planar.Rz)
    annotation (Line(origin = {-52.0, -14.0}, 
      points = {{-13.0, -16.0}, {12.0, -16.0}, {12.0, 15.0}}, 
      color = {0, 0, 127}));
end IK_2Link;