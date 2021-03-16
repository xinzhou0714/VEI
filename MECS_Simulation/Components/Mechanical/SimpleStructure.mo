within MECS_Simulation.Components.Mechanical;
model SimpleStructure
  annotation (Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Bitmap(origin={0.0,10.0}, extent={{-180.0,-140.0},{180.0,140.0}}, fileName="modelica://MECS_Simulation/Resources/Images/SimpleStructure.png"),Line(origin={-30.0,-25.0}, points={{-140.0,25.0},{140.0,-25.0}}, color={255,255,0}, thickness=3.0, arrow={Arrow.None,Arrow.Filled})}));
  Joint_rotational joint_rotational(frameRotation(angles={90,0,0}, rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence), body(r_CM={-0.809,0,0.112}, I_11=0.281, I_22=8.327, I_33=8.100, I_31=-3.476, r={-1,0,0}, m=31.334, I_21=0, I_32=0, animateSphere=true, animation=true)) annotation (Placement(transformation(origin={-86.0,1.7763568394002505e-15}, extent={{-40.0,-46.0},{40.0,46.0}}, rotation=90.0)));
  inner Modelica.Mechanics.MultiBody.World world(label2="z", gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity, n={0,0,-1}) annotation (Placement(transformation(origin={113.99999999999999,-114.00000000000003}, extent={{22.0,-22.0},{-22.0,22.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(origin={-180.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0,-0.086,0.128}) annotation (Placement(transformation(origin={28.0,-114.0}, extent={{20.0,-20.0},{-20.0,20.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation (Placement(transformation(origin={114.0,-46.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
equation
  connect(flange_a, joint_rotational.flange_a) annotation (Line(origin={-151.0,0.0}, points={{-29,0},{29.12,0}}));
  connect(fixedTranslation.frame_a, world.frame_b) annotation (Line(origin={66.0,-117.0}, points={{-18.0,3.0},{26.0,3.0}}, color={95,95,95}, thickness=0.5));
  connect(fixedTranslation.frame_b, joint_rotational.frame_a) annotation (Line(origin={-39.0,-77.0}, points={{47.0,-37.0},{-47.0,-37.0},{-47.0,37.0}}, color={95,95,95}, thickness=0.5));
  connect(fixedFrame.frame_a, world.frame_b) annotation (Line(origin={93.0,-80.0}, points={{1.0,34.0},{-21.0,34.0},{-21.0,-34.0},{-1.0,-34.0}}, color={95,95,95}, thickness=0.5));
end SimpleStructure;
