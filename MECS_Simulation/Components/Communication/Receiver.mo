within MECS_Simulation.Components.Communication;
model Receiver
  annotation (Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, grid={2.0,2.0}), graphics={Bitmap(origin={0.0,0.0}, extent={{-200.0,-200.0},{200.0,200.0}}, fileName="modelica://MECS_Simulation/Resources/Images/receiver.png")}));
  Modelica_DeviceDrivers.Blocks.Communication.UDPReceive uDPReceive(port_recv=24545) annotation (Placement(transformation(origin={-129.0,167.0}, extent={{-25.0,-25.0},{25.0,25.0}}, rotation=270.0)));
  Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte1(width=8, nu=1) annotation (Placement(transformation(origin={-129.0,98.99999999999999}, extent={{-23.0,-23.0},{23.0,23.0}})));
  Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte2(width=8, nu=1) annotation (Placement(transformation(origin={-129.0,35.0}, extent={{-23.0,-23.0},{23.0,23.0}})));
  Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte3(width=8, nu=1) annotation (Placement(transformation(origin={-129.0,-25.0}, extent={{-23.0,-23.0},{23.0,23.0}})));
  Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.UnpackUnsignedInteger Byte4(width=8, nu=1) annotation (Placement(transformation(origin={-128.99999999999994,-87.00000000000003}, extent={{-23.0,-23.0},{23.0,23.0}})));
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
  connect(uDPReceive.pkgOut, Byte1.pkgIn) annotation (Line(origin={-129.0,140.0}, points={{0,0},{0,-16.16}}));
  connect(Byte1.y, Command1) annotation (Line(origin={-80.0,155.0}, points={{-23.7,-56},{24,-56},{24,55}}, color={255,127,0}));
  connect(Byte2.y, Command2) annotation (Line(origin={-60.0,123.0}, points={{-43.7,-88},{44,-88},{44,87}}, color={255,127,0}));
  connect(Byte3.y, Command3) annotation (Line(origin={-39.0,93.0}, points={{-64.7,-118},{65,-118},{65,117}}, color={255,127,0}));
  connect(Byte4.y, Command4) annotation (Line(origin={-17.0,62.0}, points={{-86.7,-149},{67,-149},{67,138},{87,138},{87,148}}, color={255,127,0}));
  connect(getInteger.y[6], integerToReal5.u) annotation (Line(origin={1.0,-158.0}, points={{-106.8,7.83333},{107,7.83333},{107,-6}}, color={255,127,0}));
  connect(getInteger.y[1], integerToReal.u) annotation (Line(origin={1.0,-1.0}, points={{-106.8,-152.833},{59,-152.833},{59,151},{107,151}}, color={255,127,0}));
  connect(getInteger.y[2], integerToReal1.u) annotation (Line(origin={1.0,-31.0}, points={{-106.8,-122.1},{59,-122.1},{59,121},{107,121}}, color={255,127,0}));
  connect(getInteger.y[3], integerToReal2.u) annotation (Line(origin={1.0,-62.0}, points={{-106.8,-90.3667},{57,-90.3667},{57,90},{107,90}}, color={255,127,0}));
  connect(getInteger.y[4], integerToReal3.u) annotation (Line(origin={1.0,-93.0}, points={{-106.8,-58.6333},{57,-58.6333},{57,59},{107,59}}, color={255,127,0}));
  connect(getInteger.y[5], integerToReal4.u) annotation (Line(origin={1.0,-128.0}, points={{-106.8,-22.9},{61,-22.9},{61,24},{107,24}}, color={255,127,0}));
  connect(integerToReal.y, data1) annotation (Line(origin={182.0,150.0}, points={{-28.0,0.0},{28.0,0.0}}, color={0,0,127}));
  connect(integerToReal1.y, data2) annotation (Line(origin={180.0,92.0}, points={{-26.0,-2.0},{26.0,-2.0},{26.0,2.0}}, color={0,0,127}));
  connect(integerToReal2.y, data3) annotation (Line(origin={182.0,29.0}, points={{-28.0,-1.0},{28.0,-1.0},{28.0,1.0}}, color={0,0,127}));
  connect(integerToReal3.y, data4) annotation (Line(origin={182.0,-32.0}, points={{-28.0,-2.0},{28.0,-2.0},{28.0,2.0}}, color={0,0,127}));
  connect(integerToReal4.y, data5) annotation (Line(origin={182.0,-102.0}, points={{-28.0,-2.0},{28.0,-2.0},{28.0,2.0}}, color={0,0,127}));
  connect(integerToReal5.y, data6) annotation (Line(origin={187.0,-162.0}, points={{-33.0,-2.0},{23.0,-2.0},{23.0,2.0}}, color={0,0,127}));
  connect(Byte1.pkgOut[1], Byte2.pkgIn)
    annotation (Line(points={{-129,74.16},{-129,59.84}}, color={0,0,0}));
  connect(Byte2.pkgOut[1], Byte3.pkgIn)
    annotation (Line(points={{-129,10.16},{-129,-0.16}}, color={0,0,0}));
  connect(Byte3.pkgOut[1], Byte4.pkgIn)
    annotation (Line(points={{-129,-49.84},{-129,-62.16}}, color={0,0,0}));
  connect(Byte4.pkgOut[1], getInteger.pkgIn) annotation (Line(points={{-129,-111.84},{-129,-128.24},{-130,-128.24}}, color={0,0,0}));
end Receiver;
