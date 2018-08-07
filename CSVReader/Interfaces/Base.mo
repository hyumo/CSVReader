within CSVReader.Interfaces;
partial record Base "Interface for reading external csv file"
  replaceable function getRealArray2D = CSVReader.Interfaces.getRealArray2D;
  replaceable function getArraySize2D = CSVReader.Interfaces.getArraySize2D;
  replaceable function getArrayRows2D = CSVReader.Interfaces.getArrayRows2D;
  replaceable function getArrayColumns2D =
      CSVReader.Interfaces.getArrayColumns2D;
  annotation (Documentation(info=
          "<html><p>Record that wraps the external object <a href=\"modelica://ExternData.Types.ExternCSVFile\">ExternCSVFile</a> and the <a href=\"modelica://ExternData.Functions.CSV\">CSV</a> read function for data access of <a href=\"https://en.wikipedia.org/wiki/Comma-separated_values\">CSV</a> files.</p><p>See <a href=\"modelica://ExternData.Examples.CSVTest\">Examples.CSVTest</a> for an example.</p></html>"),
      Icon(graphics={
        Line(points={{-40,90},{-90,40},{-90,-90},{90,-90},{90,90},{-40,90}}),
        Polygon(points={{-40,90},{-40,40},{-90,40},{-40,90}}, fillPattern=
              FillPattern.Solid),
        Text(
          lineColor={0,0,255},
          extent={{-85,-10},{85,-55}},
          textString=DynamicSelect("csv", if delimiter == " " then "c s v"
               elseif delimiter == "," then "c,s,v" elseif delimiter == "\t"
               then "c\\ts\\tv" elseif delimiter == ";" then "c;s;v" else "csv")),

        Text(
          lineColor={0,0,255},
          extent={{-150,150},{150,110}},
          textString="%name")}));

end Base;
