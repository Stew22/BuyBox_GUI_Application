unit frmSettings_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls,frm_Python_Input_U;

type
  Tfrmsettings = class(TForm)
    btnpythoninput: TButton;
    il1: TImageList;
    procedure btnpythoninputClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsettings: Tfrmsettings;

implementation

{$R *.dfm}

procedure Tfrmsettings.btnpythoninputClick(Sender: TObject);
begin
frmpyinput.ShowModal;
end;

end.
