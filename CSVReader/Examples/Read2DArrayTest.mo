within CSVReader.Examples;
model Read2DArrayTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.TimeTable timeTable(table=externCSV.getRealArray2D(3,
        2)) annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  inner ExternCSV externCSV(fileName=Modelica.Utilities.Files.loadResource(
        "modelica://ExternData/Resources/Examples/test.csv"))
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Read2DArrayTest;
