unit frmMain_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,frmhelpprompt_U,frmReports_U,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,system.JSON,
  PythonEngine, Vcl.PythonGUIInputOutput,frmSettings_U,VarPyth,WrapDelphi,frm_Python_Get_Offers_U;

type
  Tfrmmain = class(TForm)
    pgcmain: TPageControl;
    pnl1: TPanel;
    tsstatus: TTabSheet;
    pnl2: TPanel;
    btncheckbuybox: TButton;
    il1: TImageList;
    btnprocess: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btngetoffers: TButton;
    lbl5: TLabel;
    mmostatus: TMemo;
    tsbuybox: TTabSheet;
    lbl6: TLabel;
    mmobuyboxoutput: TMemo;
    mm1: TMainMenu;
    File1: TMenuItem;
    File2: TMenuItem;
    AboutUs1: TMenuItem;
    AboutUs2: TMenuItem;
    Support1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    LogABug1: TMenuItem;
    FeatureRequest1: TMenuItem;
    GetOffers1: TMenuItem;
    N3: TMenuItem;
    CheckBuyBoxes1: TMenuItem;
    N4: TMenuItem;
    ProcessResults1: TMenuItem;
    N5: TMenuItem;
    Exit1: TMenuItem;
    Reports1: TMenuItem;
    btnReports: TButton;
    btnsettings: TButton;
    Settings1: TMenuItem;
    Settings2: TMenuItem;
    btnhelp: TButton;
    pythngn1: TPythonEngine;
    pythngnptpt1: TPythonGUIInputOutput;
    pythndlphvr1: TPythonDelphiVar;
    procedure FormActivate(Sender: TObject);
    procedure btngetoffersClick(Sender: TObject);
    procedure btnhelpClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnsettingsClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ApplicationCount, BuyBoxCount , LostBuyBoxCount :Integer;
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btngetoffersClick(Sender: TObject);
var
Pycode:string;
begin
 // after getting the offers using python for delphi
 // we then write the offers returned to a textfile or a csv file
 // we might need to check which one can handle the number of characters otherwise
 // we leave it to write as an xlsx file
 // Store the results in a python for delphi varible , which we then write to the
 // memo , we then clear out the varible before making a new request
 // we are then going to filter out the json response and return back
 // the link with the plid , seller id , and the selling price
 //we then need to keep track of the number of requests made per button click ,
 //we then check whether the seller id is "Sarah beauty" , if not increment a
 //varible to keep track of the number of buy boxes lost , we can possibly
 //keep track of total , month to date , current day , and YTD
 //we then need to give the user a way to navigate to the seller portal ,
 //and also need to add the ability to add in exepections , for items that
 //cannot be won back due to margins
 // we can later add the ability to change seller price through API request
 //see how we will change the seller price through an API call
 //
 Pycode:= frmgetofferspython.mmogetoffers.Text;
 //
 pythngn1.ExecString(Pycode);
 //here we need to check if there was a posotive result , if there wasnt then we
 //need to tell the user
 //if there was a posotive result then store the results in a Tstringlist
 //
 if mmostatus.Text<> '' then
 begin

 end else
 begin
  ShowMessage('An Error Has Accoured ,Please Try Again , If The Error Keeps Occuring Then Please Log A Bug !');
 end;



 //
 //
end;


procedure Tfrmmain.btnhelpClick(Sender: TObject);
begin
 frmhelppeompt.ShowModal;
end;

procedure Tfrmmain.btnReportsClick(Sender: TObject);
begin
 FrmReports.ShowModal;
end;

procedure Tfrmmain.btnsettingsClick(Sender: TObject);
begin
 frmsettings.ShowModal;
end;

procedure Tfrmmain.FormActivate(Sender: TObject);
begin
 //set the path to python folder dynamically at form activate
 pythngn1.DllPath:=ExtractFileDir(Application.ExeName) + '\Python\';
 pythngn1.DllName:='python310.dll';
 //
 //
 btncheckbuybox.Enabled:=False;
 btnprocess.Enabled:=False;
 //
 //clear the memo boxes
 mmostatus.Clear;
 mmobuyboxoutput.Clear;
 //
end;

end.
