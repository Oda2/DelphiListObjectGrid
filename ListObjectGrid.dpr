program ListObjectGrid;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uPessoa in 'uPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
