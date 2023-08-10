unit frmMain_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,frmhelpprompt_U,frmReports_U,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,system.JSON,
  PythonEngine, Vcl.PythonGUIInputOutput,frmSettings_U,VarPyth,WrapDelphi,frm_Python_Get_Offers_U,
  System.StrUtils,System.Types,System.AnsiStrings,ProgressFormUnit_U,superobject,
  frm_Python_Input_U,Winapi.ShellAPI;

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
    lbl7: TLabel;
    lblproductlistings: TLabel;
    tsbuyboxresults: TTabSheet;
    tmr1: TTimer;
    mmo1: TMemo;
    pythngnptpt2: TPythonGUIInputOutput;
    pythngnptpt3: TPythonGUIInputOutput;
    mmo2: TRichEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btngetoffersClick(Sender: TObject);
    procedure btnhelpClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnsettingsClick(Sender: TObject);
    procedure btnprocessClick(Sender: TObject);
    procedure GetOffers1Click(Sender: TObject);
    procedure CheckBuyBoxes1Click(Sender: TObject);
    procedure ProcessResults1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure btncheckbuyboxClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure LogABug1Click(Sender: TObject);
    procedure FeatureRequest1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ApplicationCount, BuyBoxCount , LostBuyBoxCount :Integer;
    PlidStore , HrefStore ,SellingPriceStore ,SellerStore:TStringList;
    PythonScriptStore:TStringList;
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}


// Helper function to extract substring after a specific substring
function ExtractAfter(const AInput, ASubStr: string): string;
var
  SubStrPos: Integer;
begin
  SubStrPos := Pos(ASubStr, AInput);
  if SubStrPos > 0 then
    Result := Copy(AInput, SubStrPos + Length(ASubStr), MaxInt)
  else
    Result := '';
end;

procedure Tfrmmain.btncheckbuyboxClick(Sender: TObject);
var
  JSONData: string;
  Title, DesktopHref, SellerSlug, PurchasePriceStr: string;
  PurchasePrice: Double;
  IndexStart, IndexEnd: Integer;
