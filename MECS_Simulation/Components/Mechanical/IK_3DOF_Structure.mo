within MECS_Simulation.Components.Mechanical;
model IK_3DOF_Structure
  annotation (Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Bitmap(origin={-4.0,19.0}, extent={{-180.0,-165.0},{180.0,165.0}}, fileName="modelica://MECS_Simulation/Resources/Images/IK_3DOF_Structure.png")}));

  // Parameters
  parameter Modelica.SIunits.Length H=1 "Height offset of Joint 1 " annotation (Dialog(group="Gemetry"));
  parameter Modelica.SIunits.Length L1=1 "Length of  Link 1 " annotation (Dialog(group="Gemetry"));
  parameter Modelica.SIunits.Length L2(displayUnit="m") = 1 "Length of  Link 2" annotation (Dialog(group="Gemetry"));
  final parameter Real A1=90 "rotation around x axis" annotation (Dialog(group="Tranformation"));

  inner Modelica.Mechanics.MultiBody.World world(label2="z", gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity, n={0,0,-1}, animateGravity=false) annotation (Placement(transformation(origin={113.99999999999999,-114.00000000000003}, extent={{22.0,-22.0},{-22.0,22.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0,0,H}) annotation (Placement(transformation(origin={28.0,-114.0}, extent={{20.0,-20.0},{-20.0,20.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation (Placement(transformation(origin={114.0,-46.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
  Joint_rotational joint_rotational(frameRotation(rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, angles={90,0,0}), body(r={L1,0,0}, r_CM={0.5*L1,0,0})) annotation (Placement(transformation(origin={-98.0,-60.0}, extent={{-36.0,-38.0},{36.0,38.0}}, rotation=90.0)));
  Joint_rotational joint_rotational1(frameRotation(rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence), body(r={L2,0,0}, r_CM={0.5*L2,0,0}, m=1)) annotation (Placement(transformation(origin={-98.00000000000001,40.0}, extent={{-36.0,-38.0},{36.0,38.0}}, rotation=90.0)));
  Joint_rotational joint_rotational2(frameRotation(rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence), body(r={0.01,0,0}, m=1)) annotation (Placement(transformation(origin={-96.0,138.0}, extent={{-36.0,-38.0},{36.0,38.0}}, rotation=90.0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(origin={-82.0,78.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1 annotation (Placement(transformation(origin={106.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a2 annotation (Placement(transformation(origin={-2.0,128.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(fixedTranslation.frame_a, world.frame_b) annotation (Line(origin={66.0,-117.0}, points={{-18.0,3.0},{26.0,3.0}}, color={95,95,95}, thickness=0.5));
  connect(fixedTranslation.frame_b, joint_rotational.frame_a) annotation (Line(origin={-39.0,-77.0}, points={{47.0,-37.0},{-59.0,-37.0},{-59.0,-19.0}}, color={95,95,95}, thickness=0.5));
  connect(fixedFrame.frame_a, world.frame_b) annotation (Line(origin={93.0,-80.0}, points={{1.0,34.0},{-21.0,34.0},{-21.0,-34.0},{-1.0,-34.0}}, color={95,95,95}, thickness=0.5));
  connect(joint_rotational.frame_b, joint_rotational1.frame_a) annotation (Line(origin={-97.0,-10.0}, points={{-0.24,-14},{-0.24,14},{-1,14}}, color={95,95,95}, thickness=0.5));
  connect(joint_rotational1.frame_b, joint_rotational2.frame_a) annotation (Line(origin={-98.0,89.0}, points={{0.76,-13},{-2,-13},{-2,-11},{2,-11},{2,13}}, color={95,95,95}, thickness=0.5));
  connect(joint_rotational.flange_a, flange_a) annotation (Line(origin={-110.0,9.0}, points={{-17.64,-69},{-28,-69},{-28,-31},{28,-31},{28,69}}));
  connect(joint_rotational1.flange_a, flange_a2) annotation (Line(origin={-70.0,84.0}, points={{-57.64,-44},{-57.64,-34},{-68,-34},{-68,-6},{68,-6},{68,44}}));
  connect(joint_rotational2.flange_a, flange_a1) annotation (Line(origin={-15.0,65.0}, points={{-110.64,73},{-110.64,75},{-121,75},{-121,35},{121,35},{121,-75}}));
end IK_3DOF_Structure;
