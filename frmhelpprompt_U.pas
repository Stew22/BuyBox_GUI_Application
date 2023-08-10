unit frmhelpprompt_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls,Winapi.ShellAPI;

type
  Tfrmhelppeompt = class(TForm)
    btnusermanual: TButton;
    btnAPIdocuments: TButton;
    il1: TImageList;
    btnfeaturereq: TButton;
    btnlogabug: TButton;
    procedure btnlogabugClick(Sender: TObject);
    procedure btnfeaturereqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmhelppeompt: Tfrmhelppeompt;

implementation

{$R *.dfm}

procedure Tfrmhelppeompt.btnfeaturereqClick(Sender: TObject);
begin
 ShellExecute(0, 'open', 'mailto:' + 'dantu.domonique@gmail.com' + '?subject=' + 'Takealot Buy Box Manager , Feature Request !', nil, nil, SW_SHOWNORMAL);
end;

procedure Tfrmhelppeompt.btnlogabugClick(Sender: TObject);
begin
 ShellExecute(0, 'open', 'mailto:' + 'dantu.domonique@gmail.com' + '?subject=' + 'Takealot Buy Box Manager , Bug !', nil, nil, SW_SHOWNORMAL);
end;

end.
