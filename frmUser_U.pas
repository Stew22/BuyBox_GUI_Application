unit frmUser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  System.ImageList, Vcl.ImgList ,frmMain_U;

type
  Tfrmselectuser = class(TForm)
    pnl1: TPanel;
    cbbuser: TComboBox;
    lbl1: TLabel;
    il1: TImageList;
    btnselectuser: TButton;
    medtpword: TMaskEdit;
    lbl2: TLabel;
    btnregisteruser: TButton;
    procedure btnregisteruserClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnselectuserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmselectuser: Tfrmselectuser;

implementation

{$R *.dfm}

procedure Tfrmselectuser.btnregisteruserClick(Sender: TObject);
var
Uname,Pword:string;
begin
 //have 2 pop ups for collecting user information
 Uname:= InputBox('Username', 'Please Enter Your Username:', '');
 //
 Pword:=InputBox('Password', 'Please Enter Your Password:', '');
 //
 if Uname <> '' then
 begin
  //now that we have captured the user name , we can then ask for the p
  if Pword <> '' then
  begin
   //successfully captured all the user information
   //now we are going to store it and use that information , we can encrypt it




   //
  end else
  begin
   ShowMessage('You Can Not Leave The Password Blank ! , Please Try Again');
  end;
 end else
 begin
  ShowMessage('You Can Not Leave The User Name Blank ! , Please Try Again');
 end;

end;

procedure Tfrmselectuser.btnselectuserClick(Sender: TObject);
begin
 //first check if the user name and the password match , if they do we can
 //open the form ,
end;

procedure Tfrmselectuser.FormActivate(Sender: TObject);
var
Ufile,Pfile:TextFile;
Users:string;
begin
 //here we will need to populate the combo box with the user names
 //
 if FileExists(ExtractFileDir(Application.ExeName) + '/bin/Ufile.txt') then
 begin
  if FileExists(ExtractFileDir(Application.ExeName) + '/bin/Pfile.txt') then
  begin
   AssignFile(Ufile,ExtractFileDir(Application.ExeName) + '/bin/Ufile.txt');
   Reset(Ufile);
   //we need to loop through the file to read all the users
   while not Eof(Ufile) do
   begin
    Readln(Ufile,Users);
    //now we add it to the combobox
    cbbuser.Items.Add(Users); //this will add the users
   end;
   CloseFile(Ufile);
   //now we need to populate the password file
   //
  end else
  begin
   ShowMessage('Password File Does Not Exist , We will Create One For You !');
   //create the file ! , promt the user to retsart
  end;
 end else
 begin
  //notify the user and create the file
  ShowMessage('User File Does Not Exist , We will Create One For You !');
  //create the file ! , promt the user to retsart
 end;
end;

end.
