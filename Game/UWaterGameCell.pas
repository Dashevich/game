unit UWaterGameCell;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UPerson, UGameCell;

Type
  TWaterGameCell = class(TGameCell)
  private
  protected
  public
      constructor Create(AOwner: TWinControl); override;
  end;

Type
  TWater1GameCell = class(TWaterGameCell)
  private
  protected
  public
      constructor Create(AOwner: TWinControl); override;
    { Public declarations }
  end;

Type
  TWater2GameCell = class(TWater1GameCell)
  private
  protected
  public
      constructor Create(AOwner: TWinControl); override;
  end;


implementation

{ TGameCell }

constructor TWaterGameCell.Create(AOwner: TWinControl);
begin
  inherited;
  FBitMapFile := 'Pictures\Water1.bmp';
  LoadBitMap;
end;

{ TWater1GameCell }

constructor TWater1GameCell.Create(AOwner: TWinControl);
begin
  inherited;
  FBitMapFile := 'Pictures\Water2.bmp';
  LoadBitMap;
end;

{ TWater2GameCell }

constructor TWater2GameCell.Create(AOwner: TWinControl);
begin
  inherited;
  FBitMapFile := 'Pictures\Water3.bmp';
  LoadBitMap;
end;

INITIALIZATION
  ClassGC[MaxGC] := TWaterGameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TWater1GameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TWater2GameCell;
  Inc(MaxGC);
end.