begin
  //before we process the json response in the memo , i need to find a way
  //i can modify the script PLID
  PythonScriptStore:=TStringList.Create;
  //
  PythonScriptStore.Add(frmpyinput.mmopythoninput.Text);
  //now we add in the plid , we will need to loop through all our plids stored
  PythonScriptStore.Add('buy_box_values = ['+ QuotedStr('68577960'));
  //
  PythonScriptStore.Add(frmpyinput.mmopart2.text);
  //now we need to run the python script and generate an reponse
  pythngn1.IO:=pythngnptpt2;
  //
  pythngn1.ExecString(PythonScriptStore.Text);
  //
  //we might need to wait first before we process the data
  //
  Sleep(3000);
  //then we will process the reponse
  // Get the JSON data from the memo
  //we need to write another python script to parse to response and only return
  //back the data we want
  //he problem seems to lie in the format it is returned to the memo
  //thats why i have errors in parsing it
  //take a look into that
  // Get the JSON data from the memo
   // Get the JSON data from the memo
  JSONData := mmo1.Lines.Text;

  // Extract the title
  IndexStart := Pos('''title'': "', JSONData) + Length('''title'': "');
  IndexEnd := PosEx('''', JSONData, IndexStart);
  Title := Copy(JSONData, IndexStart, IndexEnd - IndexStart);

  // Extract the desktop_href
  IndexStart := Pos('''desktop_href'': ''', JSONData) + Length('''desktop_href'': ''');
  IndexEnd := PosEx('''', JSONData, IndexStart);
  DesktopHref := Copy(JSONData, IndexStart, IndexEnd - IndexStart);

  // Extract the purchase_price
  IndexStart := Pos('''purchase_price'': ', JSONData) + Length('''purchase_price'': ');
  IndexEnd := PosEx(',', JSONData, IndexStart);
  PurchasePriceStr := Copy(JSONData, IndexStart, IndexEnd - IndexStart);
  PurchasePrice := StrToFloatDef(PurchasePriceStr, 0.0);

  // Extract the seller_slug
  IndexStart := Pos('''seller_detail''', JSONData) + Length('''seller_detail''');
  IndexStart := Pos('''display_name'': ''', JSONData, IndexStart) + Length('''display_name'': ''');
  IndexEnd := PosEx('''', JSONData, IndexStart);
  SellerSlug := Copy(JSONData, IndexStart, IndexEnd - IndexStart);
  //
  mmo2.Lines.Add('Title: ' + Title);
  mmo2.Lines.Add('Desktop Href: ' + DesktopHref);
  mmo2.Lines.Add('Purchase Price: ' + FloatToStr(PurchasePrice));
  mmo2.Lines.Add('Seller Slug: ' + SellerSlug);
  // Display or use the extracted values as needed
  tmr1.Enabled:=True;
end;

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
  btnprocess.Enabled:=True;
 end else
 begin
  ShowMessage('An Error Has Accoured ,Please Try Again , If The Error Keeps Occuring Then Please Log A Bug !');
 end;
 //now we will add in some small code that will parse the json response and
 //just populate the label with the product listings total
 //
 //
end;


procedure Tfrmmain.btnhelpClick(Sender: TObject);
begin
 frmhelppeompt.ShowModal;
end;

procedure Tfrmmain.btnprocessClick(Sender: TObject);
var
  JsonData: string;
  JsonObj: TJSONObject;
  JsonArray: TJSONArray;
  I,J, TotalResults: Integer;
  ProductObject: TJSONObject;
  PLID: string;
  TempString:TStringList;
begin
  // Clear the output memo before displaying the products
  mmobuyboxoutput.Clear;
  //Create the stringlist to store the data obtained from processing the JSON
  TempString:=TStringList.Create;
  HrefStore:=TStringList.Create;
  SellingPriceStore:=TStringList.Create;
  SellerStore:=TStringList.Create;
  //then we will need to check how we are going store this information
  //for reporting purposes

  // Get the entire JSON data from the memo
  JsonData := mmostatus.Text;

  // Parse the entire JSON response
  JsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JsonData), 0) as TJSONObject;

  // Check if the JSON parsing was successful and it is an object
  if Assigned(JsonObj) and (JsonObj is TJSONObject) then
  begin
    try
      // Extract the "total_results" field
      TotalResults := JsonObj.GetValue('total_results').Value.ToInteger;

      // Check if "total_results" is a valid number
      if TotalResults <= 0 then
      begin
        mmobuyboxoutput.Lines.Add('No product listings found.');
        Exit;
      end;

      // Get the "offers" array containing product listings
      JsonArray := JsonObj.GetValue('offers') as TJSONArray;

      // Check if "offers" is a valid array
      if not Assigned(JsonArray) then
      begin
        mmobuyboxoutput.Lines.Add('Invalid JSON data. Expected "offers" array.');
        Exit;
      end;
      //
      frmProgress.pb1.Max:=JsonArray.Count;
      frmProgress.Show;
      // Loop through each product listing in the "offers" array
      for I := 0 to JsonArray.Count - 1 do
      begin
        //here we will also add in some code for the pop up progress bar
        frmProgress.pb1.Position:=frmProgress.pb1.Position + 1;
        //
        //Sleep(50);
        // Get the product object
        if JsonArray.Items[I] is TJSONObject then
        begin
          ProductObject := JsonArray.Items[I] as TJSONObject;

          // Extract the desired fields from the JSON object
          // Replace "FieldName" with the actual field names you want to extract

          // Extracting RRP (Recommended Retail Price) and Selling Price
          mmobuyboxoutput.Lines.Add('RRP: ' + ProductObject.GetValue('rrp').Value);
          mmobuyboxoutput.Lines.Add('Selling Price: ' + ProductObject.GetValue('selling_price').Value);
          //
          //SellingPriceStore.Add(ProductObject.GetValue('selling_price').Value);

          // Extracting the product title
          mmobuyboxoutput.Lines.Add('Title: ' + ProductObject.GetValue('title').Value);

          // Extracting the link to the product
          mmobuyboxoutput.Lines.Add('Link to Product: ' + ProductObject.GetValue('offer_url').Value);
          //HrefStore.Add(ProductObject.GetValue('offer_url').Value);

          // Extract PLID from the offer_url
          PLID := ExtractAfter(ProductObject.GetValue('offer_url').Value, 'PLID');
          mmobuyboxoutput.Lines.Add('PLID: ' + PLID.Trim);
          PlidStore.Add(PLID.Trim);

          // Add a separator line between products
          mmobuyboxoutput.Lines.Add('--------------------------------------');
        end;
      end;
      //save the data to the temp string stringlist
      //
       lblproductlistings.Caption:=IntToStr(TotalResults);
      //
      for J := 0 to mmobuyboxoutput.Lines.Count -1 do
      begin
       TempString.Add(mmobuyboxoutput.Lines[J]);
      end;
      //TempString.Add('Total product listings: ' + IntToStr(TotalResults));
      //here we will need to hide the progress once completed
      // Display the total number of product listings
      frmProgress.close;
      //
      mmobuyboxoutput.Text:=TempString.Text;
    finally
      // Free the parsed JSON object
      JsonObj.Free;
    end;
    //now we enable the button
    btncheckbuybox.Enabled:=True;
  end
  else
  begin
    mmobuyboxoutput.Lines.Add('Invalid JSON data.');
  end;
end;

procedure Tfrmmain.btnReportsClick(Sender: TObject);
begin
 FrmReports.ShowModal;
end;

procedure Tfrmmain.btnsettingsClick(Sender: TObject);
begin
 frmsettings.ShowModal;
end;

procedure Tfrmmain.CheckBuyBoxes1Click(Sender: TObject);
begin
 if btncheckbuybox.Enabled = True then
 begin

 end else
 begin


 end;
end;

procedure Tfrmmain.Exit1Click(Sender: TObject);
begin
 mmostatus.Clear;
 mmobuyboxoutput.Clear;
 frmmain.Close;
end;

procedure Tfrmmain.FeatureRequest1Click(Sender: TObject);
begin
 frmhelppeompt.btnfeaturereq.Click;
end;

procedure Tfrmmain.FormActivate(Sender: TObject);
begin
 //set the path to python folder dynamically at form activate
 pythngnptpt1.Output:=mmostatus;
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

procedure Tfrmmain.GetOffers1Click(Sender: TObject);
begin
btngetoffers.Click;
end;

procedure Tfrmmain.LogABug1Click(Sender: TObject);
begin
 frmhelppeompt.btnlogabug.Click;
end;

procedure Tfrmmain.ProcessResults1Click(Sender: TObject);
begin
 if btnprocess.Enabled = True then
 begin

 end else
 begin
   ShowMessage('Please Click Get Offers First !');
 end;
end;

procedure Tfrmmain.Settings2Click(Sender: TObject);
begin
frmsettings.ShowModal;
end;

procedure Tfrmmain.tmr1Timer(Sender: TObject);
var
  TargetLine: Integer;
  TargetText: string;
  SellerName: string;
  i: Integer;
begin
  TargetText := 'Seller Slug:';
  SellerName := 'Sarah Beauty Supplies';

  mmo2.Lines.BeginUpdate;
  try
    mmo2.SelAttributes.Color := clBlack; // Set the default color to black for all lines.

    TargetLine := mmo2.Lines.IndexOf(TargetText);

    if TargetLine <> -1 then // Check if the line with "Seller Slug:" is found.
    begin
      Inc(TargetLine); // Move to the next line after "Seller Slug:".
      if TargetLine < mmo2.Lines.Count then // Ensure the line is within bounds.
      begin
        // Highlight the line with "Seller Slug:" in red if the seller name is not "Sarah Beauty Supplies".
        if mmo2.Lines[TargetLine] <> SellerName then
        begin
          mmo2.SelStart := mmo2.Perform(EM_LINEINDEX, TargetLine, 0);
          mmo2.SelLength := Length(mmo2.Lines[TargetLine]);
          mmo2.SelAttributes.Color := clRed;
        end;
      end;
    end;
  finally
    mmo2.Lines.EndUpdate;
  end;
end;

end.
