object UIMain: TUIMain
  Left = 0
  Top = 0
  Caption = 'Web Component Demo'
  ClientHeight = 286
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    384
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOneHost: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 378
    Height = 241
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = 39
    ExplicitWidth = 307
  end
  object btnStart: TButton
    Left = 3
    Top = 8
    Width = 378
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Start long running work...'
    TabOrder = 1
    OnClick = btnStartClick
    ExplicitWidth = 307
  end
end
