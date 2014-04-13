================================================
Argonet Development Group
================================================

This code merges JVDBUltimGrid into JvDBGrid, 
also introducing new features and bug fixes.

Developing platform: Delphi 2010 - Windows 7.


------------------------------------------------
New features
------------------------------------------------
- property OldGridBehavior	{ if false it behaves like TJvDBUltimGrid, if true it behaves like the old TJvDBGrid }
- DrawCellHighlight for gdsThemed DrawingStyle
- Highlight colors (properties HighlightColor, HighlightFontColor)
- MultiSelect colors (properties MultiSelectColor, MultiSelectFontColor)
- function ColumnByFieldName
- Double clicking column resizing for empty cells, toggles cell ColWidth between DefaultColWidth and a minimum length of 12 pixels.


------------------------------------------------
Fixed:
------------------------------------------------
- Mantis 5609: At design-time (style gdsGradient), title buttons are raised.
- Mantis 5610: At run-time (style gdsThemed), vertical separator line on title cells is not displayed.
- Mantis 5663: Highlight behaviour.


================================================

	

 
