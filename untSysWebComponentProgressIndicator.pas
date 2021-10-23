unit untSysWebComponentProgressIndicator;

interface

uses
  Vcl.Controls
, System.Classes
, VirtualUI_SDK
  ;

type
  TWebComponentProgressIndicator = class(TObject)
  private
    FRemoteObj: TJSObject;
    FXtagDir: string;
  public
    constructor Create(aControl: TWinControl);
    destructor Destroy; override;
    procedure CreateWebComponent(aControl: TWinControl);
    property  XTagDir: string read FXtagDir write FXTagDir;
    procedure Start;
    procedure Stop;
    procedure PushMsg(aMsg: string);
  end;

implementation

uses
  System.SysUtils
, System.IOUtils
  ;

{ TWebComponentProgressIndicator }

constructor TWebComponentProgressIndicator.Create(aControl: TWinControl);
var
  lAppName: string;
begin
  lAppName := ParamStr(0);
  FXtagDir := TPath.GetDirectoryName(lAppName);
  FXtagDir := TPath.Combine(FXtagDir, TPath.GetFileNameWithoutExtension(lAppName) + '-WebAssets\');
end;

procedure TWebComponentProgressIndicator.CreateWebComponent(aControl: TWinControl);
begin
  VirtualUI.HTMLDoc.CreateSessionURL('webAssets',FXtagDir);
  VirtualUI.HTMLDoc.LoadScript('/webAssets/js/x-tag-core.min.js','');
  VirtualUI.HTMLDoc.ImportHTML('/webAssets/componentOne/componentone.html','');

  FRemoteObj := TJSObject.Create(AControl.Name);
  FRemoteObj.Events.Add('start');
  FRemoteObj.Events.Add('stop');
  FRemoteObj.Events.Add('msgupdate').AddArgument('newmsg',JSDT_STRING);
  FRemoteObj.ApplyModel;

  VirtualUI.HTMLDoc.CreateComponent(AControl.Name, 'x-progress', AControl.Handle);
end;

destructor TWebComponentProgressIndicator.Destroy;
begin
  FRemoteObj := nil;
  inherited;
end;

procedure TWebComponentProgressIndicator.PushMsg(aMsg: string);
begin
  FRemoteObj.Events['msgupdate'].ArgumentAsString('newmsg',aMsg).Fire;
end;

procedure TWebComponentProgressIndicator.Start;
begin
  FRemoteObj.Events['start'].Fire;
end;

procedure TWebComponentProgressIndicator.Stop;
begin
  FRemoteObj.Events['stop'].Fire;
end;

end.
