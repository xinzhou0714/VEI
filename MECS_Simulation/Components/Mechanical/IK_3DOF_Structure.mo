﻿within MECS_Simulation.Components.Mechanical;
model IK_3DOF_Structure
  annotation (Diagram(coordinateSystem(extent = {{-200.0, -200.0}, {200.0, 200.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-200.0, -200.0}, {200.0, 200.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Bitmap(origin = {-4.0, 19.0}, 
      extent = {{-180.0, -165.0}, {180.0, 165.0}}, 
      fileName = "modelica://MECS_Simulation/Resources/Images/IK_3DOF_Structure.png")}));
  inner Modelica.Mechanics.MultiBody.World world(label2 = "z", gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity, n = {0, 0, -1})
    annotation (Placement(transformation(origin = {113.99999999999999, -114.00000000000003}, 
      extent = {{22.0, -22.0}, {-22.0, 22.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, 0, 0.5})
    annotation (Placement(transformation(origin = {28.0, -114.0}, 
      extent = {{20.0, -20.0}, {-20.0, 20.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame
    annotation (Placement(transformation(origin = {114.0, -46.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Joint_rotational joint_rotational
    annotation (Placement(transformation(origin = {-98.0, -60.0}, 
      extent = {{-36.0, -38.0}, {36.0, 38.0}}, 
      rotation = 90.0)));
  Joint_rotational joint_rotational1
    annotation (Placement(transformation(origin = {-98.00000000000001, 40.0}, 
      extent = {{-36.0, -38.0}, {36.0, 38.0}}, 
      rotation = 90.0)));
  Joint_rotational joint_rotational2
    annotation (Placement(transformation(origin = {-96.0, 138.0}, 
      extent = {{-36.0, -38.0}, {36.0, 38.0}}, 
      rotation = 90.0)));
equation 
  connect(fixedTranslation.frame_a, world.frame_b)
    annotation (Line(origin = {66.0, -117.0}, 
      points = {{-18.0, 3.0}, {26.0, 3.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation.frame_b, joint_rotational.frame_a)
    annotation (Line(origin = {-39.0, -77.0}, 
      points = {{47.0, -37.0}, {-59.0, -37.0}, {-59.0, -19.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedFrame.frame_a, world.frame_b)
    annotation (Line(origin = {93.0, -80.0}, 
      points = {{1.0, 34.0}, {-21.0, 34.0}, {-21.0, -34.0}, {-1.0, -34.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(joint_rotational.frame_b, joint_rotational1.frame_a)
    annotation (Line(origin = {-97.0, -10.0}, 
      points = {{0.0, -14.0}, {0.0, 14.0}, {-1.0, 14.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(joint_rotational1.frame_b, joint_rotational2.frame_a)
    annotation (Line(origin = {-98.0, 89.0}, 
      points = {{1.0, -13.0}, {-2.0, -13.0}, {-2.0, -11.0}, {2.0, -11.0}, {2.0, 13.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end IK_3DOF_Structure;