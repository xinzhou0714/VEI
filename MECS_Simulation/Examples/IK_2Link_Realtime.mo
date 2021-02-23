within MECS_Simulation.Examples;
model IK_2Link_Realtime
  extends Modelica.Icons.Example;

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
  Components.Processing.IK_solver_planar iK_solver_planar(H = H, L1 = L1, L2 = L2)
    annotation (Placement(transformation(origin = {-28.0, 12.999999999999998}, 
      extent = {{-24.0, -27.0}, {24.0, 27.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {42.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg
    annotation (Placement(transformation(origin = {30.0, 84.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position1
    annotation (Placement(transformation(origin = {42.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position2
    annotation (Placement(transformation(origin = {42.0, -54.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg1
    annotation (Placement(transformation(origin = {66.0, 84.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg2
    annotation (Placement(transformation(origin = {102.0, 84.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.Mechanical.IK_3DOF_Structure iK_3DOF_Structure(H = H, L1 = L1, L2 = L2)
    annotation (Placement(transformation(origin = {102.0, -18.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
equation 
  connect(position.phi_ref, iK_solver_planar.Out_q1)
    annotation (Line(origin = {13.0, 19.0}, 
      points = {{17.0, -9.0}, {17.0, 9.0}, {-17.0, 9.0}, {-17.0, 8.0}}, 
      color = {0, 0, 127}));
  connect(position1.phi_ref, iK_solver_planar.Out_q2)
    annotation (Line(origin = {13.0, -2.0}, 
      points = {{17.0, -18.0}, {8.0, -18.0}, {8.0, 17.0}, {-17.0, 17.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q3, position2.phi_ref)
    annotation (Line(origin = {13.0, -26.0}, 
      points = {{-17.0, 27.0}, {-5.0, 27.0}, {-5.0, -28.0}, {17.0, -28.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q1, to_deg.u)
    annotation (Line(origin = {7.0, 56.0}, 
      points = {{-11.0, -29.0}, {-9.0, -29.0}, {-9.0, 28.0}, {11.0, 28.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q2, to_deg1.u)
    annotation (Line(origin = {24.0, 41.0}, 
      points = {{-28.0, -26.0}, {-26.0, -26.0}, {-26.0, 21.0}, {30.0, 21.0}, {30.0, 43.0}}, 
      color = {0, 0, 127}));
  connect(iK_solver_planar.Out_q3, to_deg2.u)
    annotation (Line(origin = {42.0, 33.0}, 
      points = {{-46.0, -32.0}, {-44.0, -32.0}, {-44.0, 17.0}, {48.0, 17.0}, {48.0, 51.0}}, 
      color = {0, 0, 127}));
  connect(position.flange, iK_3DOF_Structure.flange_a)
    annotation (Line(origin = {73.0, 0.0}, 
      points = {{-21.0, 10.0}, {21.0, 10.0}, {21.0, -10.0}}));
  connect(position1.flange, iK_3DOF_Structure.flange_a2)
    annotation (Line(origin = {77.0, -12.0}, 
      points = {{-25.0, -8.0}, {25.0, -8.0}, {25.0, 7.0}}));
  connect(position2.flange, iK_3DOF_Structure.flange_a1)
    annotation (Line(origin = {83.0, -36.0}, 
      points = {{-31.0, -18.0}, {30.0, -18.0}, {30.0, 17.0}}));
end IK_2Link_Realtime;