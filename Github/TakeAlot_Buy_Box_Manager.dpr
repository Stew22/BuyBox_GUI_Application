program TakeAlot_Buy_Box_Manager;

uses
  Vcl.Forms,
  frmMain_U in 'frmMain_U.pas' {frmmain},
  frmhelpprompt_U in 'frmhelpprompt_U.pas' {frmhelppeompt},
  frmReports_U in 'frmReports_U.pas' {FrmReports};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmhelppeompt, frmhelppeompt);
  Application.CreateForm(TFrmReports, FrmReports);
  Application.Run;
end.
