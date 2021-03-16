within MECS_Simulation.Examples;
model FDMU_UR10
  extends Modelica.Icons.Example;
  annotation (Diagram(coordinateSystem(preserveAspectRatio = false)), Icon(
    coordinateSystem(preserveAspectRatio = false)));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathPlanning6 pathPlanning6_1
    annotation (Placement(transformation(origin = {-64.0, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.ControlBus controlBus
    annotation (Placement(transformation(origin = {-70.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType2 axis4 annotation (Placement(transformation(origin = {-18.0, -6.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axis1 annotation (Placement(transformation(origin = {-18.0, -72.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axis2 annotation (Placement(transformation(origin = {-18.0, -48.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType1 axis3 annotation (Placement(transformation(origin = {-18.0, -30.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType2 axis5 annotation (Placement(transformation(origin = {-18.0, 16.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisType2 axis6 annotation (Placement(transformation(origin = {-18.0, 42.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.Mechanical.UR10_Structure uR10_Structure
    annotation (Placement(transformation(origin = {54.00000000000001, -2.0}, 
      extent = {{-30.0, -30.0}, {30.0, 30.0}})));
equation 
  connect(controlBus, pathPlanning6_1.controlBus)
    annotation (Line(origin = {-42.0, 34.0}, 
      points = {{-28.0, -34.0}, {-28.0, 30.0}, {-12.0, 30.0}, {-12.0, 46.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(axis1.axisControlBus, controlBus.axisControlBus1)
    annotation (Line(origin = {-49.0, -36.0}, 
      points = {{21.0, -36.0}, {-21.0, -36.0}, {-21.0, 36.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(controlBus.axisControlBus2, axis2.axisControlBus)
    annotation (Line(origin = {-49.0, -24.0}, 
      points = {{-21.0, 24.0}, {-21.0, -24.0}, {21.0, -24.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(axis3.axisControlBus, controlBus.axisControlBus3)
    annotation (Line(origin = {-49.0, -15.0}, 
      points = {{21.0, -15.0}, {-21.0, -15.0}, {-21.0, 15.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(axis4.axisControlBus, controlBus.axisControlBus4)
    annotation (Line(origin = {-49.0, -3.0}, 
      points = {{21.0, -3.0}, {-21.0, -3.0}, {-21.0, 3.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(axis5.axisControlBus, controlBus.axisControlBus5)
    annotation (Line(origin = {-49.0, 8.0}, 
      points = {{21.0, 8.0}, {-21.0, 8.0}, {-21.0, -8.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(axis6.axisControlBus, controlBus.axisControlBus6)
    annotation (Line(origin = {-49.0, 21.0}, 
      points = {{21.0, 21.0}, {-21.0, 21.0}, {-21.0, -21.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(uR10_Structure.flange_1, axis1.flange)
    annotation (Line(origin = {11.0, -46.0}, 
      points = {{19.0, 26.0}, {19.0, 24.0}, {11.0, 24.0}, {11.0, -26.0}, {-19.0, -26.0}}));
  connect(uR10_Structure.flange_2, axis2.flange)
    annotation (Line(origin = {11.0, -30.0}, 
      points = {{19.0, 17.0}, {3.0, 17.0}, {3.0, -18.0}, {-19.0, -18.0}}));
  connect(uR10_Structure.flange_3, axis3.flange)
    annotation (Line(origin = {11.0, -17.0}, 
      points = {{19.0, 12.0}, {-3.0, 12.0}, {-3.0, -13.0}, {-19.0, -13.0}}));
  connect(uR10_Structure.flange_4, axis4.flange)
    annotation (Line(origin = {11.0, -1.0}, 
      points = {{19.0, 4.0}, {-9.0, 4.0}, {-9.0, -5.0}, {-19.0, -5.0}}));
  connect(uR10_Structure.flange_5, axis5.flange)
    annotation (Line(origin = {11.0, 14.0}, 
      points = {{19.0, -3.0}, {-9.0, -3.0}, {-9.0, 2.0}, {-19.0, 2.0}}));
  connect(uR10_Structure.flange_6, axis6.flange)
    annotation (Line(origin = {11.0, 30.0}, 
      points = {{19.0, -12.0}, {4.0, -12.0}, {4.0, 12.0}, {-19.0, 12.0}}));

end FDMU_UR10;