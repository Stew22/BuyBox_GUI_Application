unit frmMain_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,frmhelpprompt_U,frmReports_U,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,system.JSON;

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
    idhtp1: TIdHTTP;
    idslhndlrscktpnsl1: TIdSSLIOHandlerSocketOpenSSL;
    rstclnt1: TRESTClient;
    procedure FormActivate(Sender: TObject);
    procedure btngetoffersClick(Sender: TObject);
    procedure btnhelpClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure AddReponse(Value:string);
begin
 frmmain.mmostatus.Lines.Add(Value)
end;


procedure Tfrmmain.btngetoffersClick(Sender: TObject);
var
  RestClient: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  JsonRequest: TJSONObject;
  JsonStrPart1, JsonStrPart2, JsonStrPart3,JsonStrPart4,JsonStrPart5: string;
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
 //
 RestClient := TRESTClient.Create('https://seller-api.takealot.com');
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);

  try
    // Split the JSON request into five parts
    JsonStrPart1 :=
      '{"requests":[{"options":{"headers":[{"value":"Key 29b73089f8ca235177c714de2e10c92a993cf64dc6e237844c602c4b297654e65f5e2857d40bab62d2113b77e9d09a6';
    JsonStrPart2 :=
      '98747ba7b3cd26701429026a38d01ddaf","key":"Authorization"}],"reportStyle":"separate-columns","insertRequestURL":0,"insertTimestampEach';
    JsonStrPart3 :=
      'Line":0,"insertTimestamp":0,"name":"Offers 1 ","jmesPath":"","url":"https://seller-api.takealot.com/v2/offers?page_number=1&page_size=2000","outputTypeMergeKey":null,"removeHeaderRow":0,"reportStyleUnwind":0,"oauthService":"none","flattenFieldToHeaderValue":"","id":"1687869731526","truncateHeaders":0,"noDataClearSheet":0,"destinationStartingCell":"A1","insertRequestURLEachLine":0,"flattenFieldToHeader":"none","postBody":"","outputType":"overwrite","api":"custom","methodType":"GET","multiplePostBodies":0,"pagination":{"mode":"none"},"delimiter":"."';
    JsonStrPart4 :=
      ',"flattenFieldToHeaderKey":"","clearSheet":1,"destinationRange":"Offers"},"domain":"takealot.com"}';
    JsonStrPart5 :=
      ']}';

    // Concatenate the five parts to form the complete JSON string
    JsonRequest := TJSONObject.ParseJSONValue(JsonStrPart1 + JsonStrPart2 + JsonStrPart3 + JsonStrPart4 + JsonStrPart5) as TJSONObject;

    Request.Method := TRESTRequestMethod.rmPOST; // Change this to rmGET if needed
    Request.Resource := '/v2/offers?page_number=1&page_size=2000';
    Request.AddBody(JsonRequest);

    Request.Client := RestClient;
    Request.Response := Response;

    Request.Execute;

    // Handle the response, e.g., display it in a Memo:
    mmostatus.Lines.Add('HTTP Response:');
    mmostatus.Lines.Add(Response.Content);
  finally
    JsonRequest.Free;
    RestClient.Free;
    Request.Free;
    Response.Free;
  end;
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

procedure Tfrmmain.FormActivate(Sender: TObject);
begin

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
