object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Demo JVCL - Compares TJvDBGrid vs TDBGrid'
  ClientHeight = 705
  ClientWidth = 1106
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 925
    Height = 705
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 658
    object Splitter1: TSplitter
      Left = 0
      Top = 510
      Width = 925
      Height = 2
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = 7
      ExplicitTop = 457
    end
    object Splitter2: TSplitter
      Left = 0
      Top = 235
      Width = 925
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 250
    end
    object PanelNavigate: TPanel
      Left = 0
      Top = 482
      Width = 925
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 429
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 649
        Height = 28
        DataSource = DS1
        Align = alLeft
        TabOrder = 0
      end
      object PanelSize: TPanel
        AlignWithMargins = True
        Left = 650
        Top = 1
        Width = 110
        Height = 26
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        BevelKind = bkFlat
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 450
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 238
      Width = 925
      Height = 244
      Align = alBottom
      DataSource = DS1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      PopupMenu = PopupMenu1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Default'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnMouseDown = JvDBGrid1MouseDown
      OnMouseUp = JvDBGrid1MouseUp
      OnMouseWheel = JvDBGrid1MouseWheel
      OnMouseWheelDown = JvDBGrid1MouseWheelDown
      OnMouseWheelUp = JvDBGrid1MouseWheelUp
    end
    object JvDBGrid1: TJvDBGrid
      Left = 0
      Top = 0
      Width = 925
      Height = 235
      Align = alClient
      DataSource = DS1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Default'
      TitleFont.Style = []
      OnDrawColumnCell = JvDBGrid1DrawColumnCell
      OnMouseDown = JvDBGrid1MouseDown
      OnMouseUp = JvDBGrid1MouseUp
      OnMouseWheel = JvDBGrid1MouseWheel
      OnMouseWheelDown = JvDBGrid1MouseWheelDown
      OnMouseWheelUp = JvDBGrid1MouseWheelUp
      OnTitleClick = JvDBGrid1TitleClick
      FixedCols = 2
      MultiSelect = True
      TitleButtons = True
      TitleButtonAllowMove = True
      OnTitleBtnClick = JvDBGrid1TitleBtnClick
      OnTitleBtnDblClick = JvDBGrid1TitleBtnDblClick
      AlternateRowColor = clInfoBk
      AlternateRowFontColor = clMaroon
      TitleArrow = True
      TitlePopup = PopupMenu2
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      ColumnResize = gcrDataSet
      EditControls = <>
      RowsHeight = 21
      TitleRowHeight = 21
      SortWith = swClient
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Capital'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Continent'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Area'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Population'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Text'
          Width = 123
          Visible = True
        end>
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 512
      Width = 925
      Height = 193
      ActivePage = TabSheet2
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 465
      object TabSheet1: TTabSheet
        Caption = 'Info'
        ExplicitWidth = 281
        object Memo1: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 911
          Height = 155
          TabStop = False
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            '*** This demo compares the new JvDBGrid vs DBGrid. ***')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 512
          ExplicitWidth = 925
          ExplicitHeight = 146
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Text Data'
        ImageIndex = 1
        object DBMemo1: TDBMemo
          Left = 0
          Top = 0
          Width = 917
          Height = 161
          Align = alClient
          DataField = 'Text'
          DataSource = DS1
          TabOrder = 0
          ExplicitLeft = 56
          ExplicitTop = 32
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
    end
  end
  object PanelCategory: TPanel
    Left = 925
    Top = 0
    Width = 181
    Height = 705
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 658
    object CategoryPanelGroup1: TCategoryPanelGroup
      Left = 0
      Top = 0
      Width = 181
      Height = 705
      VertScrollBar.Tracking = True
      Align = alClient
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -13
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = []
      TabOrder = 0
      ExplicitHeight = 658
      object CategoryPanelExport: TCategoryPanel
        Top = 634
        Height = 69
        Caption = 'Export'
        TabOrder = 3
        ExplicitWidth = 158
        object ButtonXMLExport: TButton
          AlignWithMargins = True
          Left = 9
          Top = 3
          Width = 159
          Height = 26
          Margins.Left = 9
          Margins.Right = 9
          Align = alTop
          Caption = 'XML Export'
          TabOrder = 0
          OnClick = ButtonXMLExportClick
          ExplicitWidth = 138
        end
      end
      object CategoryPanelSort: TCategoryPanel
        Top = 464
        Height = 170
        Caption = 'Column sorting'
        Color = clMoneyGreen
        TabOrder = 2
        ExplicitWidth = 158
        object GroupBoxSort: TPanel
          Left = 0
          Top = 0
          Width = 177
          Height = 144
          Align = alClient
          ParentColor = True
          TabOrder = 0
          ExplicitWidth = 156
          object Label1: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 52
            Width = 163
            Height = 15
            Margins.Left = 9
            Align = alTop
            Caption = 'Excluded Fields'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Default'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            ExplicitWidth = 84
          end
          object CheckBoxEnableSorting: TCheckBox
            AlignWithMargins = True
            Left = 10
            Top = 4
            Width = 163
            Height = 18
            Margins.Left = 9
            Align = alTop
            Caption = 'Enable Sorting'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBoxEnableSortingClick
            ExplicitWidth = 142
          end
          object CheckBoxEnableExcludedFields: TCheckBox
            AlignWithMargins = True
            Left = 10
            Top = 28
            Width = 163
            Height = 18
            Margins.Left = 9
            Align = alTop
            Caption = 'Enable Excluded'
            TabOrder = 1
            OnClick = CheckBoxEnableExcludedFieldsClick
            ExplicitWidth = 142
          end
          object EditSortExcludedFields: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 73
            Width = 157
            Height = 25
            Hint = 'Input field names separated by (,) or (;) character'
            Margins.Left = 9
            Margins.Right = 9
            Align = alTop
            TabOrder = 2
            Text = 'Area,Population'
            OnChange = EditSortExcludedFieldsChange
            ExplicitWidth = 136
          end
          object ButtonDefaultSorting: TButton
            AlignWithMargins = True
            Left = 10
            Top = 104
            Width = 157
            Height = 26
            Hint = 'Reset sorting to default'
            Margins.Left = 9
            Margins.Right = 9
            Align = alTop
            Caption = 'Default Sorting'
            TabOrder = 3
            OnClick = ButtonDefaultSortingClick
            ExplicitWidth = 136
          end
        end
      end
      object CategoryPanelOptions: TCategoryPanel
        Top = 154
        Height = 310
        Caption = 'Options'
        Color = clCream
        TabOrder = 1
        ExplicitWidth = 158
        object GroupBoxOptions: TPanel
          Left = 0
          Top = 0
          Width = 177
          Height = 284
          Align = alClient
          ParentColor = True
          TabOrder = 0
          ExplicitWidth = 156
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 175
            Height = 51
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitWidth = 154
            object LabeledEditFixedCols: TLabeledEdit
              Left = 9
              Top = 24
              Width = 40
              Height = 25
              EditLabel.Width = 55
              EditLabel.Height = 17
              EditLabel.Caption = 'FixedCols'
              NumbersOnly = True
              ReadOnly = True
              TabOrder = 0
              Text = '0'
            end
            object UpDownFixedCols: TUpDown
              Left = 49
              Top = 24
              Width = 20
              Height = 25
              Associate = LabeledEditFixedCols
              TabOrder = 1
              OnClick = UpDownFixedColsClick
            end
          end
          object Panel4: TPanel
            Left = 1
            Top = 52
            Width = 175
            Height = 231
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitWidth = 154
            object CheckBoxMultiSelect: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'MultiSelect'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBoxMultiSelectClick
              ExplicitWidth = 148
            end
            object CheckBoxRowSelect: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 27
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'RowSelect'
              TabOrder = 1
              OnClick = CheckBoxRowSelectClick
              ExplicitWidth = 148
            end
            object CheckBoxGridEnabled: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 51
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'Grid Enabled'
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = CheckBoxGridEnabledClick
              ExplicitWidth = 148
            end
            object CheckBoxShowMemos: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 75
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'Show Memos'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = CheckBoxShowMemosClick
              ExplicitWidth = 148
            end
            object CheckBoxOldGridBehavior: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 171
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'Old Grid Behavior'
              TabOrder = 7
              OnClick = CheckBoxOldGridBehaviorClick
              ExplicitTop = 147
              ExplicitWidth = 148
            end
            object CheckBoxIndicator: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 99
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'Indicator'
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = CheckBoxIndicatorClick
              ExplicitWidth = 148
            end
            object CheckBoxAlwaysShowSelection: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 123
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'Always Show Selection'
              TabOrder = 5
              OnClick = CheckBoxAlwaysShowSelectionClick
              ExplicitWidth = 148
            end
            object CheckBoxSetHighlightColors: TCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 147
              Width = 169
              Height = 18
              Align = alTop
              Caption = 'Set Highlight Colors'
              Checked = True
              State = cbChecked
              TabOrder = 6
              OnClick = CheckBoxSetHighlightColorsClick
              ExplicitWidth = 148
            end
          end
        end
      end
      object CategoryPanelStyle: TCategoryPanel
        Top = 0
        Height = 154
        Caption = 'Drawing style'
        Color = clGradientInactiveCaption
        TabOrder = 0
        ExplicitWidth = 158
        object RadioGroupDrawingStyle: TRadioGroup
          Left = 0
          Top = 0
          Width = 177
          Height = 95
          Align = alTop
          DoubleBuffered = False
          ItemIndex = 0
          Items.Strings = (
            'gdsClassic'
            'gdsThemed'
            'gdsGradient')
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = RadioGroupDrawingStyleClick
          ExplicitWidth = 156
        end
        object CheckBoxUseXPThemes: TCheckBox
          Left = 9
          Top = 103
          Width = 138
          Height = 18
          Caption = 'UseXPThemes'
          TabOrder = 1
          OnClick = CheckBoxUseXPThemesClick
        end
      end
    end
  end
  object CDS1: TClientDataSet
    Active = True
    Aggregates = <>
    FileName = 'country.cds'
    FieldDefs = <
      item
        Name = 'Name'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Capital'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Continent'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Area'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'Population'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'Text'
        Attributes = [faUnNamed]
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Name'
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 584
    Data = {
      160700009619E0BD010000001800000006001300000003000000A401044E616D
      650100490010000100055749445448020002001800074361706974616C010049
      001000010005574944544802000200180009436F6E74696E656E740100490010
      000100055749445448020002001800044172656108000400100000000A506F70
      756C6174696F6E0800040010000000045465787404004B001000010007535542
      54595045020049000500546578740001000A4348414E47455F4C4F4704008200
      3900000001000000000000000400000002000000000000000400000003000000
      0000000004000000040000000000000004000000050000000000000004000000
      0600000000000000040000000700000000000000040000000800000000000000
      040000000900000000000000040000000A00000000000000040000000B000000
      00000000040000000C00000000000000040000000D0000000000000004000000
      0E00000000000000040000000F00000000000000040000001000000000000000
      0400000011000000000000000400000012000000000000000400000013000000
      010000000800000005000009417267656E74696E610C4275656E6F7320416972
      65730D536F75746820416D6572696361000000806B31454100000030BECD7E41
      0E00000054686973206973206D656D6F203104000007426F6C69766961064C61
      2050617A0D536F75746820416D6572696361000000004FC3304100000000E8D8
      5B410E00000054686973206973206D656D6F2032040000064272617A696C0842
      726173696C69610D536F75746820416D657269636100000080DB3B6041000000
      00D8EDA1410E00000054686973206973206D656D6F20330400000643616E6164
      61064F74746177610D4E6F72746820416D6572696361000000602A0763410000
      0000BA4579410E00000054686973206973206D656D6F2034040000054368696C
      650853616E746961676F0D536F75746820416D6572696361000000009E192741
      00000000502D69410E00000054686973206973206D656D6F203504000008436F
      6C6F6D626961064261676F74610D536F75746820416D657269636100000000DB
      60314100000000A4787F410E00000054686973206973206D656D6F2036040000
      044375626106486176616E610D4E6F72746820416D657269636100000000C0F5
      FB4000000000C83764410E00000054686973206973206D656D6F203704000007
      45637561646F7205517569746F0D536F75746820416D65726963610000000038
      CD1B4100000000C83764410E00000054686973206973206D656D6F2038040000
      0B456C2053616C7661646F720C53616E2053616C7661646F720D4E6F72746820
      416D6572696361000000004060D44000000000C83754410E0000005468697320
      6973206D656D6F203904000006477579616E610A47656F726765746F776E0D53
      6F75746820416D657269636100000000C83D0A4100000000006A28410F000000
      54686973206973206D656D6F203130040000074A616D61696361084B696E6773
      746F6E0D4E6F72746820416D6572696361000000000050C64000000000D01243
      410F00000054686973206973206D656D6F203131040000064D657869636F0B4D
      657869636F20436974790D4E6F72746820416D6572696361000000004C043E41
      00000000B71F95410F00000054686973206973206D656D6F203132040000094E
      6963617261677561074D616E616775610D4E6F72746820416D65726963610000
      0000C0F700410000000030C14D410F00000054686973206973206D656D6F2031
      33040000085061726167756179084173756E63696F6E0D536F75746820416D65
      7269636100000000C0D0184100000000C8C651410F0000005468697320697320
      6D656D6F2031340400000450657275044C696D610D536F75746820416D657269
      6361000000005F9C334100000000709974410F00000054686973206973206D65
      6D6F20313504000018556E6974656420537461746573206F6620416D65726963
      610A57617368696E67746F6E0D4E6F72746820416D657269636100000040D7DB
      614100000000FBB4AD410F00000054686973206973206D656D6F203136040000
      07557275677561790A4D6F6E7465766964656F0D536F75746820416D65726963
      6100000000608005410000000048E746410F00000054686973206973206D656D
      6F2031370400000956656E657A75656C6107436172616361730D536F75746820
      416D6572696361000000005ED52B410000000092C972410F0000005468697320
      6973206D656D6F2031380C000009417267656E74696E610C4275656E6F732041
      697265730D536F75746820416D6572696361000000806B31454100000030BECD
      7E415400000054686973206973206D656D6F206C696E6520310D0A5468697320
      6973206D656D6F206C696E6520320D0A54686973206973206D656D6F206C696E
      6520330D0A54686973206973206D656D6F206C696E6520340D0A}
    object CDS1Name: TStringField
      FieldName = 'Name'
      Size = 24
    end
    object CDS1Capital: TStringField
      FieldName = 'Capital'
      Size = 24
    end
    object CDS1Continent: TStringField
      FieldName = 'Continent'
      Size = 24
    end
    object CDS1Area: TFloatField
      FieldName = 'Area'
    end
    object CDS1Population: TFloatField
      FieldName = 'Population'
    end
    object CDS1Text: TMemoField
      FieldName = 'Text'
      BlobType = ftMemo
    end
  end
  object DS1: TDataSource
    DataSet = CDS1
    OnDataChange = DS1DataChange
    Left = 208
    Top = 584
  end
  object JvDBGridXMLExport1: TJvDBGridXMLExport
    Grid = JvDBGrid1
    Left = 496
    Top = 568
  end
  object JvgExportXML1: TJvgExportXML
    DataSet = CDS1
    Captions = fecDisplayLabels
    TransliterateRusToEng = False
    MaxFieldSize = 0
    Left = 496
    Top = 616
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 568
    object NItem1: TMenuItem
      Caption = 'Item 1'
    end
    object NItem2: TMenuItem
      Caption = 'Item 2'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 368
    Top = 616
    object MenuTitleItem1: TMenuItem
      Caption = 'Title Item 1'
    end
    object MenuTitleItem2: TMenuItem
      Caption = 'Title Item 2'
    end
  end
end
