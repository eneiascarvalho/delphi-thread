object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Delphi threads'
  ClientHeight = 166
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gauge0: TGauge
    Left = 89
    Top = 6
    Width = 498
    Height = 25
    Progress = 0
  end
  object gauge1: TGauge
    Left = 89
    Top = 37
    Width = 498
    Height = 25
    Progress = 0
  end
  object gauge2: TGauge
    Left = 89
    Top = 68
    Width = 498
    Height = 25
    Progress = 0
  end
  object gauge3: TGauge
    Left = 89
    Top = 101
    Width = 498
    Height = 25
    Progress = 0
  end
  object gauge4: TGauge
    Left = 89
    Top = 132
    Width = 498
    Height = 25
    Progress = 0
  end
  object btnStartStop0: TButton
    Left = 8
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartStop0Click
  end
  object btnStartStop1: TButton
    Tag = 1
    Left = 8
    Top = 37
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = btnStartStop0Click
  end
  object btnStartStop2: TButton
    Tag = 2
    Left = 8
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = btnStartStop0Click
  end
  object btnStartStop3: TButton
    Tag = 3
    Left = 8
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 3
    OnClick = btnStartStop0Click
  end
  object btnStartStop4: TButton
    Tag = 4
    Left = 8
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 4
    OnClick = btnStartStop0Click
  end
end
