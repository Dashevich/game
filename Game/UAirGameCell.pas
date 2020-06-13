unit UAirGameCell;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UGameCell;

Type
  TAirGameCell = class(TGameCell)
  private
    FBitMap: TBitMap;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TWinControl); override;
  end;


  TAir1GameCell = class(TAirGameCell)
  private

  protected

  public
    constructor Create(AOwner: TWinControl); override;
  end;


  TAir2GameCell = class(TAir1GameCell)
  private

  protected

  public
    constructor Create(AOwner: TWinControl); override;
  end;

implementation

constructor TAirGameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\Air1.bmp');
  Paint;
end;

procedure TAirGameCell.Paint;
begin
  inherited;
  Canvas.Draw(0, 0, FBitMap);
end;

constructor TAir1GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\Air2.bmp');
  Paint;
end;

constructor TAir2GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\Air3.bmp');
  Paint;
end;

INITIALIZATION
  ClassGC[MaxGC] := TAirGameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TAir1GameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TAir2GameCell;
  Inc(MaxGC);
end.
