within MECS_Simulation;
package DataRecords
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(origin={0,-1}, lineColor={64,64,64}, fillColor={255,215,136},
            fillPattern =                                                                                                                                                                    FillPattern.Solid, extent={{-100.0,-75.0},{100.0,75.0}}, radius=25.0),Line(points={{-100,24},{100,24}}, color={64,64,64}),Line(origin={0,-26}, points={{-100.0,0.0},{100.0,0.0}}, color={64,64,64}),Line(origin={0,-1}, points={{0.0,75.0},{0.0,-75.0}}, color={64,64,64})}), Documentation(info="<html>
<p>
Icon (partial package) indicating a collection of parameter records.
</p>
</html>"));
 record Data "some parameters for testing"
   extends Modelica.Icons.Record;
   annotation (Diagram(coordinateSystem(extent={{-140.0,-100.0},{140.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=false, grid={2.0,2.0})));
 end Data;
end DataRecords;
