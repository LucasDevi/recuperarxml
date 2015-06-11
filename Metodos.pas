unit Metodos;

interface

uses
   Windows, Buttons, Classes, Graphics, Controls, Grids, SysUtils, Forms, StdCtrls,
   Dialogs, DBCtrls, ExtCtrls, ComCtrls, DB, DBTables, Registry, ComObj, ActiveX,
   WinInet, System.Variants,
   Soap.EncdDecd, PngImage,
   (* ACBr *) pcnAuxiliar, ACBrUtil;


{ Variáveis do sistema }
function GetTempDir: String;

{ HTML e Intenet }
function StripHTML(S: string): string;
procedure ConverteBase64(Source, dest: AnsiString);
function PngFromBase64(const base64: AnsiString): TPngImage;
function StripLinkBase64(S: AnsiString): AnsiString;

{ Funções diversas }
function TemConexaoInternet(Endereco: PWideChar): Boolean;
function RetornaCPFOuCNPJ(ACPF, ACNPJ : string) : string;
function RemoveInvalidChar(ADataHora : string) : string;
function SeparaAte(Chave, Texto : AnsiString; var Resto: AnsiString): String;
function LerCampo(Texto, NomeCampo: string; Tamanho : Integer = 0): string;
function ConverteStrToNumero( Valor : String; TrocaPonto : Boolean = False ) : Real;
function FindText(Componente: TMemo; const aPatternToFind: String): Boolean;

var Reg: TRegistry;

implementation


{ Variáveis do sistema }

function GetTempDir: String;
var
  dir: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @dir);
  result := PathWithDelim(StrPas(dir));
end;


{ HTML e Intenet }

function TemConexaoInternet(Endereco: PWideChar): Boolean;
begin
   Result := InternetCheckConnection(Endereco, 1, 0);
end;

function StripHTML(S: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := Pos( '<', S);

  while (TagBegin > 0) do
  begin
    TagEnd    := Pos('>', S);
    TagLength := TagEnd - TagBegin + 1;
    Delete(S, TagBegin, TagLength);
    TagBegin := Pos( '<', S);
  end;

  Result := S;
end;

function PngFromBase64(const base64: AnsiString): TPngImage;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TPngImage.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure ConverteBase64(Source, dest: AnsiString);
var png: TPNGImage;
begin
  png := TPNGImage.Create;
  png := PngFromBase64(Source);
  png.SaveToFile(dest);
  png.Free;
end;

function StripLinkBase64(S: AnsiString): AnsiString;
var
  TagBegin,
  TagEnd: Integer;
begin
  S := copy(S, TagBegin, 10000);
  TagBegin := 7;
  TagEnd := Pos('>', S);
  Delete(S, TagEnd, 10000);
  Result := S;
end;


{ Funções diversas }

function RetornaCPFOuCNPJ(ACPF, ACNPJ : string) : string;
begin
  Result := Trim(ACNPJ);

  if Result = '' then Result := ACPF;
end;

function RemoveInvalidChar(ADataHora : string) : string;
var
  Caracteres : TSysCharSet;
  I : Integer;
begin
  Caracteres:= ['/', ':', '0'..'9'];

  for I := 0 to Length(ADataHora) do
    begin
      if CharInSet(ADataHora[I], Caracteres) then
        Result := Result + ADataHora[I];
    end;

  Insert(' ', Result, 11);
end;

function SeparaAte(Chave, Texto : AnsiString; var Resto: AnsiString): String;
var
  inicio : integer;
begin
   Chave  := UpperCase(Trim(Chave));
   inicio := pos(Chave, UpperCase(Texto));

   if inicio = 0 then
     result := ''
   else
    begin
       Resto  := copy(Texto,inicio,length(Texto));
       Result := copy(Texto,0,inicio-1);
    end;
end;

function LerCampo(Texto, NomeCampo: string; Tamanho : Integer = 0): string;
var
  ConteudoTag: string;
  inicio, fim: integer;
begin
  NomeCampo := UpperCase(Trim(NomeCampo));
  inicio := pos(NomeCampo, UpperCase(Texto));

  if inicio = 0 then
    ConteudoTag := ''
  else
  begin
    inicio := inicio + Length(NomeCampo);
    if Tamanho > 0 then
       fim := Tamanho
    else
     begin
       Texto := copy(Texto,inicio,length(Texto));
       inicio := 0;
       fim := pos('|&|',Texto)-1;
     end;
    ConteudoTag := trim(copy(Texto, inicio, fim));
  end;
  try
     result := ConteudoTag;
  except
     raise Exception.Create('Conteúdo inválido. '+ConteudoTag);
  end;
end;

function ConverteStrToNumero( Valor : String; TrocaPonto : Boolean = False ) : Real;
begin
  if TrocaPonto then
     Result := StrToFloatDef(StringReplace(Valor,FormatSettings.ThousandSeparator,',',[rfReplaceAll]),0)
  else
     Result := StrToFloatDef(StringReplace(Valor,FormatSettings.ThousandSeparator,'',[rfReplaceAll]),0);
end;

function FindText(Componente: TMemo; const aPatternToFind: String): Boolean;
begin
  Result := (pos(aPatternToFind, Componente.Text) > 0);
end;

end.
