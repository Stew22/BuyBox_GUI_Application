unit frmReports_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmReports = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    clndrpckrFrom: TCalendarPicker;
    clndrpckrTo: TCalendarPicker;
    pnl2: TPanel;
    lbl4: TLabel;
    il1: TImageList;
    btnYTD: TButton;
    btnToday: TButton;
    btnmonth: TButton;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    btnupdate: TButton;
    btnexport: TButton;
    dlgSave1: TSaveDialog;
    procedure FormActivate(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure btnYTDClick(Sender: TObject);
    procedure btnTodayClick(Sender: TObject);
    procedure btnmonthClick(Sender: TObject);
    procedure btnexportClick(Sender: TObject);
    procedure btnupdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReports: TFrmReports;

implementation

{$R *.dfm}

function MyMessageDlg(CONST Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
  Caption: ARRAY OF string; dlgcaption: string): Integer;
var
  aMsgdlg: TForm;
  i: Integer;
  Dlgbutton: Tbutton;
  Captionindex: Integer;
begin
  aMsgdlg := createMessageDialog(Msg, DlgTypt, button);
  aMsgdlg.Caption := dlgcaption;
  //aMsgdlg.BiDiMode := bdRightToLeft;
  Captionindex := 0;
  for i := 0 to aMsgdlg.componentcount - 1 Do
  begin
    if (aMsgdlg.components[i] is Tbutton) then
    Begin
      Dlgbutton := Tbutton(aMsgdlg.components[i]);
      if Captionindex <= High(Caption) then
        Dlgbutton.Caption := Caption[Captionindex];
      inc(Captionindex);
    end;
  end;
  Result := aMsgdlg.Showmodal;
end;

procedure TFrmReports.btnexportClick(Sender: TObject);
begin
 if dlgSave1.Execute() then
 begin
  //select where you would like to save the file
 end else
 begin
  ShowMessage('Save File Operation Has Been Cancelled !');
 end;
end;

procedure TFrmReports.btnmonthClick(Sender: TObject);
begin
 if MyMessageDlg('Please Select A File Type',TMsgDlgType.mtCustom, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],['PDF' , 'Text File'],'File Type') = mrYes  then
 begin
   // if the user selects the pdf option
   // get the current month
   // then get the start of the current month
   // then extract the values that fall between these days
   //how are we going to store them ? database ?

 end else
 begin
  //if the user selects the textfile option
 end;
end;

procedure TFrmReports.btnTodayClick(Sender: TObject);
begin
 if MyMessageDlg('Please Select A File Type',TMsgDlgType.mtCustom, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],['PDF' , 'Text File'],'File Type') = mrYes  then
 begin
   // if the user selects the pdf option
 end else
 begin
  //if the user selects the textfile option
 end;
end;

procedure TFrmReports.btnupdateClick(Sender: TObject);
begin
 //if there was a sucessfull update then we can enable the ability to export
 //
end;

procedure TFrmReports.btnYTDClick(Sender: TObject);
begin
 if MyMessageDlg('Please Select A File Type',TMsgDlgType.mtCustom, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],['PDF' , 'Text File'],'File Type') = mrYes  then
 begin
   // if the user selects the pdf option
 end else
 begin
  //if the user selects the textfile option
 end;
end;

procedure TFrmReports.FormActivate(Sender: TObject);
begin
 // set the format of the date picker
 //
 clndrpckrFrom.DateFormat:=' dd, MM, yyyy';
 clndrpckrTo.DateFormat:=' dd, MM, yyyy';
 //
 //check if there is any dates selected if not , then raise error
 //
 btnexport.Enabled:=False;
 //
 dlgSave1.InitialDir:=ExtractFileDir(Application.ExeName);
 dlgSave1.Filter:='Text files (*.txt)|*.TXT|Any file (*.*)|*.*';
end;

procedure TFrmReports.PDF1Click(Sender: TObject);
begin
 //here we willl check what button we are clicking on







end;

end.
