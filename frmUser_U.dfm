object frmselectuser: Tfrmselectuser
  Left = 0
  Top = 0
  Caption = 'Select User'
  ClientHeight = 128
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 297
    Height = 81
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 13
      Caption = 'User : '
    end
    object lbl2: TLabel
      Left = 16
      Top = 46
      Width = 56
      Height = 13
      Caption = 'Password : '
    end
    object cbbuser: TComboBox
      Left = 78
      Top = 16
      Width = 187
      Height = 21
      TabOrder = 0
      Text = 'Select User '
    end
    object medtpword: TMaskEdit
      Left = 78
      Top = 43
      Width = 187
      Height = 21
      TabOrder = 1
      Text = ''
    end
  end
  object btnselectuser: TButton
    Left = 8
    Top = 95
    Width = 97
    Height = 25
    Caption = 'Select User '
    ImageIndex = 0
    Images = il1
    TabOrder = 1
    OnClick = btnselectuserClick
  end
  object btnregisteruser: TButton
    Left = 208
    Top = 95
    Width = 97
    Height = 25
    Caption = 'Register User '
    ImageIndex = 1
    Images = il1
    TabOrder = 2
    OnClick = btnregisteruserClick
  end
  object il1: TImageList
    Left = 24
    Top = 8
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000151515000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000151515000000000000000000D0D0D00028282800545454005454
      5400545454005454540054545400545454005454540030303000000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001B1B1B00DCDC
      DC00000000000000000000000000000000000000000000000000000000000000
      0000DADADA001D1D1D000000000000000000CBCBCB007A7A7A00000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF32323200545454005454
      54004E4E4E005E5E5E00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000656565007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00676767000000000000000000CBCBCB007A7A7A00000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF47474700000000FF0000
      00FF000000FF59595900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDDDDD001010
      1000BFBFBF00000000000000000000000000000000000000000000000000BDBD
      BD0010101000000000000000000000000000D1D1D10074747400000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF39393900000000FF0000
      00FF000000FF59595900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B7001111110077777700DCDCDC000000000000000000DBDBDB00767676001111
      1100B8B8B800000000000000000000000000000000FF42424200000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF52525200000000FF0000
      00FFD3D3D3006C6C6C00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDDDDD00656565001B1B1B0002020200020202001B1B1B0066666600DDDD
      DD0000000000000000000000000000000000000000FF8F8F8F00707070000000
      00FF000000FF000000FF000000FFDADADA0041414100CACACA00000000FF0000
      00FF5C5C5C00C0C0C000000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFA6A6A6003131
      31003D3D3D00434343002E2E2E004141410030303000727272006E6E6E004040
      400098989800000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000065656500191919001919190066666600000000000000
      000000000000000000000000000000000000000000FF000000FFCBCBCB003F3F
      3F00C7C7C700000000FFA3A3A3003C3C3C003B3B3B00B1B1B100AEAEAE004747
      4700000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000363636006C6C6C0000000000000000006B6B6B00383838000000
      000000000000000000000000000000000000000000FF000000FF505050000000
      00FF000000FF000000FF000000FF8F8F8F009D9D9D00000000FF000000FFBBBB
      BB0096969600000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B3B3003B3B3B00000000000000000000000000000000003A3A3A00B4B4
      B40000000000000000000000000000000000000000FF000000FF3E3E3E000000
      00FF000000FF000000FF000000FFCACACA0076767600000000FF000000FFD0D0
      D0008A8A8A00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008B8B8B007272720000000000000000000000000000000000717171008C8C
      8C0000000000000000000000000000000000000000FF000000FF434343000000
      00FF000000FF000000FF000000FF989898004E4E4E00000000FF000000FF5757
      5700DEDEDE00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B3B3003C3C3C00000000000000000000000000000000003A3A3A00B4B4
      B40000000000000000000000000000000000000000FF000000FFBABABA004848
      4800DEDEDE00000000FFB7B7B70049494900A4A4A4004B4B4B005C5C5C00CDCD
      CD00000000FF67676700000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000363636006D6D6D0000000000000000006C6C6C00373737000000
      000000000000000000000000000000000000000000FF000000FF000000FFC6C6
      C60057575700444444007B7B7B00000000FF000000FF000000FF000000FF0000
      00FF757575001515150044444400000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000064646400181818001919190065656500000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF57575700000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C003003F00000000
      CFF33F8300000000CFF33FBB00000000C7E73FBB00000000E187BFB300000000
      F00F9E3300000000FFFFC00700000000FC3FC40F00000000F99FDE6700000000
      F3CFDE6700000000F3CFDE6700000000F3CFC40B00000000F99FE1F100000000
      FC3FFFFB00000000FFFFFFFF00000000}
  end
end
