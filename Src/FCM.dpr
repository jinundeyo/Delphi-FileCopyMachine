program FCM;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {_FormMain},
  jw_filecopy in 'jw_filecopy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_FormMain, _FormMain);
  Application.Run;
end.
