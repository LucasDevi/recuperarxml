object FfGERARXML: TFfGERARXML
  Left = 214
  Top = 117
  Caption = 'Baixar XML da NF-e'
  ClientHeight = 415
  ClientWidth = 800
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
  object LabelChavedeAcesso: TLabel
    Left = 22
    Top = 145
    Width = 122
    Height = 19
    Caption = 'Chave de acesso:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblStatus: TLabel
    Left = 28
    Top = 316
    Width = 344
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = 'Conectando'
    FocusControl = ProgressBar1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 163
    Top = 382
    Width = 238
    Height = 24
    AutoSize = False
    FocusControl = ProgressBar1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 22
    Top = 381
    Width = 143
    Height = 25
    AutoSize = False
    Caption = 'Pasta de grava'#231#227'o: '
    FocusControl = ProgressBar1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ImageCaptcha: TImage
    Left = 22
    Top = 13
    Width = 352
    Height = 79
    Stretch = True
  end
  object Label4: TLabel
    Left = 22
    Top = 201
    Width = 249
    Height = 23
    AutoSize = False
    Caption = 'Digite letras/n'#250'meros da Imagem:'
    FocusControl = ProgressBar1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 28
    Top = 338
    Width = 345
    Height = 27
    TabOrder = 4
  end
  object edtChaveNFe: TEdit
    Left = 22
    Top = 166
    Width = 354
    Height = 21
    TabStop = False
    HideSelection = False
    TabOrder = 0
  end
  object EditCaptcha: TEdit
    Left = 271
    Top = 199
    Width = 104
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    ParentFont = False
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 417
    Top = 109
    Width = 361
    Height = 87
    TabStop = False
    Align = alCustom
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object WebBrowser: TWebBrowser
    Left = 417
    Top = 216
    Width = 359
    Height = 182
    TabStop = False
    TabOrder = 6
    OnProgressChange = WebBrowserProgressChange
    OnDocumentComplete = WebBrowserDocumentComplete
    ControlData = {
      4C0000001B250000CF1200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620E000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object BitBtnXML1: TButton
    Left = 23
    Top = 244
    Width = 174
    Height = 53
    Caption = 'Iniciar Download XML'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtnXML1Click
  end
  object BtClose: TButton
    Left = 205
    Top = 244
    Width = 166
    Height = 53
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtCloseClick
  end
  object Memo1: TMemo
    Left = 417
    Top = 13
    Width = 360
    Height = 85
    TabStop = False
    Align = alCustom
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object ButtonNovaConsulta: TButton
    Left = 68
    Top = 102
    Width = 255
    Height = 29
    Caption = 'Nova Consulta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = ButtonNovaConsultaClick
  end
end
