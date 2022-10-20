program logicaControla;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  logica2 in 'logica2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
