within CSVReader.Interfaces;
partial function getRealArray2D "Interface for getting 2D real array"
  extends Modelica.Icons.Function;
  input Integer m=1 "Number of rows";
  input Integer n=1 "Number of columns";
  input Integer field[2](each min=1) = {1,1} "Start field {row, col}";
  output Real y[m,n] "2D Real values";
end getRealArray2D;
