unit frmUIMain;

interface

uses
  untSysWebComponentProgressIndicator,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TUIMain = class(TForm)
    pnlOneHost: TPanel;
    btnStart: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
    FWebComponent: TWebComponentProgressIndicator;
    procedure DoLongRunningWork;
  public
    { Public declarations }
  end;

var
  UIMain: TUIMain;

implementation

uses
  System.IOUtils
  ;

{$R *.dfm}

procedure TUIMain.FormCreate(Sender: TObject);
begin
  self.top := 0;
  self.Left := 0;
  FWebComponent := TWebComponentProgressIndicator.Create(pnlOneHost);
  FWebComponent.CreateWebComponent(pnlOneHost);
end;

procedure TUIMain.btnStartClick(Sender: TObject);
begin
  DoLongRunningWork;
end;

procedure TUIMain.DoLongRunningWork;
var
  I: Integer;
  lTop: integer;
begin
  lTop := 10;
  FWebComponent.Start;
  for I := 1 to lTop do
    begin
      FWebComponent.PushMsg('Processing item ' + inttostr(I) + ' of ' + inttostr(lTop));
      sleep(1000);
    end;
  FWebComponent.Stop;
end;

end.
