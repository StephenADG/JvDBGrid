unit Unit1;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, DBCtrls, Grids, DBGrids, ExtCtrls, DB, DBClient, StdCtrls, Buttons,
	ComCtrls, MidasLib, Menus, ActnPopup,
	JvExDBGrids, JvDBGrid, JvComponentBase, JvgExportComponents, JvDBGridExport;

type
	TForm1 = class(TForm)
		Panel1: TPanel;
		PanelNavigate: TPanel;
		DBNavigator1: TDBNavigator;
		PanelSize: TPanel;
		PanelCategory: TPanel;
		DBGrid1: TDBGrid;
		Splitter1: TSplitter;
		CDS1: TClientDataSet;
		DS1: TDataSource;
		CategoryPanelGroup1: TCategoryPanelGroup;
		CategoryPanelStyle: TCategoryPanel;
		CategoryPanelOptions: TCategoryPanel;
		CategoryPanelSort: TCategoryPanel;
		RadioGroupDrawingStyle: TRadioGroup;
		CheckBoxUseXPThemes: TCheckBox;
		CategoryPanelExport: TCategoryPanel;
		ButtonXMLExport: TButton;
		JvDBGridXMLExport1: TJvDBGridXMLExport;
		JvgExportXML1: TJvgExportXML;
		CDS1Name: TStringField;
		CDS1Capital: TStringField;
		CDS1Continent: TStringField;
		CDS1Area: TFloatField;
		CDS1Population: TFloatField;
		CDS1Text: TMemoField;
		PopupMenu1: TPopupMenu;
		NItem1: TMenuItem;
		NItem2: TMenuItem;
		PopupMenu2: TPopupMenu;
		MenuTitleItem1: TMenuItem;
		MenuTitleItem2: TMenuItem;
		JvDBGrid1: TJvDBGrid;
		GroupBoxSort: TPanel;
		Label1: TLabel;
		CheckBoxEnableSorting: TCheckBox;
		CheckBoxEnableExcludedFields: TCheckBox;
		EditSortExcludedFields: TEdit;
		ButtonDefaultSorting: TButton;
		GroupBoxOptions: TPanel;
		Panel3: TPanel;
		LabeledEditFixedCols: TLabeledEdit;
		UpDownFixedCols: TUpDown;
		Panel4: TPanel;
		CheckBoxMultiSelect: TCheckBox;
		CheckBoxRowSelect: TCheckBox;
		CheckBoxGridEnabled: TCheckBox;
		CheckBoxShowMemos: TCheckBox;
		CheckBoxOldGridBehavior: TCheckBox;
		CheckBoxIndicator: TCheckBox;
		Splitter2: TSplitter;
		CheckBoxAlwaysShowSelection: TCheckBox;
		CheckBoxSetHighlightColors: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
		procedure DS1DataChange(Sender: TObject; Field: TField);
		procedure FormCreate(Sender: TObject);
		procedure RadioGroupDrawingStyleClick(Sender: TObject);
		procedure UpDownFixedColsClick(Sender: TObject; Button: TUDBtnType);
		procedure CheckBoxMultiSelectClick(Sender: TObject);
		procedure CheckBoxRowSelectClick(Sender: TObject);
		procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
			Field: TField);
		procedure JvDBGrid1TitleBtnDblClick(Sender: TObject; ACol: Integer;
			Field: TField);
		procedure JvDBGrid1TitleClick(Column: TColumn);
		procedure CheckBoxEnableSortingClick(Sender: TObject);
		procedure ButtonDefaultSortingClick(Sender: TObject);
		procedure CheckBoxEnableExcludedFieldsClick(Sender: TObject);
		procedure EditSortExcludedFieldsChange(Sender: TObject);
		procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
			DataCol: Integer; Column: TColumn; State: TGridDrawState);
		procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
			DataCol: Integer; Column: TColumn; State: TGridDrawState);
		procedure CheckBoxUseXPThemesClick(Sender: TObject);
		procedure ButtonXMLExportClick(Sender: TObject);
		procedure CheckBoxGridEnabledClick(Sender: TObject);
		procedure CheckBoxShowMemosClick(Sender: TObject);
		procedure JvDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
		procedure JvDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
		procedure JvDBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
			MousePos: TPoint; var Handled: Boolean);
		procedure JvDBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
			MousePos: TPoint; var Handled: Boolean);
		procedure JvDBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
			WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
		procedure CheckBoxOldGridBehaviorClick(Sender: TObject);
		procedure CheckBoxIndicatorClick(Sender: TObject);
		procedure CheckBoxAlwaysShowSelectionClick(Sender: TObject);
		procedure CheckBoxSetHighlightColorsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	private
		{ Private declarations }
		FInfoID: Integer;
		procedure SetHighlightColors(Colored: Boolean);
		procedure ColorTextField(Sender: TObject; const Rect: TRect;
			DataCol: Integer; Column: TColumn; State: TGridDrawState);
		procedure DisplayInfo(Sender: TObject; const S: string);
	public
		{ Public declarations }
	end;

