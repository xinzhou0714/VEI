within MECS_Simulation.Components.Mechanical;
model UR10_Structure
  inner Modelica.Mechanics.MultiBody.World world(
    label2 = "z", 
    gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity, 
    n = {0, 0, -1}, 
    animateGravity = false) annotation (Placement(transformation(origin = {162, -146}, extent = {{22.0, -22.0}, {-22.0, 22.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r(
    displayUnit = "m") = {0, 0, 0.038}) annotation (Placement(transformation(origin = {38, -148}, extent = {{20.0, -20.0}, {-20.0, 20.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation (Placement(transformation(origin = {162, -78}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Joint_rotational Base(
    frameRotation(r = {0, 0, 0}, 
      rotationType
       = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence), body(r = {0, -0.086, 
      0.09}, 
      m
       = 7.10, 
      r_CM
       = {-0.000005, -0.011616, 0.078477}, 
      I_11
       = 0.026512, 
      I_22
       = 0.024755, 
      I_33
       = 0.023377, 
      I_21
       = 0.000000, 
      I_31
       = -0.000002, 
      I_32
       = -0.001983))



    annotation (Placement(transformation(
      extent = {{-24, -25}, {24, 25}}, 
      rotation = 90, 
      origin = {-111, -154})));
  Joint_rotational shoulder(frameRotation(rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, angles = {90, 0, 0}), body(r = {-0.6129, 0, 0.02189}, m = 12.7, r_CM = {-0.251040, 0.000006, 0.084338}, I_11 = 0.029433, I_22 = 0.662793, I_33 = 0.660049, I_21 = -0.000020, I_31 = -0.006079, I_32 = 0.000005)) annotation (Placement(transformation(
    extent = {{-24, -25}, {24, 25}}, 
    rotation = 90, 
    origin = {-111, -88})));
  Joint_rotational Elbow(frameRotation(rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence), body(r = {-0.5716, 0, 0.002}, r_CM = {-0.256928, 0.000000, -0.056470}, m = 4.27, I_11 = 0.005530, I_22 = 0.183015, I_33 = 0.182685, I_21 = -0.000001, I_31 = -0.000085, I_32 = 0.000000)) annotation (Placement(transformation(
    extent = {{-24, -25}, {24, 25}}, 
    rotation = 90, 
    origin = {-111, -26})));
  Joint_rotational wrist1(body(r = {-0.0617, 0, 0.054}, m = 2, 
    I_11
     = 0.002426, 
    I_22
     = 0.003061, 
    I_33
     = 0.002830, 
    I_21
     = 0.000000, 
    I_31
     = -0.000249, 
    I_32
     = 0.000000, 
    r_CM
     = {-0.009736, -0.000002, 0.046398})) annotation (Placement(transformation(
      extent = {{-24, -25}, {24, 25}}, 
      rotation = 90, 
      origin = {-111, 44})));
  Joint_rotational wrist2(body(r = {0.0617, 0, 0.054}, m = 2), frameRotation(angles = {0, -90, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence)) annotation (Placement(transformation(
    extent = {{-24, -25}, {24, 25}}, 
    rotation = 90, 
    origin = {-111, 106})));
  Joint_rotational wrist3(body(r = {0, 0, 0.0305}, m = 0.365), frameRotation(angles = {0, 90, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence)) annotation (Placement(transformation(
    extent = {{-24, -25}, {24, 25}}, 
    rotation = 90, 
    origin = {-110, 164})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1 annotation (Placement(transformation(origin = {-160.0, -120.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_2 annotation (Placement(transformation(origin = {-160.0, -70.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_3 annotation (Placement(transformation(origin = {-160.0, -20.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_4 annotation (Placement(transformation(origin = {-160.0, 34.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_5 annotation (Placement(transformation(origin = {-160.0, 84.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_6 annotation (Placement(transformation(origin = {-158.0, 130.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox Load(length = 0.1, width = 0.1, density = 10000, 
    r = {0, 0, 0.1})
    annotation (Placement(transformation(origin = {3.999999999999993, 134.0}, 
      extent = {{-18.0, -18.0}, {18.0, 18.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame frameOfReference(color_x = {255, 0, 0}, color_y = {0, 180, 0}, color_z = {0, 0, 255}, showLabels = true, length = 0.2, animation = true) annotation (Placement(transformation(origin = {0.0, 88.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(fixedTranslation.frame_a, world.frame_b) annotation (Line(origin = {76, -127}, points = {{-18, -21}, 
    {32, -21}, {32, -21}, {42.0001, -21}, {42.0001, -19}, {64, -19}}, color = {95, 95, 95}, thickness = 0.5));
  connect(fixedFrame.frame_a, world.frame_b) annotation (Line(origin = {103, -90}, points = {{39, 12}, 
    {17, 12}, {17, -56}, {37, -56}}, color = {95, 95, 95}, thickness = 0.5));
  connect(fixedTranslation.frame_b, Base.frame_a) annotation (Line(
    points = {{18, -148}, {-26, -148}, {-26, -190}, {-110, -190}, {-110, -178}, {-111, 
    -178}}, 
    color = {95, 95, 95}, 
    thickness = 0.5));
  connect(Base.frame_b, shoulder.frame_a) annotation (Line(
    points = {{-110.5, -130}, {-110.5, -112}, {-111, -112}}, 
    color = {95, 95, 95}, 
    thickness = 0.5));
  connect(shoulder.frame_b, Elbow.frame_a) annotation (
    Line(
      points = {{-110.5, -64}, {-110.5, -50}, {-111, -50}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(Elbow.frame_b, wrist1.frame_a) annotation (
    Line(
      points = {{-110.5, -2}, {-110.5, 20}, {-111, 20}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(wrist1.frame_b, wrist2.frame_a) annotation (
    Line(
      points = {{-110.5, 68}, {-110.5, 82}, {-111, 82}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(wrist2.frame_b, wrist3.frame_a) annotation (
    Line(
      points = {{-110.5, 130}, {-110.5, 140}, {-110, 140}, {-110, 140}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio = false, 
    extent = {{-200, -200}, {200, 200}}, 
    initialScale = 0.1)), 
    Icon(coordinateSystem(extent = {{-200.0, -200.0}, {200.0, 200.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Bitmap(origin = {70.0, 5.0}, 
      extent = {{-170.0, -155.0}, {170.0, 155.0}}, 
      fileName = "modelica://MECS_Simulation/Resources/Images/UR10.png"), Text(origin = {0.0, 175.0}, 
      extent = {{-70.0, 15.0}, {70.0, -15.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None}), Text(origin = {-136.0, -120.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "1", 
      textStyle = {TextStyle.None}), Text(origin = {-136.0, -70.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "2", 
      textStyle = {TextStyle.None}), Text(origin = {-136.0, -20.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "3", 
      textStyle = {TextStyle.None}), Text(origin = {-138.0, 34.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "4", 
      textStyle = {TextStyle.None}), Text(origin = {-138.0, 86.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "5", 
      textStyle = {TextStyle.None}), Text(origin = {-136.0, 130.0}, 
      extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
      textString = "6", 
      textStyle = {TextStyle.None}), Rectangle(origin = {-72.0, 131.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-26.0, 23.0}, {26.0, -23.0}}, 
      radius = 2.0), Text(origin = {-72.0, 132.0}, 
      extent = {{-28.0, 18.0}, {28.0, -18.0}}, 
      textString = "10kg", 
      textStyle = {TextStyle.None})}));
  connect(flange_1, Base.flange_a)
    annotation (Line(origin = {-145.0, -137.0}, 
      points = {{-15.0, 17.0}, {14.0, 17.0}, {14.0, -17.0}}));
  connect(flange_2, shoulder.flange_a)
    annotation (Line(origin = {-145.0, -79.0}, 
      points = {{-15.0, 9.0}, {-5.0, 9.0}, {-5.0, -9.0}, {14.0, -9.0}}));
  connect(flange_3, Elbow.flange_a)
    annotation (Line(origin = {-145.0, -23.0}, 
      points = {{-15.0, 3.0}, {-5.0, 3.0}, {-5.0, -3.0}, {14.0, -3.0}}));
  connect(flange_4, wrist1.flange_a)
    annotation (Line(origin = {-145.0, 39.0}, 
      points = {{-15.0, -5.0}, {-5.0, -5.0}, {-5.0, 5.0}, {14.0, 5.0}}));
  connect(flange_5, wrist2.flange_a)
    annotation (Line(origin = {-145.0, 95.0}, 
      points = {{-15.0, -11.0}, {-5.0, -11.0}, {-5.0, 11.0}, {14.0, 11.0}}));
  connect(flange_6, wrist3.flange_a)
    annotation (Line(origin = {-144.0, 147.0}, 
      points = {{-14.0, -17.0}, {14.0, -17.0}, {14.0, 17.0}}));
  connect(Load.frame_a, wrist3.frame_b)
    annotation (Line(origin = {-73.0, 173.0}, 
      points = {{59.0, -39.0}, {19.0, -39.0}, {19.0, 15.0}, {-37.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frameOfReference.frame_a, Load.frame_a)
    annotation (Line(origin = {-12.0, 111.0}, 
      points = {{2.0, -23.0}, {-42.0, -23.0}, {-42.0, 23.0}, {-2.0, 23.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end UR10_Structure;