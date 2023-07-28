unit frmhelpprompt_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls;

type
  Tfrmhelppeompt = class(TForm)
    btnusermanual: TButton;
    btnAPIdocuments: TButton;
    il1: TImageList;
    btnfeaturereq: TButton;
    btnlogabug: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmhelppeompt: Tfrmhelppeompt;

implementation

{$R *.dfm}

end.