var
	Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
	PageControl1.ActivePageIndex := 0;
	UpDownFixedCols.Max := CDS1.FieldDefs.Count - 1;

	CDS1.LoadFromFile('country.cds');

	with JvDBGrid1 do
	begin
		UpDownFixedCols.Position := FixedCols;
		RadioGroupDrawingStyle.ItemIndex := Ord(DrawingStyle);
		CheckBoxUseXPThemes.Checked := UseXPThemes;

		CheckBoxSetHighlightColorsClick(CheckBoxSetHighlightColors);

		// ColumnResize := gcrDataSet;
		// SortWith := swClient;
		// RestoreOnSort := False;

	end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	CDS1.SaveToFile('country.cds');
	CDS1.SaveToFile('country.xml', dfXMLUTF8);
end;

procedure TForm1.SetHighlightColors(Colored: Boolean);
begin
	with JvDBGrid1 do
	begin
		if Colored then
		begin
			if DrawingStyle = gdsThemed then
			begin
				HighlightColor := clGradientInactiveCaption;
				// HighlightColor := clWebLightSkyBlue;
				// HighlightColor := clWebLightPink;

			end
			else
			begin
				MultiSelectColor := clWebPink;
				MultiSelectFontColor := clWindowText;

				HighlightColor := clPurple;
				HighlightFontColor := clHighlightText;
			end;
		end
		else
		begin
			HighlightColor := clHighlight;
			HighlightFontColor := clHighlightText;

			MultiSelectColor := clHighlight;
			MultiSelectFontColor := clHighlightText;
		end;
	end;
end;

procedure TForm1.ColorTextField(Sender: TObject; const Rect: TRect;
	DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	if SameText(Column.FieldName, 'Text') then
	begin
		with TDBGrid(Sender) do
		begin
			Canvas.Brush.Color := clTeal;
			Canvas.Font.Style := [fsBold];
			if not(State = [gdSelected, gdFocused]) then
				Canvas.Font.Color := clYellow
			else
				Canvas.Font.Color := clAqua;
		end;
	end;
end;

procedure TForm1.DisplayInfo(Sender: TObject; const S: string);
begin
	if FInfoID = 0 then
		Memo1.Lines.Add('------');
	Inc(FInfoID);
	Memo1.Lines.Add(Format('%d: %s.%s', [FInfoID, Sender.ClassName, S]));
end;

procedure TForm1.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
	DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	{ *** } EXIT;

	ColorTextField(Sender, Rect, DataCol, Column, State);

	{ Default behaviour }
	// TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

	{ Fixed behaviour }
	TJvDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.JvDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
	Field: TField);
begin
	DisplayInfo(Sender, 'TitleBtnClick');
end;

procedure TForm1.JvDBGrid1TitleBtnDblClick(Sender: TObject; ACol: Integer;
	Field: TField);
begin
	DisplayInfo(Sender, 'TitleBtnDbClick');
end;

procedure TForm1.JvDBGrid1TitleClick(Column: TColumn);
begin
	DisplayInfo(Column, 'TitleClick');
end;

procedure TForm1.RadioGroupDrawingStyleClick(Sender: TObject);
begin
	JvDBGrid1.DrawingStyle := TGridDrawingStyle(TRadioGroup(Sender).ItemIndex);
	DBGrid1.DrawingStyle := JvDBGrid1.DrawingStyle;

	CheckBoxUseXPThemes.Checked := JvDBGrid1.UseXPThemes;

	CheckBoxSetHighlightColorsClick(CheckBoxSetHighlightColors);
end;

procedure TForm1.UpDownFixedColsClick(Sender: TObject; Button: TUDBtnType);
begin
	JvDBGrid1.FixedCols := TUpDown(Sender).Position;
end;

procedure TForm1.ButtonXMLExportClick(Sender: TObject);
begin
	JvDBGridXMLExport1.FileName := 'JvDBGridXMLExport.xml';
	JvDBGridXMLExport1.ExportGrid;

	JvgExportXML1.SaveToFileName := 'JvgExportXML.xml';
	JvgExportXML1.Execute;

	CDS1.SaveToFile('ClientDataSet.xml', dfXML);
end;

