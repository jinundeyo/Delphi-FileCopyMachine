object _FormMain: T_FormMain
  Left = 0
  Top = 0
  Caption = #54028#51068#48373#49324#44592
  ClientHeight = 407
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 222
    Width = 653
    Height = 185
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      653
      185)
    object Memo1: TMemo
      Left = 296
      Top = 6
      Width = 340
      Height = 171
      Anchors = [akLeft, akTop, akRight, akBottom]
      ImeName = 'Microsoft Office IME 2007'
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object JvFileListBox1: TJvFileListBox
      Left = 17
      Top = 29
      Width = 273
      Height = 148
      Anchors = [akLeft, akTop, akBottom]
      ImeName = 'Microsoft Office IME 2007'
      MultiSelect = True
      ShowGlyphs = True
      TabOrder = 1
      ForceFileExtensions = True
    end
    object CheckBox1: TCheckBox
      Left = 17
      Top = 6
      Width = 273
      Height = 17
      Caption = #47784#46304' '#54028#51068' '#48373#49324#54616#44592
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 222
    Align = alClient
    TabOrder = 1
    object a: TLabel
      Left = 17
      Top = 9
      Width = 24
      Height = 13
      Caption = #50896#48376
    end
    object Label1: TLabel
      Left = 363
      Top = 9
      Width = 36
      Height = 13
      Caption = #47785#51201#51648
    end
    object JvSpeedButton1: TJvSpeedButton
      Left = 296
      Top = 6
      Width = 60
      Height = 68
      Caption = #48373#49324#13#10#52712#49548
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      OnClick = JvSpeedButton1Click
    end
    object JvDirectoryListBox1: TJvDirectoryListBox
      Left = 17
      Top = 34
      Width = 273
      Height = 175
      Directory = 'C:\'
      FileList = JvFileListBox1
      DriveCombo = JvDriveCombo1
      ItemHeight = 17
      ScrollBars = ssBoth
      TabOrder = 0
      ImeName = 'Microsoft Office IME 2007'
    end
    object JvDriveCombo1: TJvDriveCombo
      Left = 47
      Top = 6
      Width = 243
      Height = 22
      DriveTypes = [dtRemovable, dtFixed, dtRemote]
      Offset = 4
      TabOrder = 1
      ImeName = 'Microsoft Office IME 2007'
    end
    object Button1: TButton
      Left = 296
      Top = 80
      Width = 60
      Height = 81
      Caption = #48373#49324
      TabOrder = 2
      OnClick = Button1Click
    end
    object JvDirectoryListBox2: TJvDirectoryListBox
      Left = 362
      Top = 34
      Width = 273
      Height = 175
      Directory = 'C:\'
      DriveCombo = JvDriveCombo2
      ItemHeight = 17
      ScrollBars = ssBoth
      TabOrder = 3
      ImeName = 'Microsoft Office IME 2007'
    end
    object JvDriveCombo2: TJvDriveCombo
      Left = 405
      Top = 6
      Width = 231
      Height = 22
      DriveTypes = [dtRemovable, dtFixed, dtRemote]
      Offset = 4
      TabOrder = 4
      ImeName = 'Microsoft Office IME 2007'
    end
    object btnCopy: TButton
      Left = 296
      Top = 167
      Width = 60
      Height = 42
      Caption = #48373#49324#13#10'('#49828#47112#46300')'
      TabOrder = 5
      OnClick = btnCopyClick
    end
  end
end
