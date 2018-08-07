within CSVReader;
record ExternCSV

  parameter String fileName="" "File where external data is stored" annotation
    (Dialog(loadSelector(filter=
            "Comma-separated values files (*.csv);;Text files (*.txt)", caption
          ="Open file")));
  parameter String delimiter="," "Column delimiter character" annotation (
      choices(
      choice=" " "Blank",
      choice="," "Comma",
      choice="\t" "Horizontal tabulator",
      choice=";" "Semicolon"));
  parameter String quotation="\"" "Quotation character" annotation (choices(
        choice="\"" "Double quotation mark", choice="'" "Single quotation mark"));
  parameter Boolean verboseRead=true
    "= true, if info message that file is loading is to be printed";

  final parameter ExternData.Types.ExternCSVFile csv=
      ExternData.Types.ExternCSVFile(
      fileName,
      delimiter,
      quotation,
      verboseRead) "External INI file object";
  extends CSVReader.Interfaces.Base(
    redeclare final function getRealArray2D = _getRealArray2D (csv=csv),
    redeclare final function getArraySize2D = _getArraySize2D (csv=csv),
    redeclare final function getArrayRows2D = _getArrayRows2D (csv=csv),
    redeclare final function getArrayColumns2D = _getArrayColumns2D (csv=csv));
protected
  function _getRealArray2D
    extends CSVReader.Interfaces.getRealArray2D;
    input ExternData.Types.ExternCSVFile csv "External CSV file object";
  external"C" ED_getDoubleArray2DFromCSV(
        csv,
        field,
        y,
        size(y, 1),
        size(y, 2)) annotation (
      __iti_dll="ITI_ED_CSVFile.dll",
      __iti_dllNoExport=true,
      Include="#include \"ED_CSVFile.h\"",
      Library={"ED_CSVFile","bsxml-json"},
      IncludeDirectory="modelica://ExternData/Resources/Include",
      LibraryDirectory="modelica://ExternData/Resources/Library");
  end _getRealArray2D;

  function _getArraySize2D
    extends CSVReader.Interfaces.getArraySize2D;
    input ExternData.Types.ExternCSVFile csv "External CSV file object";
  external"C" ED_getArray2DDimensionsFromCSV(
        csv,
        m,
        n) annotation (
      __iti_dll="ITI_ED_CSVFile.dll",
      __iti_dllNoExport=true,
      Include="#include \"ED_CSVFile.h\"",
      Library={"ED_CSVFile","bsxml-json"},
      IncludeDirectory="modelica://ExternData/Resources/Include",
      LibraryDirectory="modelica://ExternData/Resources/Library");
  end _getArraySize2D;

  function _getArrayRows2D
    extends CSVReader.Interfaces.getArrayRows2D;
    input ExternData.Types.ExternCSVFile csv "External CSV file object";
  protected
    Integer n[1] "Number of columns in array";
  external"C" ED_getArray2DDimensionsFromCSV(
        csv,
        m,
        n) annotation (
      __iti_dll="ITI_ED_CSVFile.dll",
      __iti_dllNoExport=true,
      Include="#include \"ED_CSVFile.h\"",
      Library={"ED_CSVFile","bsxml-json"},
      IncludeDirectory="modelica://ExternData/Resources/Include",
      LibraryDirectory="modelica://ExternData/Resources/Library");
  end _getArrayRows2D;

  function _getArrayColumns2D
    extends CSVReader.Interfaces.getArrayColumns2D;
    input ExternData.Types.ExternCSVFile csv "External CSV file object";
  protected
    Integer m[1] "Number of rows in array";
  external"C" ED_getArray2DDimensionsFromCSV(
        csv,
        m,
        n) annotation (
      __iti_dll="ITI_ED_CSVFile.dll",
      __iti_dllNoExport=true,
      Include="#include \"ED_CSVFile.h\"",
      Library={"ED_CSVFile","bsxml-json"},
      IncludeDirectory="modelica://ExternData/Resources/Include",
      LibraryDirectory="modelica://ExternData/Resources/Library");
  end _getArrayColumns2D;
  annotation (
    defaultComponentName="externCSV",
    defaultComponentPrefixes="inner",
    missingInnerMessage=
        "No \"externCSV\" component is defined, please drag ExternData.CSVFile to the model top level",

    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>ExternCSV reader. </p>
</html>"));

end ExternCSV;
