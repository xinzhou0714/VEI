within MECS_Simulation.Components.Processing;
model IK_solver_iterative

  // Parameters
  parameter Modelica.SIunits.Length H(displayUnit="mm") = 1 "Height offset of Joint 1 "
    annotation (Dialog(group="Gemetry"));
  parameter Modelica.SIunits.Length L1(displayUnit="mm") = 1 "Length of  Link 1 "
    annotation (Dialog(group="Gemetry"));
  parameter Modelica.SIunits.Length L2(displayUnit="mm") = 1 "Length of  Link 2"
    annotation (Dialog(group="Gemetry"));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-116,36},{-88,64}}), iconTransformation(extent={{-116,36},{-88,64}})));
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(extent={{-116,-18},{-86,12}}), iconTransformation(extent={{-116,-18},{-86,12}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(extent={{-116,-68},{-88,-40}}), iconTransformation(extent={{-116,-68},{-88,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{86,48},{106,68}}), iconTransformation(extent={{86,48},{106,68}})));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation (Placement(transformation(extent={{86,-8},{106,12}}), iconTransformation(extent={{86,-8},{106,12}})));
  Modelica.Blocks.Interfaces.RealOutput y2 annotation (Placement(transformation(extent={{86,-66},{106,-46}}), iconTransformation(extent={{86,-66},{106,-46}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(textString
            =                                                                                                                                   "%name", extent={{-38,98},{42,70}}, lineColor={0,0,0}),Text(textString
            =                                                                                                                                                                                                        "3DOF-Planar", extent={{-38,-68},{42,-88}}, lineColor={0,0,0}),Bitmap(extent={{-92,-94},{82,46}}, fileName="modelica://MECS_Simulation/Resources/Images/Schema-3DOF1.png"),Text(textString
            =                                                                                                                                                                                                        "(X,Z,gamma)", extent={{60,76},{92,38}}, lineColor={0,0,255}),Text(textString
            =                                                                                                                                                                                                        "q1", extent={{-42,-30},{-28,-46}}, lineColor={0,0,255}),Text(textString
            =                                                                                                                                                                                                        "q2", extent={{-6,-30},{7.99999,-46}}, lineColor={0,0,255}),Text(textString
            =                                                                                                                                                                                                        "q3", extent={{50,-30},{64,-46}}, lineColor={0,0,255}),Line(points={{78,48},{62,-10},{62,-10}}, color={95,95,95}, pattern=LinePattern.Solid, thickness=0.5, arrow={Arrow.None,Arrow.None}),Rectangle(extent={{-96,94},{96,-94}}, lineColor={0,0,0}, fillColor={255,255,255}, pattern=LinePattern.Solid,
            fillPattern =                                                                                                                                                                                                        FillPattern.None,
            lineThickness =                                                                                                                                                                                                        1,
            borderPattern =                                                                                                                                                                                                        BorderPattern.None, radius=0)}));

 function calculateIK
 algorithm
 end calculateIK;
end IK_solver_iterative;
