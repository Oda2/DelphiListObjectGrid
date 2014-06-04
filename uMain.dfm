object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 407
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 168
    Width = 678
    Height = 239
    Align = alBottom
    TabOrder = 0
    object cxGridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.HideSelection = True
      object cxGridColumnID: TcxGridColumn
        Caption = 'ID'
      end
      object cxGridColumnNome: TcxGridColumn
        Caption = 'Nome'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 224
      end
      object cxGridColumnCPFCNPJ: TcxGridColumn
        Caption = 'CPF/CNPJ'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 215
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridTableView
    end
  end
  object gbCadastro: TcxGroupBox
    Left = 96
    Top = 25
    Caption = ' Cadastro de Pessoa: '
    TabOrder = 1
    Height = 121
    Width = 249
    object lblNome: TLabel
      Left = 37
      Top = 55
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lblCPFCNPJ: TLabel
      Left = 16
      Top = 82
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ:'
    end
    object lblID: TLabel
      Left = 53
      Top = 27
      Width = 15
      Height = 13
      Caption = 'ID:'
    end
    object edtNome: TcxTextEdit
      Left = 74
      Top = 51
      TabOrder = 1
      Text = 'edtNome'
      Width = 159
    end
    object edtID: TcxSpinEdit
      Left = 74
      Top = 24
      Properties.CanEdit = False
      Properties.EditFormat = '0'
      Properties.ReadOnly = True
      Properties.SpinButtons.Visible = False
      TabOrder = 0
      Width = 159
    end
    object edtCPFCNPJ: TcxMaskEdit
      Left = 74
      Top = 78
      TabOrder = 2
      Text = 'edtCPFCNPJ'
      Width = 159
    end
  end
  object btnNovo: TcxButton
    Left = 8
    Top = 25
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnEditar: TcxButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Editar'
    Enabled = False
    TabOrder = 3
    OnClick = btnEditarClick
  end
  object btnCancelar: TcxButton
    Left = 8
    Top = 118
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Enabled = False
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object btnGravar: TcxButton
    Left = 8
    Top = 87
    Width = 75
    Height = 25
    Caption = '&Gravar'
    Enabled = False
    TabOrder = 5
    OnClick = btnGravarClick
  end
  object cxRichEdit: TcxRichEdit
    Left = 368
    Top = 27
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    Lines.Strings = (
      'Exemplo b'#225'sico utilizando a classe "TcxCustomDataSource" '
      'da DevExpress para poder manipular uma lista de objetos'
      'demonstrando os Dados Inseridos\Editados na GRID'
      'sem termos que inserir manualmente cada'
      'campo.')
    TabOrder = 6
    Height = 121
    Width = 302
  end
end