procedure TForm1.ButtonDefaultSortingClick(Sender: TObject);
begin
	JvDBGrid1.ClearSortedFields;
	CDS1.IndexFieldNames := CDS1.Fields[0].FieldName;
end;

procedure TForm1.CheckBoxAlwaysShowSelectionClick(Sender: TObject);
begin
	if TCheckBox(Sender).Checked then
		JvDBGrid1.Options := JvDBGrid1.Options + [dgAlwaysShowSelection]
	else
		JvDBGrid1.Options := JvDBGrid1.Options - [dgAlwaysShowSelection];

	DBGrid1.Options := JvDBGrid1.Options;
end;

procedure TForm1.CheckBoxEnableExcludedFieldsClick(Sender: TObject);
begin
	if TCheckBox(Sender).Checked then
		JvDBGrid1.SortExcludedFields := Trim(EditSortExcludedFields.Text)
	else
		JvDBGrid1.SortExcludedFields := '';
end;

procedure TForm1.CheckBoxEnableSortingClick(Sender: TObject);
begin
	JvDBGrid1.AutoSort := TCheckBox(Sender).Checked;
end;

procedure TForm1.CheckBoxGridEnabledClick(Sender: TObject);
begin
	JvDBGrid1.Enabled := TCheckBox(Sender).Checked;

	DBGrid1.Enabled := TCheckBox(Sender).Checked;
	DBGrid1.Invalidate;
end;

procedure TForm1.CheckBoxIndicatorClick(Sender: TObject);
begin
	if TCheckBox(Sender).Checked then
		JvDBGrid1.Options := JvDBGrid1.Options + [dgIndicator]
	else
		JvDBGrid1.Options := JvDBGrid1.Options - [dgIndicator];

	DBGrid1.Options := JvDBGrid1.Options;
end;

procedure TForm1.CheckBoxMultiSelectClick(Sender: TObject);
begin
	JvDBGrid1.MultiSelect := TCheckBox(Sender).Checked;
	if TCheckBox(Sender).Checked then
		DBGrid1.Options := DBGrid1.Options + [dgMultiSelect]
	else
		DBGrid1.Options := DBGrid1.Options - [dgMultiSelect];
end;

procedure TForm1.CheckBoxOldGridBehaviorClick(Sender: TObject);
begin
	JvDBGrid1.OldGridBehavior := TCheckBox(Sender).Checked;
end;

procedure TForm1.CheckBoxRowSelectClick(Sender: TObject);
begin
	if TCheckBox(Sender).Checked then
		JvDBGrid1.Options := JvDBGrid1.Options + [dgRowSelect]
	else
	begin
		JvDBGrid1.Options := JvDBGrid1.Options - [dgRowSelect];
		JvDBGrid1.Options := JvDBGrid1.Options + [dgEditing];
	end;

	DBGrid1.Options := JvDBGrid1.Options;
end;

procedure TForm1.CheckBoxSetHighlightColorsClick(Sender: TObject);
begin
	SetHighlightColors(TCheckBox(Sender).Checked);
end;

procedure TForm1.CheckBoxShowMemosClick(Sender: TObject);
begin
	JvDBGrid1.ShowMemos := TCheckBox(Sender).Checked;
end;

procedure TForm1.CheckBoxUseXPThemesClick(Sender: TObject);
begin
	JvDBGrid1.UseXPThemes := TCheckBox(Sender).Checked;
	RadioGroupDrawingStyle.ItemIndex := Ord(JvDBGrid1.DrawingStyle);
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
	DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	{ *** } EXIT;

	ColorTextField(Sender, Rect, DataCol, Column, State);
	TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.JvDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
begin
	DisplayInfo(Sender, 'MouseDown');
end;

procedure TForm1.JvDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
begin
	DisplayInfo(Sender, 'MouseUp');
end;

procedure TForm1.JvDBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
	WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
	DisplayInfo(Sender, 'MouseWheel');
end;

procedure TForm1.JvDBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
	MousePos: TPoint; var Handled: Boolean);
begin
	DisplayInfo(Sender, 'MouseWheelDown');
end;

procedure TForm1.JvDBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
	MousePos: TPoint; var Handled: Boolean);
begin
	DisplayInfo(Sender, 'MouseWheelUp');
end;

procedure TForm1.DS1DataChange(Sender: TObject; Field: TField);
begin
	PanelSize.Caption := IntToStr(TDataSource(Sender).DataSet.RecordCount);
end;

procedure TForm1.EditSortExcludedFieldsChange(Sender: TObject);
begin
	JvDBGrid1.SortExcludedFields := Trim(EditSortExcludedFields.Text);
end;

end.
