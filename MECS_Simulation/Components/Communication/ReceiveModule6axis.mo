within MECS_Simulation.Components.Communication;
model ReceiveModule6axis
  extends Modelica.Blocks.Icons.Block;
  Receiver receiver
    annotation (Placement(transformation(extent={{-90,-64},{-50,-24}})));
  Utilities.PostionToPath postionToPath1
    annotation (Placement(transformation(extent={{-28,74},{-8,94}})));
  Utilities.PostionToPath postionToPath2
    annotation (Placement(transformation(extent={{-28,44},{-8,64}})));
  Utilities.PostionToPath postionToPath3
    annotation (Placement(transformation(extent={{-28,18},{-8,38}})));
  Utilities.PostionToPath postionToPath4
    annotation (Placement(transformation(extent={{-26,-14},{-6.0001,6}})));
  Utilities.PostionToPath postionToPath5
    annotation (Placement(transformation(extent={{-26,-54},{-6,-34}})));
  Utilities.PostionToPath postionToPath6
    annotation (Placement(transformation(extent={{-26,-90},{-6,-70}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.ControlBus controlBus annotation (Placement(transformation(extent={{66,-18},{112,28}}), iconTransformation(extent={{66,-18},{112,28}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis1(nAxis=1)
    annotation (Placement(transformation(extent={{14,74},{34,94}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis2(nAxis=1)
    annotation (Placement(transformation(extent={{14,44},{34,64}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis3(nAxis=1)
    annotation (Placement(transformation(extent={{18,18},{38,38}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis4(nAxis=1)
    annotation (Placement(transformation(extent={{22,-12},{42,8}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis5(nAxis=1)
    annotation (Placement(transformation(extent={{22,-54},{42,-34}})));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathToAxisControlBus pathToAxis6(nAxis=1)
    annotation (Placement(transformation(extent={{24,-90},{44,-70}})));
equation
  connect(postionToPath1.pos_deg, receiver.data1) annotation (Line(points={{-28,84.2},{-49,84.2},{-49,-29}}, color={0,0,127}));
  connect(postionToPath2.pos_deg, receiver.data2) annotation (Line(points={{-28,54.2},{-38,54.2},{-38,54},{-42,54},{-42,-34.6},{-49.4,-34.6}}, color={0,0,127}));
  connect(postionToPath3.pos_deg, receiver.data3) annotation (Line(points={{-28,28.2},{-38,28.2},{-38,-41},{-49,-41}}, color={0,0,127}));
  connect(postionToPath4.pos_deg, receiver.data4) annotation (Line(points={{-26,-3.8},{-34,-3.8},{-34,-47},{-49,-47}}, color={0,0,127}));
  connect(postionToPath5.pos_deg, receiver.data5) annotation (Line(points={{-26,-43.8},{-32,-43.8},{-32,-54},{-49,-54}}, color={0,0,127}));
  connect(postionToPath6.pos_deg, receiver.data6) annotation (Line(points={{-26,-79.8},{-49,-79.8},{-49,-60}}, color={0,0,127}));
  connect(postionToPath1.q, pathToAxis1.q[1])
    annotation (Line(points={{-7.2,91.6},{12,91.6},{12,92}}, color={0,0,127}));
  connect(postionToPath1.dq, pathToAxis1.qd[1])
    annotation (Line(points={{-7.2,86.8},{12,86.8},{12,87}}, color={0,0,127}));
  connect(postionToPath1.ddq, pathToAxis1.qdd[1]) annotation (Line(points={{-7.2,82.4},{10,82.4},{10,81},{12,81}}, color={0,0,127}));
  connect(postionToPath1.moving, pathToAxis1.moving[1])
    annotation (Line(points={{-7.4,78},{12,78},{12,76}}, color={255,0,255}));
  connect(postionToPath2.q, pathToAxis2.q[1])
    annotation (Line(points={{-7.2,61.6},{12,61.6},{12,62}}, color={0,0,127}));
  connect(postionToPath2.dq, pathToAxis2.qd[1])
    annotation (Line(points={{-7.2,56.8},{12,56.8},{12,57}}, color={0,0,127}));
  connect(postionToPath2.ddq, pathToAxis2.qdd[1])
    annotation (Line(points={{-7.2,52.4},{12,52.4},{12,51}}, color={0,0,127}));
  connect(postionToPath2.moving, pathToAxis2.moving[1])
    annotation (Line(points={{-7.4,48},{12,48},{12,46}}, color={255,0,255}));
  connect(postionToPath3.q, pathToAxis3.q[1])
    annotation (Line(points={{-7.2,35.6},{16,35.6},{16,36}}, color={0,0,127}));
  connect(postionToPath3.dq, pathToAxis3.qd[1])
    annotation (Line(points={{-7.2,30.8},{16,30.8},{16,31}}, color={0,0,127}));
  connect(postionToPath3.ddq, pathToAxis3.qdd[1])
    annotation (Line(points={{-7.2,26.4},{16,26.4},{16,25}}, color={0,0,127}));
  connect(postionToPath3.moving, pathToAxis3.moving[1])
    annotation (Line(points={{-7.4,22},{16,22},{16,20}}, color={255,0,255}));
  connect(postionToPath4.q, pathToAxis4.q[1])
    annotation (Line(points={{-5.2001,3.6},{20,3.6},{20,6}}, color={0,0,127}));
  connect(postionToPath4.dq, pathToAxis4.qd[1]) annotation (Line(points={{-5.2001,-1.2},{20,-1.2},{20,1}}, color={0,0,127}));
  connect(postionToPath4.ddq, pathToAxis4.qdd[1]) annotation (Line(points={{-5.2001,-5.6},{20,-5.6},{20,-5}}, color={0,0,127}));
  connect(postionToPath4.moving, pathToAxis4.moving[1])
    annotation (Line(points={{-5.4001,-10},{20,-10}}, color={255,0,255}));
  connect(postionToPath5.q, pathToAxis5.q[1]) annotation (Line(points={{-5.2,-36.4},{20,-36.4},{20,-36}}, color={0,0,127}));
  connect(postionToPath5.dq, pathToAxis5.qd[1]) annotation (Line(points={{-5.2,-41.2},{20,-41.2},{20,-41}}, color={0,0,127}));
  connect(postionToPath5.ddq, pathToAxis5.qdd[1]) annotation (Line(points={{-5.2,-45.6},{20,-45.6},{20,-47}}, color={0,0,127}));
  connect(postionToPath5.moving, pathToAxis5.moving[1]) annotation (Line(points={{-5.4,-50},{20,-50},{20,-52}}, color={255,0,255}));
  connect(postionToPath6.q, pathToAxis6.q[1]) annotation (Line(points={{-5.2,-72.4},{22,-72.4},{22,-72}}, color={0,0,127}));
  connect(postionToPath6.dq, pathToAxis6.qd[1]) annotation (Line(points={{-5.2,-77.2},{22,-77.2},{22,-77}}, color={0,0,127}));
  connect(postionToPath6.ddq, pathToAxis6.qdd[1]) annotation (Line(points={{-5.2,-81.6},{22,-81.6},{22,-83}}, color={0,0,127}));
  connect(postionToPath6.moving, pathToAxis6.moving[1]) annotation (Line(points={{-5.4,-86},{22,-86},{22,-88}}, color={255,0,255}));
  connect(pathToAxis1.axisControlBus, controlBus.axisControlBus1) annotation (Line(points={{34,84},{89.115,84},{89.115,5.115}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,3}}));
  connect(pathToAxis2.axisControlBus, controlBus.axisControlBus2) annotation (Line(points={{34,54},{89.115,54},{89.115,5.115}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,3}}));
  connect(pathToAxis3.axisControlBus, controlBus.axisControlBus3) annotation (Line(points={{38,28},{89.115,28},{89.115,5.115}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,3}}));
  connect(pathToAxis4.axisControlBus, controlBus.axisControlBus4) annotation (Line(points={{42,-2},{89.115,-2},{89.115,5.115}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,3}}));
  connect(pathToAxis5.axisControlBus, controlBus.axisControlBus5) annotation (Line(points={{42,-44},{89.115,-44},{89.115,5.115}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,3}}));
  connect(pathToAxis6.axisControlBus, controlBus.axisControlBus6) annotation (Line(points={{44,-80},{89.115,-80},{89.115,5.115}}, color={255,204,51}, thickness=0.5), Text(string="%second", index=1, extent={{6,3},{6,3}}));
end ReceiveModule6axis;
