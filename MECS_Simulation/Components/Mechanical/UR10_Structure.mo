within MECS_Simulation.Components.Mechanical;
model UR10_Structure
  inner Modelica.Mechanics.MultiBody.World world(
    label2="z",
    gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity,

    n={0,0,-1},
    animateGravity=false)                                                                                                                                                  annotation (Placement(transformation(origin={162,-146},                               extent={{22.0,-22.0},{-22.0,22.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r(
        displayUnit="m") = {0,0,0.038})                                           annotation (Placement(transformation(origin={38,-148},     extent={{20.0,-20.0},{-20.0,20.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation (Placement(transformation(origin={162,-78},     extent={{-20.0,-20.0},{20.0,20.0}})));
  Joint_rotational joint_rotational(frameRotation(r={0,0,0}), body(r={0,-0.086,
          0.09})) annotation (Placement(transformation(
        extent={{-24,-25},{24,25}},
        rotation=90,
        origin={-111,-154})));
  Joint_rotational joint_rotational1 annotation (Placement(transformation(
        extent={{-24,-25},{24,25}},
        rotation=90,
        origin={-111,-88})));
  Joint_rotational joint_rotational2 annotation (Placement(transformation(
        extent={{-24,-25},{24,25}},
        rotation=90,
        origin={-111,-26})));
  Joint_rotational joint_rotational3 annotation (Placement(transformation(
        extent={{-24,-25},{24,25}},
        rotation=90,
        origin={-111,44})));
  Joint_rotational joint_rotational4 annotation (Placement(transformation(
        extent={{-24,-25},{24,25}},
        rotation=90,
        origin={-111,106})));
  Joint_rotational joint_rotational5 annotation (Placement(transformation(
        extent={{-24,-25},{24,25}},
        rotation=90,
        origin={-110,164})));
equation
  connect(fixedTranslation.frame_a, world.frame_b) annotation (Line(origin={76,-127},     points={{-18,-21},
          {32,-21},{32,-21},{42.0001,-21},{42.0001,-19},{64,-19}},                                                         color={95,95,95}, thickness=0.5));
  connect(fixedFrame.frame_a, world.frame_b) annotation (Line(origin={103,-90},    points={{39,12},
          {17,12},{17,-56},{37,-56}},                                                                                                           color={95,95,95}, thickness=0.5));
  connect(fixedTranslation.frame_b, joint_rotational.frame_a) annotation (Line(
      points={{18,-148},{-26,-148},{-26,-190},{-110,-190},{-110,-178},{-111,
          -178}},
      color={95,95,95},
      thickness=0.5));
  connect(joint_rotational.frame_b, joint_rotational1.frame_a) annotation (Line(
      points={{-110.5,-130},{-110.5,-112},{-111,-112}},
      color={95,95,95},
      thickness=0.5));
  connect(joint_rotational1.frame_b, joint_rotational2.frame_a) annotation (
      Line(
      points={{-110.5,-64},{-110.5,-50},{-111,-50}},
      color={95,95,95},
      thickness=0.5));
  connect(joint_rotational2.frame_b, joint_rotational3.frame_a) annotation (
      Line(
      points={{-110.5,-2},{-110.5,20},{-111,20}},
      color={95,95,95},
      thickness=0.5));
  connect(joint_rotational3.frame_b, joint_rotational4.frame_a) annotation (
      Line(
      points={{-110.5,68},{-110.5,82},{-111,82}},
      color={95,95,95},
      thickness=0.5));
  connect(joint_rotational4.frame_b, joint_rotational5.frame_a) annotation (
      Line(
      points={{-110.5,130},{-110.5,140},{-110,140},{-110,140}},
      color={95,95,95},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-200,-200},{200,200}},
        initialScale=0.1)),                                         Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-200,-200},{200,200}},
        initialScale=0.1)));
end UR10_Structure;
