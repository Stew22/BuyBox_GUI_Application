program TakeAlot_Buy_Box_Manager;

uses
  Vcl.Forms,
  frmUser_U in 'frmUser_U.pas' {frmselectuser},
  frmMain_U in 'frmMain_U.pas' {frmmain},
  frmhelpprompt_U in 'frmhelpprompt_U.pas' {frmhelppeompt},
  frmReports_U in 'frmReports_U.pas' {FrmReports},
  frm_Python_Input_U in 'frm_Python_Input_U.pas' {frmpyinput},
  frmSettings_U in 'frmSettings_U.pas' {frmsettings},
  frm_Python_Get_Offers_U in 'frm_Python_Get_Offers_U.pas' {frmgetofferspython},
  ProgressFormUnit_U in 'ProgressFormUnit_U.pas' {frmProgress},
  superobject in 'F:\Coding\SuperObject.Delphi-master\Lib\superobject.pas',
  supertypes in 'F:\Coding\SuperObject.Delphi-master\Lib\supertypes.pas',
  superdate in 'F:\Coding\SuperObject.Delphi-master\Lib\superdate.pas',
  superdbg in 'F:\Coding\SuperObject.Delphi-master\Lib\superdbg.pas',
  supertimezone in 'F:\Coding\SuperObject.Delphi-master\Lib\supertimezone.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmselectuser, frmselectuser);
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmhelppeompt, frmhelppeompt);
  Application.CreateForm(TFrmReports, FrmReports);
  Application.CreateForm(Tfrmpyinput, frmpyinput);
  Application.CreateForm(Tfrmsettings, frmsettings);
  Application.CreateForm(Tfrmgetofferspython, frmgetofferspython);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
