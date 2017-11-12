object frmAddEnvironmentVariable: TfrmAddEnvironmentVariable
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Add Environment Variable'
  ClientHeight = 165
  ClientWidth = 389
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 121
    Width = 383
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -4
    ExplicitTop = 191
    ExplicitWidth = 639
    object BitBtn1: TBitBtn
      AlignWithMargins = True
      Left = 224
      Top = 3
      Width = 75
      Height = 35
      Action = ActionOk
      Align = alRight
      Caption = 'Ok'
      TabOrder = 0
      ExplicitLeft = 480
    end
    object BitBtn2: TBitBtn
      AlignWithMargins = True
      Left = 305
      Top = 3
      Width = 75
      Height = 35
      Action = ActionCancel
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 1
      ExplicitLeft = 561
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 383
    Height = 112
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 146
    ExplicitTop = 54
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 27
      Height = 13
      Align = alTop
      Caption = 'Name'
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 46
      Width = 26
      Height = 13
      Align = alTop
      Caption = 'Value'
    end
    object editName: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 19
      Width = 377
      Height = 21
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 36
      ExplicitWidth = 121
    end
    object editValue: TJvDirectoryEdit
      AlignWithMargins = True
      Left = 3
      Top = 62
      Width = 377
      Height = 21
      Align = alTop
      DialogKind = dkWin32
      TabOrder = 1
      Text = ''
      ExplicitTop = 79
      ExplicitWidth = 633
    end
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 16
    Top = 121
    object ActionOk: TAction
      Caption = 'Ok'
      ImageIndex = 3
      OnExecute = ActionOkExecute
    end
    object ActionCancel: TAction
      Caption = 'Cancel'
      ImageIndex = 0
      OnExecute = ActionCancelExecute
    end
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Left = 48
    Top = 121
    Bitmap = {
      494C010106000900080010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000006EFFFF006EFFFF006EFFFF006EFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3542F4FF00000000000000000000000000000000016EFFFF016E
      FFFF016EFFFF00122B2B00000000000000000000000000000000006EFFFF006E
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3542F4FF0000000000000000000000000000000000000000016E
      FFFF016EFFFF000000000000000000000000000000000000000000000000006B
      F7F7006EFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FFFFFF
      FFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8
      CFFFFFFFFFFF3542F4FF00000000000000000000000000000000006EFFFF006E
      FFFF016EFFFF0000000000000000000000000000000000000000000000000000
      0000006EFFFF006EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FFFFFF
      FFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8CFFFDCD8
      CFFFFFFFFFFF3542F4FF00000000000000000000000000000000006EFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3542F4FF00000000000000000000000000000000006EFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF00000000000000000000000000000000006EFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF00000000000000000000000000000000006EFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF2727
      C6FF2727C6FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FF3542
      F4FF3542F4FF3542F4FF00000000000000000000000000000000006EFFFF0050
      BABA00000000000000000000000000000000000000000000000000000000016E
      FFFF006EFFFF006EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF2727
      C6FF2727C6FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FF373125FFC5BEB0FF3542
      F4FF3542F4FF3542F4FF0000000000000000000000000000000000081414006E
      FFFF00000000000000000000000000000000000000000000000000000000016E
      FFFF016EFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF2727
      C6FF2727C6FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FF373125FFC5BEB0FF3542
      F4FF3542F4FF3542F4FF0000000000000000000000000000000000000000006B
      F8F8006EFFFF0051BDBD00000000000000000000000000000000016BF7F7016E
      FFFF016EFFFF016EFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003542F4FF2727
      C6FF2727C6FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FFC5BEB0FF3542
      F4FF3542F4FF0000000000000000000000000000000000000000000000000000
      000000081515006EFFFF006EFFFF006EFFFF006EFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F13494D3542F4FF3542F4FF3542F4FF3542F4FF000107070000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001735164D4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF010501070000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      00004FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF
      4BFF000000000000000000000000000000000000000000000000000000000C0E
      36383542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF0000000000000000000000000000000000000000006BEFFF006BEFFF006B
      EFFF006BEFFF006BEFFF006BEFFF006BEFFF006BEFFF006BEFFF006BEFFF006B
      EFFF006BEFFF006BEFFF006BEFFF000000000000000000000000000001013542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF0000000000000000000000000000000000000000000100014FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF0000000000000000000000000000000000000000000000003542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF00000000000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF000000000000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000004FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF000000000000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF5B65F6FF3542F4FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF000000000000000000000000333FE9F33542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF01030B0B00000000000000004BA748F34FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFFFFFFFFFFFFFFFFFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF0307030B0000000000000000000000003542F4FF3542
      F4FF3542F4FFF7F8FFFFFFFFFFFF3542F4FF5B65F6FFFFFFFFFF6973F7FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF0000000000000000000000003542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF00000000000000004FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFFFFFFFFFFFFFFFFFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF0000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FFF7F8FFFFFFFFFFFFFFFFFFFF6872F7FF3542F4FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF0000000000000000000000003542F4FF3542F4FF3542
      F4FF3542F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3542
      F4FF3542F4FF3542F4FF3542F4FF00000000000000004FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF0000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF5B65F6FFFFFFFFFFFFFFFFFF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF0000000000000000000000003542F4FF3542F4FF3542
      F4FF3542F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3542
      F4FF3542F4FF3542F4FF3542F4FF00000000000000004FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF0000000000000000000000003542F4FF3542
      F4FF3542F4FF5C66F6FFFFFFFFFF6872F7FFF7F8FFFFFFFFFFFF3542F4FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF0000000000000000000000003542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF00000000000000004FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFFFFFFFFFFFFFFFFFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF0000000000000000000000003542F4FF3542
      F4FF3542F4FF3F4CF5FF6771F7FF3542F4FF3542F4FFF7F8FFFF3542F4FF3542
      F4FF3542F4FF3542F4FF00000000000000000000000000000000006BEFFF006B
      EFFF006BEFFF006BEFFF006BEFFF006BEFFF006BEFFF006BEFFF006BEFFF006B
      EFFF006BEFFF006BEFFF0000000000000000000000003542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF151A5E6200000000000000004FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFFFFFFFFFFFFFFFFFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF1F421C62000000000000000000000000030512143542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF00000000000000000000000000000000000000000098FFFF0098
      FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF0098
      FFFF0098FFFF0098FFFF000000000000000000000000000000003542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF000000000000000000000000000000004FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF4FAF4BFF00000000000000000000000000000000000000003440
      EDF83542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF0E113D400000000000000000000000000000000000000000000000000098
      FFFF0098FFFF0098FFFF0098FFFF006BEFFF006EF0FF0098FFFF0098FFFF0098
      FFFF0090F1F100000000000000000000000000000000000000001D25888F3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF00000000000000000000000000000000000000002C622B8F4FAF
      4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF
      4BFF4FAF4BFF0000000000000000000000000000000000000000000000000000
      0000040514153542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000097FDFD0098FFFF0098FFFF0098FFFF0098FFFF006AB3B30000
      0000000000000000000000000000000000000000000000000000000000001F28
      8F973542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF010104040000000000000000000000000000000000000000000000002E68
      2C974FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF
      4BFF010301040000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007DD2D200385E5E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF333FE9F40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4FAF4BFF4CA748F40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
