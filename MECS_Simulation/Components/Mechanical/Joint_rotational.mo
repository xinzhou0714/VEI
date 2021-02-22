within MECS_Simulation.Components.Mechanical;
model Joint_rotational
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
      fillColor = {128, 0, 0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-55.0, 55.0}, {55.0, -55.0}}), Rectangle(origin = {-70.0, 0.0}, 
      fillColor = {128, 0, 0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-30.0, 20.0}, {30.0, -20.0}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-40.0, 40.0}, {40.0, -40.0}}), Rectangle(origin = {34.78679656440357, 1.3322676295501878e-15}, 
      rotation = 45.0, 
      lineColor = {255, 255, 255}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-31.970562748477143, 31.970562748477136}, {31.970562748477143, -31.97056274847714}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {0, 128, 0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {56.0, 0.0}, 
      lineColor = {0, 128, 0}, 
      fillColor = {0, 128, 0}, 
      pattern = LinePattern.Dash, 
      lineThickness = 2.0, 
      extent = {{-44.0, 20.0}, {44.0, -20.0}}), Rectangle(origin = {36.0, 18.0}, 
      rotation = 30.0, 
      lineColor = {255, 255, 255}, 
      fillColor = {0, 128, 0}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-44.0, 20.0}, {44.0, -20.0}}), Line(origin = {60.0, 4.0}, 
      points = {{-32.0, -84.0}, {26.0, -46.0}, {32.0, 32.0}, {-14.0, 84.0}}, 
      thickness = 3.0, 
      arrow = {Arrow.Filled, Arrow.Filled}, 
      smooth = Smooth.Bezier), Line(origin = {0.0, 35.0}, 
      points = {{0.0, 35.0}, {0.0, -35.0}}, 
      pattern = LinePattern.Dash, 
      thickness = 3.0)}));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
    annotation (Placement(transformation(origin = {100.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame frameOfReference(
    color_x = {255, 0, 0}, 
    color_y = {0, 180, 0}, 
    color_z = {0, 0, 255}, 
    showLabels = true, 
    length = 0.2, 
    animation = true)
    annotation (Placement(transformation(extent = {{46, -50}, {
      66, -30}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute joint(animation = 
    false, 
    useAxisFlange = true)
    annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, 
      rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation frameRotation(animation = 
    false)
    annotation (Placement(transformation(extent = {{-60, -10}, {-40, 10}}, 
      rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape body(animateSphere = false, 
    animation = true)
    annotation (Placement(transformation(extent = {{40, -10}, {60, 10}}, 
      rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {0.0, 78.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(frame_a, frameRotation.frame_a)
    annotation (Line(origin = {-85.5, 0.0}, 
      points = {{-25.0, 0.0}, {26.0, 0.0}}, 
      thickness = 0.5));
  connect(frameRotation.frame_b, joint.frame_a)
    annotation (Line(origin = {-25.0, 0.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      thickness = 0.5));
  connect(joint.frame_b, body.frame_a)
    annotation (Line(origin = {25.0, 0.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      thickness = 0.5));
  connect(body.frame_b, frame_b)
    annotation (Line(origin = {85.5, 0.0}, 
      points = {{-26.0, 0.0}, {25.0, 0.0}}, 
      thickness = 0.5));
  connect(joint.axis, flange_a)
    annotation (Line(origin = {0.0, 30.0}, 
      points = {{0.0, -20.0}, {0.0, 20.0}}));
  connect(joint.frame_b, frameOfReference.frame_a)
    annotation (Line(origin = {28.0, -20.0}, 
      points = {{-18.0, 20.0}, {-8.0, 20.0}, {-8.0, -20.0}, {18.0, -20.0}}, 
      thickness = 0.5));
end Joint_rotational;