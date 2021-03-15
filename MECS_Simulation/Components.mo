within MECS_Simulation;
package Components
  annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
 package Mechanical
   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
  model Joint_rotational
    annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Ellipse(origin={0.0,0.0}, fillColor={128,0,0}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=2.0, extent={{-55.0,55.0},{55.0,-55.0}}),Rectangle(origin={-70.0,0.0}, fillColor={128,0,0}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-30.0,20.0},{30.0,-20.0}}),Ellipse(origin={0.0,0.0}, fillColor={255,255,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=2.0, extent={{-40.0,40.0},{40.0,-40.0}}),Rectangle(origin={34.78679656440357,1.3322676295501878e-15}, rotation=45.0, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-31.970562748477143,31.970562748477136},{31.970562748477143,-31.97056274847714}}),Ellipse(origin={0.0,0.0}, fillColor={0,128,0}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=2.0, extent={{-30.0,-30.0},{30.0,30.0}}),Rectangle(origin={56.0,0.0}, lineColor={0,128,0}, fillColor={0,128,0}, pattern=LinePattern.Dash, lineThickness=2.0, extent={{-44.0,20.0},{44.0,-20.0}}),Rectangle(origin={36.0,18.0}, rotation=30.0, lineColor={255,255,255}, fillColor={0,128,0}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-44.0,20.0},{44.0,-20.0}}),Line(origin={60.0,4.0}, points={{-32.0,-84.0},{26.0,-46.0},{32.0,32.0},{-14.0,84.0}}, thickness=3.0, arrow={Arrow.Filled,Arrow.Filled}, smooth=Smooth.Bezier),Line(origin={0.0,35.0}, points={{0.0,35.0},{0.0,-35.0}}, pattern=LinePattern.Dash, thickness=3.0)}));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(origin={100.0,-2.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Mechanics.MultiBody.Visualizers.FixedFrame frameOfReference(color_x={255,0,0}, color_y={0,180,0}, color_z={0,0,255}, showLabels=true, length=0.2, animation=true) annotation (Placement(transformation(extent={{46,-50},{66,-30}}, rotation=0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute joint(animation=false, useAxisFlange=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation frameRotation(animation=false) annotation (Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
    Modelica.Mechanics.MultiBody.Parts.BodyShape body(animateSphere=false, animation=true) annotation (Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(origin={0.0,78.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  equation
    connect(frame_a, frameRotation.frame_a) annotation (Line(origin={-85.5,0.0}, points={{-25.0,0.0},{26.0,0.0}}, thickness=0.5));
    connect(frameRotation.frame_b, joint.frame_a) annotation (Line(origin={-25.0,0.0}, points={{-15.0,0.0},{15.0,0.0}}, thickness=0.5));
    connect(joint.frame_b, body.frame_a) annotation (Line(origin={25.0,0.0}, points={{-15.0,0.0},{15.0,0.0}}, thickness=0.5));
    connect(body.frame_b, frame_b) annotation (Line(origin={85.5,0.0}, points={{-26.0,0.0},{25.0,0.0}}, thickness=0.5));
    connect(joint.axis, flange_a) annotation (Line(origin={0.0,30.0}, points={{0.0,-20.0},{0.0,20.0}}));
    connect(joint.frame_b, frameOfReference.frame_a) annotation (Line(origin={28.0,-20.0}, points={{-18.0,20.0},{-8.0,20.0},{-8.0,-20.0},{18.0,-20.0}}, thickness=0.5));
  end Joint_rotational;

  model SimpleStructure
    annotation (Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Bitmap(origin={0.0,10.0}, extent={{-180.0,-140.0},{180.0,140.0}}, fileName="modelica://MECS_Simulation/Resources/Images/SimpleStructure.png"),Line(origin={-30.0,-25.0}, points={{-140.0,25.0},{140.0,-25.0}}, color={255,255,0}, thickness=3.0, arrow={Arrow.None,Arrow.Filled})}));
    Joint_rotational joint_rotational(frameRotation(angles={90,0,0}, rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence), body(r_CM={-0.809,0,0.112}, I_11=0.281, I_22=8.327, I_33=8.100, I_31=-3.476, r={-1,0,0}, m=31.334, I_21=0, I_32=0, animateSphere=true, animation=true)) annotation (Placement(transformation(origin={-86.0,1.7763568394002505e-15}, extent={{-40.0,-46.0},{40.0,46.0}}, rotation=90.0)));
    inner Modelica.Mechanics.MultiBody.World world(label2="z", gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity, n={0,0,-1}) annotation (Placement(transformation(origin={113.99999999999999,-114.00000000000003}, extent={{22.0,-22.0},{-22.0,22.0}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(origin={-180.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0,-0.086,0.128}) annotation (Placement(transformation(origin={28.0,-114.0}, extent={{20.0,-20.0},{-20.0,20.0}})));
    Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation (Placement(transformation(origin={114.0,-46.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
  equation
    connect(flange_a, joint_rotational.flange_a) annotation (Line(origin={-151.0,0.0}, points={{-29.0,0.0},{29.0,0.0}}));
    connect(fixedTranslation.frame_a, world.frame_b) annotation (Line(origin={66.0,-117.0}, points={{-18.0,3.0},{26.0,3.0}}, color={95,95,95}, thickness=0.5));
    connect(fixedTranslation.frame_b, joint_rotational.frame_a) annotation (Line(origin={-39.0,-77.0}, points={{47.0,-37.0},{-47.0,-37.0},{-47.0,37.0}}, color={95,95,95}, thickness=0.5));
    connect(fixedFrame.frame_a, world.frame_b) annotation (Line(origin={93.0,-80.0}, points={{1.0,34.0},{-21.0,34.0},{-21.0,-34.0},{-1.0,-34.0}}, color={95,95,95}, thickness=0.5));
  end SimpleStructure;

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
    connect(joint_rotational.frame_b, joint_rotational1.frame_a) annotation (Line(origin={-97.0,-10.0}, points={{0.0,-14.0},{0.0,14.0},{-1.0,14.0}}, color={95,95,95}, thickness=0.5));
    connect(joint_rotational1.frame_b, joint_rotational2.frame_a) annotation (Line(origin={-98.0,89.0}, points={{1.0,-13.0},{-2.0,-13.0},{-2.0,-11.0},{2.0,-11.0},{2.0,13.0}}, color={95,95,95}, thickness=0.5));
    connect(joint_rotational.flange_a, flange_a) annotation (Line(origin={-110.0,9.0}, points={{-18.0,-69.0},{-28.0,-69.0},{-28.0,-31.0},{28.0,-31.0},{28.0,69.0}}));
    connect(joint_rotational1.flange_a, flange_a2) annotation (Line(origin={-70.0,84.0}, points={{-58.0,-44.0},{-58.0,-34.0},{-68.0,-34.0},{-68.0,-6.0},{68.0,-6.0},{68.0,44.0}}));
    connect(joint_rotational2.flange_a, flange_a1) annotation (Line(origin={-15.0,65.0}, points={{-111.0,73.0},{-111.0,75.0},{-121.0,75.0},{-121.0,35.0},{121.0,35.0},{121.0,-75.0}}));
  end IK_3DOF_Structure;
 end Mechanical;

 package Communication
   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
  model Receiver
    annotation (Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, grid={2.0,2.0}), graphics={Bitmap(origin={0.0,0.0}, extent={{-200.0,-200.0},{200.0,200.0}}, fileName="modelica://MECS_Simulation/Resources/Images/receiver.png")}));
    Modelica_DeviceDrivers.Blocks.Communication.UDPReceive uDPReceive annotation (Placement(transformation(origin={-129.0,167.0}, extent={{-25.0,-25.0},{25.0,25.0}}, rotation=270.0)));
    Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte1(width=8) annotation (Placement(transformation(origin={-129.0,98.99999999999999}, extent={{-23.0,-23.0},{23.0,23.0}})));
    Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte2(width=8) annotation (Placement(transformation(origin={-129.0,35.0}, extent={{-23.0,-23.0},{23.0,23.0}})));
    Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte3(width=8) annotation (Placement(transformation(origin={-129.0,-25.0}, extent={{-23.0,-23.0},{23.0,23.0}})));
    Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte4(width=8) annotation (Placement(transformation(origin={-128.99999999999994,-87.00000000000003}, extent={{-23.0,-23.0},{23.0,23.0}})));
    Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.GetInteger getInteger(n=6) annotation (Placement(transformation(origin={-130.00000000000006,-152.0}, extent={{-22.0,-22.0},{22.0,22.0}})));
    Modelica.Blocks.Interfaces.IntegerOutput Command1 annotation (Placement(transformation(origin={-56.0,210.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90.0)));
    Modelica.Blocks.Interfaces.IntegerOutput Command2 annotation (Placement(transformation(origin={-16.0,210.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90.0)));
    Modelica.Blocks.Interfaces.IntegerOutput Command3 annotation (Placement(transformation(origin={26.0,210.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90.0)));
    Modelica.Blocks.Interfaces.IntegerOutput Command4 annotation (Placement(transformation(origin={70.0,210.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90.0)));
    Modelica.Blocks.Math.IntegerToReal integerToReal annotation (Placement(transformation(origin={132.0,150.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Math.IntegerToReal integerToReal1 annotation (Placement(transformation(origin={132.0,90.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Math.IntegerToReal integerToReal2 annotation (Placement(transformation(origin={132.0,28.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Math.IntegerToReal integerToReal3 annotation (Placement(transformation(origin={132.0,-34.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Math.IntegerToReal integerToReal4 annotation (Placement(transformation(origin={132.0,-104.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Math.IntegerToReal integerToReal5 annotation (Placement(transformation(origin={132.0,-164.0}, extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Interfaces.RealOutput data1 annotation (Placement(transformation(origin={210.0,150.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput data2 annotation (Placement(transformation(origin={206.0,94.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput data3 annotation (Placement(transformation(origin={210.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput data4 annotation (Placement(transformation(origin={210.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput data5 annotation (Placement(transformation(origin={210.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput data6 annotation (Placement(transformation(origin={210.0,-160.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  equation
    connect(uDPReceive.pkgOut, Byte1.pkgIn) annotation (Line(origin={-129.0,140.0}, points={{0.0,0.0},{0.0,-16.0}}));
    connect(Byte1.pkgOut[1], Byte2.pkgIn) annotation (Line(origin={-129.0,67.0}, points={{0.0,7.0},{0.0,-7.0}}));
    connect(Byte2.pkgOut[1], Byte3.pkgIn) annotation (Line(origin={-129.0,5.0}, points={{0.0,5.0},{0.0,-5.0}}));
    connect(Byte3.pkgOut[1], Byte4.pkgIn) annotation (Line(origin={-129.0,-56.0}, points={{0.0,6.0},{0.0,-6.0}}));
    connect(Byte4.pkgOut[1], getInteger.pkgIn) annotation (Line(origin={-129.0,-118.0}, points={{0.0,6.0},{0.0,-10.0},{-1.0,-10.0}}));
    connect(Byte1.y, Command1) annotation (Line(origin={-80.0,155.0}, points={{-24.0,-56.0},{24.0,-56.0},{24.0,55.0}}, color={255,127,0}));
    connect(Byte2.y, Command2) annotation (Line(origin={-60.0,123.0}, points={{-44.0,-88.0},{44.0,-88.0},{44.0,87.0}}, color={255,127,0}));
    connect(Byte3.y, Command3) annotation (Line(origin={-39.0,93.0}, points={{-65.0,-118.0},{65.0,-118.0},{65.0,117.0}}, color={255,127,0}));
    connect(Byte4.y, Command4) annotation (Line(origin={-17.0,62.0}, points={{-87.0,-149.0},{67.0,-149.0},{67.0,138.0},{87.0,138.0},{87.0,148.0}}, color={255,127,0}));
    connect(getInteger.y[6], integerToReal5.u) annotation (Line(origin={1.0,-158.0}, points={{-107.0,6.0},{107.0,6.0},{107.0,-6.0}}, color={255,127,0}));
    connect(getInteger.y[1], integerToReal.u) annotation (Line(origin={1.0,-1.0}, points={{-107.0,-151.0},{59.0,-151.0},{59.0,151.0},{107.0,151.0}}, color={255,127,0}));
    connect(getInteger.y[2], integerToReal1.u) annotation (Line(origin={1.0,-31.0}, points={{-107.0,-121.0},{59.0,-121.0},{59.0,121.0},{107.0,121.0}}, color={255,127,0}));
    connect(getInteger.y[3], integerToReal2.u) annotation (Line(origin={1.0,-62.0}, points={{-107.0,-90.0},{57.0,-90.0},{57.0,90.0},{107.0,90.0}}, color={255,127,0}));
    connect(getInteger.y[4], integerToReal3.u) annotation (Line(origin={1.0,-93.0}, points={{-107.0,-59.0},{57.0,-59.0},{57.0,59.0},{107.0,59.0}}, color={255,127,0}));
    connect(getInteger.y[5], integerToReal4.u) annotation (Line(origin={1.0,-128.0}, points={{-107.0,-24.0},{61.0,-24.0},{61.0,24.0},{107.0,24.0}}, color={255,127,0}));
    connect(integerToReal.y, data1) annotation (Line(origin={182.0,150.0}, points={{-28.0,0.0},{28.0,0.0}}, color={0,0,127}));
    connect(integerToReal1.y, data2) annotation (Line(origin={180.0,92.0}, points={{-26.0,-2.0},{26.0,-2.0},{26.0,2.0}}, color={0,0,127}));
    connect(integerToReal2.y, data3) annotation (Line(origin={182.0,29.0}, points={{-28.0,-1.0},{28.0,-1.0},{28.0,1.0}}, color={0,0,127}));
    connect(integerToReal3.y, data4) annotation (Line(origin={182.0,-32.0}, points={{-28.0,-2.0},{28.0,-2.0},{28.0,2.0}}, color={0,0,127}));
    connect(integerToReal4.y, data5) annotation (Line(origin={182.0,-102.0}, points={{-28.0,-2.0},{28.0,-2.0},{28.0,2.0}}, color={0,0,127}));
    connect(integerToReal5.y, data6) annotation (Line(origin={187.0,-162.0}, points={{-33.0,-2.0},{23.0,-2.0},{23.0,2.0}}, color={0,0,127}));
  end Receiver;

  model Sender
    annotation (Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, grid={2.0,2.0}), graphics={Bitmap(origin={0.0,0.0}, extent={{-200.0,-200.0},{200.0,200.0}}, fileName="modelica://MECS_Simulation/Resources/Images/sender.png")}));

  end Sender;
 end Communication;

 package Processing "process some signals"
   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
  model IK_solver_planar
    annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Rectangle(origin={-69.0,-3.0}, fillColor={255,255,255}, lineThickness=2.0, extent={{-13.0,67.0},{13.0,-67.0}}),Text(origin={-68.0,50.0}, extent={{-12.0,10.0},{12.0,-10.0}}, textString="X", textStyle={TextStyle.None}),Text(origin={-68.0,30.0}, extent={{-12.0,10.0},{12.0,-10.0}}, textString="Y", textStyle={TextStyle.None}),Text(origin={-69.0,5.0}, extent={{-13.0,9.0},{13.0,-9.0}}, textString="Z", textStyle={TextStyle.None}),Text(origin={-71.0,-11.0}, extent={{-15.0,9.0},{15.0,-9.0}}, textString="α", textStyle={TextStyle.None}),Text(origin={-69.0,-34.0}, extent={{-11.0,10.0},{11.0,-10.0}}, textString="ß", textStyle={TextStyle.None}),Text(origin={-68.0,-55.0}, extent={{-12.0,11.0},{12.0,-11.0}}, textString="γ", textStyle={TextStyle.None}),Text(origin={62.0,49.0}, extent={{-12.0,13.0},{12.0,-13.0}}, textString="q1", textStyle={TextStyle.None}),Text(origin={62.0,5.0}, extent={{-12.0,15.0},{12.0,-15.0}}, textString="q2", textStyle={TextStyle.None}),Text(origin={63.0,-44.0}, extent={{-13.0,14.0},{13.0,-14.0}}, textString="q3", textStyle={TextStyle.None}),Rectangle(origin={62.0,-3.0}, fillColor={255,255,255}, lineThickness=2.0, extent={{-14.0,67.0},{14.0,-67.0}}),Polygon(origin={-1.0,-6.0}, fillPattern=FillPattern.Solid, points={{-43.0,12.0},{-43.0,-12.0},{17.0,-12.0},{17.0,-34.0},{43.0,0.0},{17.0,34.0},{17.0,12.0}}),Rectangle(origin={-2.0,-4.0}, fillColor={255,255,255}, lineThickness=2.0, extent={{-90.0,74.0},{90.0,-74.0}}),Text(origin={1.8303030303030141,84.16969696969696}, extent={{-58.169696969696965,12.169696969696972},{58.169696969696986,-12.169696969696957}}, textString="%name", textStyle={TextStyle.None}),Line(origin={-68.00000000000001,29.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0),Line(origin={-70.00000000000001,-11.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0),Line(origin={-70.00000000000001,-33.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0)}));
    //  Imports

    // Parameters
    parameter Modelica.SIunits.Length H=1 "Height offset of Joint 1 " annotation (Dialog(group="Gemetry"));
    parameter Modelica.SIunits.Length L1=1 "Length of  Link 1 " annotation (Dialog(group="Gemetry"));
    parameter Modelica.SIunits.Length L2(displayUnit="m") = 1 "Length of  Link 2" annotation (Dialog(group="Gemetry"));
    final parameter Modelica.SIunits.Angle Rx=Modelica.Constants.pi/2 "rotation around x axis" annotation (Dialog(group="Tranformation"));

    Modelica.SIunits.Angle q1;
    Modelica.SIunits.Angle q2;
    Modelica.SIunits.Angle q3;

    Modelica.Blocks.Interfaces.RealInput Px "Position in x  axis w.r.t base frame" annotation (Placement(transformation(origin={-92.0,52.0}, extent={{-10.0,-10.0},{10.0,10.0}})));

    Modelica.Blocks.Interfaces.RealInput Pz "Position in z  axis w.r.t base frame" annotation (Placement(transformation(origin={-92.0,6.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealInput Rz "rotation around z axis, can vary" annotation (Placement(transformation(origin={-94.0,-58.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput Out_q1 "Joint 1 angle" annotation (Placement(transformation(origin={98.0,52.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput Out_q2 "Joint 2 angle" annotation (Placement(transformation(origin={98.0,8.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput Out_q3 "Joint 3 angle" annotation (Placement(transformation(origin={98.0,-44.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
  equation
    Px = L2*cos(q1 + q2) + L1*cos(q1);
    Pz = H + L2*sin(q1 + q2) + L1*sin(q1);
    Rz = q1 + q2 + q3;
    Out_q1 = rem(q1, 2*Modelica.Constants.pi);
    Out_q2 = rem(q2, 2*Modelica.Constants.pi);
    Out_q3 = rem(q3, 2*Modelica.Constants.pi);

  end IK_solver_planar;

  model FK_planar "Forward kinematic of a RRR-planar manipulator"

    // parameters
    parameter Modelica.SIunits.Length H=1 "Height offset of Joint 1 " annotation (Dialog(group="Gemetry"));
    parameter Modelica.SIunits.Length L1=1 "Length of  Link 1 " annotation (Dialog(group="Gemetry"));
    parameter Modelica.SIunits.Length L2(displayUnit="m") = 1 "Length of  Link 2" annotation (Dialog(group="Gemetry"));
    final parameter Modelica.SIunits.Angle Rx=Modelica.Constants.pi/2 "joint 1 orientation correction around x axis";

    Real T[4, 4];

    // connectors
    Modelica.Blocks.Interfaces.RealInput in_q1 "joint 1 angle input" annotation (Placement(transformation(origin={-94.0,48.00000000000001}, extent={{-14.0,-14.0},{14.0,14.0}})));
    Modelica.Blocks.Interfaces.RealInput in_q2 "joint 2 angle input" annotation (Placement(transformation(origin={-94.0,4.0}, extent={{-14.0,-14.0},{14.0,14.0}})));
    Modelica.Blocks.Interfaces.RealInput in_q3 "joint 3 angle input" annotation (Placement(transformation(origin={-94.00000000000001,-47.99999999999999}, extent={{-14.0,-14.0},{14.0,14.0}})));
    Modelica.Blocks.Interfaces.RealOutput Px "end effector coordinate in x axis " annotation (Placement(transformation(origin={106.0,54.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput Pz "end effector coordinate in z axis " annotation (Placement(transformation(origin={106.0,2.0}, extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealOutput gamma "total euler rotation around z  axis  ,XYZ" annotation (Placement(transformation(origin={106.0,-58.0}, extent={{-10.0,-10.0},{10.0,10.0}})));

    // function

    // equation
  equation
    T = calculatePose(in_q1, in_q2, in_q3, H, L1, L2, Rx);
    Px = T[1, 4];
    Pz = T[3, 4];
    gamma = in_q1 + in_q2 + in_q3;

    // graphics
    annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0}), graphics={Rectangle(origin={71.0,-3.0}, fillColor={255,255,255}, lineThickness=2.0, extent={{-13.0,67.0},{13.0,-67.0}}),Text(origin={72.0,50.0}, extent={{-12.0,10.0},{12.0,-10.0}}, textString="X", textStyle={TextStyle.None}),Text(origin={72.0,30.0}, extent={{-12.0,10.0},{12.0,-10.0}}, textString="Y", textStyle={TextStyle.None}),Text(origin={71.0,5.0}, extent={{-13.0,9.0},{13.0,-9.0}}, textString="Z", textStyle={TextStyle.None}),Text(origin={69.0,-11.0}, extent={{-15.0,9.0},{15.0,-9.0}}, textString="α", textStyle={TextStyle.None}),Text(origin={71.0,-34.0}, extent={{-11.0,10.0},{11.0,-10.0}}, textString="ß", textStyle={TextStyle.None}),Text(origin={72.0,-55.0}, extent={{-12.0,11.0},{12.0,-11.0}}, textString="γ", textStyle={TextStyle.None}),Text(origin={-64.0,49.0}, extent={{-12.0,13.0},{12.0,-13.0}}, textString="q1", textStyle={TextStyle.None}),Text(origin={-64.0,5.0}, extent={{-12.0,15.0},{12.0,-15.0}}, textString="q2", textStyle={TextStyle.None}),Text(origin={-63.0,-44.0}, extent={{-13.0,14.0},{13.0,-14.0}}, textString="q3", textStyle={TextStyle.None}),Rectangle(origin={-64.0,-3.0}, fillColor={255,255,255}, lineThickness=2.0, extent={{-14.0,67.0},{14.0,-67.0}}),Polygon(origin={7.0,4.0}, fillPattern=FillPattern.Solid, points={{-43.0,12.0},{-43.0,-12.0},{17.0,-12.0},{17.0,-34.0},{43.0,0.0},{17.0,34.0},{17.0,12.0}}),Rectangle(origin={2.0,-4.0}, fillColor={255,255,255}, lineThickness=2.0, extent={{-90.0,74.0},{90.0,-74.0}}),Text(origin={-2.169696969696986,88.16969696969696}, extent={{-58.169696969696965,12.169696969696972},{58.169696969696986,-12.169696969696957}}, textString="%name", textStyle={TextStyle.None}),Line(origin={72.0,29.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0),Line(origin={70.0,-11.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0),Line(origin={70.0,-33.0}, points={{-9.999999999999986,5.0},{10.000000000000014,-5.0}}, color={255,0,0}, thickness=3.0)}));
    public
   function calculatePose
     input Real q1;
     input Real q2;
     input Real q3;
     input Real H;
     input Real L1;
     input Real L2;
     input Real Ax;
     output Real Tbee[4, 4];
      protected
     Real Tb1[4, 4];
     Real T12[4, 4];
     Real T2ee[4, 4];
   algorithm
     // intial
     Tb1 := [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, H; 0, 0, 0, 1]*[1, 0, 0, 0; 0, cos(Ax), -sin(Ax), 0; 0, sin(Ax), cos(Ax), 0; 0, 0, 0, 1]*[cos(q1), -sin(q1), 0, 0; sin(q1), cos(q1), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
     T12 := [1, 0, 0, L1; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]*[cos(q2), -sin(q2), 0, 0; sin(q2), cos(q2), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
     T2ee := [1, 0, 0, L2; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]*[cos(q3), -sin(q3), 0, 0; sin(q3), cos(q3), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
     Tbee := Tb1*T12*T2ee;

   end calculatePose;
  end FK_planar;
 end Processing;
end Components;
