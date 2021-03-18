within MECS_Simulation.Components.Utilities;
model PostionToPath
  extends Modelica.Blocks.Icons.Block;
  Modelica.Blocks.Interfaces.RealInput pos_deg annotation (Placement(transformation(extent={{-120,-18},{-80,22}}), iconTransformation(extent={{-120,-18},{-80,22}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg
    annotation (Placement(transformation(extent={{-68,-8},{-48,12}})));
  Modelica.Blocks.Routing.RealPassThrough realPassThrough
    annotation (Placement(transformation(extent={{-24,66},{-4,86}})));
  Modelica.Blocks.Continuous.Derivative derivative
    annotation (Placement(transformation(extent={{-24,18},{-4,38}})));
  Modelica.Blocks.Interfaces.RealOutput q annotation (Placement(transformation(extent={{98,66},{118,86}}), iconTransformation(extent={{98,66},{118,86}})));
  Modelica.Blocks.Routing.RealPassThrough realPassThrough1
    annotation (Placement(transformation(extent={{12,66},{32,86}})));
  Modelica.Blocks.Routing.RealPassThrough realPassThrough2
    annotation (Placement(transformation(extent={{12,18},{32,38}})));
  Modelica.Blocks.Continuous.Derivative derivative1
    annotation (Placement(transformation(extent={{-26,-26},{-6,-6}})));
  Modelica.Blocks.Continuous.Derivative derivative2
    annotation (Placement(transformation(extent={{12,-26},{32,-6}})));
  Modelica.Blocks.Routing.BooleanPassThrough booleanPassThrough
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
    annotation (Placement(transformation(extent={{-24,-70},{-4,-50}})));
  Modelica.Blocks.Interfaces.RealOutput dq annotation (Placement(transformation(extent={{98,18},{118,38}}), iconTransformation(extent={{98,18},{118,38}})));
  Modelica.Blocks.Interfaces.RealOutput ddq annotation (Placement(transformation(extent={{98,-26},{118,-6}}), iconTransformation(extent={{98,-26},{118,-6}})));
  Modelica.Blocks.Interfaces.BooleanOutput moving annotation (Placement(transformation(extent={{96,-70},{116,-50}}), iconTransformation(extent={{96,-70},{116,-50}})));
equation
  connect(from_deg.u, pos_deg) annotation (Line(points={{-70,2},{-86,2},{-86,2},{-100,2}}, color={0,0,127}));
  connect(realPassThrough1.u, realPassThrough.y) annotation (Line(points={{10,76},{8.5,76},{8.5,76},{-3,76}}, color={0,0,127}));
  connect(realPassThrough2.u, derivative.y)
    annotation (Line(points={{10,28},{10,28},{-3,28}}, color={0,0,127}));
  connect(from_deg.y, realPassThrough.u) annotation (Line(points={{-47,2},{-44,2},{-44,76},{-26,76}}, color={0,0,127}));
  connect(realPassThrough1.y, q) annotation (Line(points={{33,76},{79.5,76},{79.5,76},{108,76}}, color={0,0,127}));
  connect(derivative.u, from_deg.y) annotation (Line(points={{-26,28},{-44,28},{-44,2},{-47,2}}, color={0,0,127}));
  connect(booleanPassThrough.u, booleanConstant.y)
    annotation (Line(points={{8,-60},{-3,-60}}, color={255,0,255}));
  connect(derivative2.u, derivative1.y) annotation (Line(points={{10,-16},{-0.5,-16},{-0.5,-16},{-5,-16}}, color={0,0,127}));
  connect(derivative1.u, from_deg.y) annotation (Line(points={{-28,-16},{-44,-16},{-44,2},{-47,2}}, color={0,0,127}));
  connect(moving, booleanPassThrough.y) annotation (Line(points={{106,-60},{106,-60},{31,-60}}, color={255,0,255}));
  connect(ddq, derivative2.y)
    annotation (Line(points={{108,-16},{108,-16},{33,-16}}, color={0,0,127}));
  connect(dq, realPassThrough2.y) annotation (Line(points={{108,28},{45.5,28},{45.5,28},{33,28}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false)));
end PostionToPath;
