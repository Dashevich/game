unit UEarthGameCell;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UGameCell;

Type
  TEarthGameCell = class(TGameCell)
  private
    { Private declarations }
  protected

  public
      constructor Create(AOwner: TWinControl); override;
    { Public declarations }
  end;

Type
  TEarth1GameCell = class(TEarthGameCell)
  private
    { Private declarations }
  protected
  public
    constructor Create(AOwner: TWinControl); override;
    { Public declarations }
  end;

Type
  TEarth2GameCell = class(TEarth1GameCell)
  private
    { Private declarations }
  protected
  public
    constructor Create(AOwner: TWinControl); override;
    { Public declarations }
  end;

implementation

{ TGameCell }


constructor TEarthGameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMapFile := 'Pictures\Earth3.bmp';
  loadBitMap;
end;

{ TEarth1GameCell }

constructor TEarth1GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMapFile := 'Pictures\Earth1.bmp';
  loadBitMap;
end;

{ TEarth2GameCell }

constructor TEarth2GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMapFile := 'Pictures\Earth2.bmp';
  loadBitMap;
end;

INITIALIZATION
  ClassGC[MaxGC] := TEarthGameCell;
  inc(MaxGC);
  ClassGC[MaxGC] := TEarth1GameCell;
  inc(MaxGC);
  ClassGC[MaxGC] := TEarth2GameCell;
  inc(MaxGC);
end.

