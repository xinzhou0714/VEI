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
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 8, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
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
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg
    annotation (Placement(transformation(origin = {36.0, 90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg1
    annotation (Placement(transformation(origin = {74.0, 90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg2
    annotation (Placement(transformation(origin = {112.0, 90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.Mechanical.IK_3DOF_Structure iK_3DOF_Structure
    annotation (Placement(transformation(origin = {108.0, -34.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {62.0, 42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position1
    annotation (Placement(transformation(origin = {54.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position2
    annotation (Placement(transformation(origin = {40.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
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
  connect(iK_solver_planar.Out_q1, to_deg.u)
    annotation (Line(origin = {17.0, 65.0}, 
      points = {{-8.0, -26.0}, {-5.0, -26.0}, {-5.0, 25.0}, {7.0, 25.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q2, to_deg1.u)
    annotation (Line(origin = {36.0, 57.0}, 
      points = {{-27.0, -33.0}, {-24.0, -33.0}, {-24.0, 19.0}, {18.0, 19.0}, {18.0, 33.0}, {26.0, 33.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q3, to_deg2.u)
    annotation (Line(origin = {55.0, 48.0}, 
      points = {{-46.0, -42.0}, {-43.0, -42.0}, {-43.0, 18.0}, {45.0, 18.0}, {45.0, 42.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q1, position.phi_ref)
    annotation (Line(origin = {30.0, 41.0}, 
      points = {{-21.0, -2.0}, {-18.0, -2.0}, {-18.0, 1.0}, {20.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(position.flange, iK_3DOF_Structure.flange_a)
    annotation (Line(origin = {86.0, 8.0}, 
      points = {{-14.0, 34.0}, {36.0, 34.0}, {36.0, -34.0}, {14.0, -34.0}}));
  connect(iK_solver_planar.Out_q2, position1.phi_ref)
    annotation (Line(origin = {26.0, 16.0}, 
      points = {{-17.0, 8.0}, {16.0, 8.0}, {16.0, -8.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, iK_3DOF_Structure.flange_a2)
    annotation (Line(origin = {86.0, -6.0}, 
      points = {{-22.0, 14.0}, {22.0, 14.0}, {22.0, -15.0}}));
  connect(iK_solver_planar.Out_q3, position2.phi_ref)
    annotation (Line(origin = {23.0, -11.0}, 
      points = {{-14.0, 17.0}, {5.0, 17.0}, {5.0, -19.0}}, 
      color = {0, 0, 127}));
  connect(position2.flange, iK_3DOF_Structure.flange_a1)
    annotation (Line(origin = {89.0, -31.0}, 
      points = {{-39.0, 1.0}, {-39.0, -19.0}, {30.0, -19.0}, {30.0, -4.0}}));
end IK_2Link;