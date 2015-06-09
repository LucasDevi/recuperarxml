program Demo_XMLNFe;

uses
  Vcl.Forms,
  Metodos in 'Metodos.pas',
  HTMLtoXML in 'HTMLtoXML.pas',
  fGERARXML in 'fGERARXML.pas' {FfGERARXML};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFfGERARXML, FfGERARXML);
  Application.Run;
end.
