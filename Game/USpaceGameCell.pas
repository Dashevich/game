unit USpaceGameCell;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UGameCell;

Type
  TSpaceGameCell = class(TGameCell)
    public
      constructor Create(AOwner: TWinControl); override;
    private
      FBitMap: TBitMap;
    protected
      procedure Paint; override;
  end;

  TSpace1GameCell = class(TSpaceGameCell)
    public
      constructor Create(AOwner: TWinControl); override;
    private
      FBitMap: TBitMap;
    protected
      procedure Paint; override;
    end;

    TSpace2GameCell = class(TSpace1GameCell)
    public
      constructor Create(AOwner: TWinControl); override;
    private
      FBitMap: TBitMap;
    protected
      procedure Paint; override;
    end;
implementation

{ TKletka }

constructor TSpaceGameCell.Create(AOwner: TWinControl);
begin
  inherited;
  FBitMap := TBitMap.Create();
  FBitMap.LoadFromFile('.\Pictures\Space1.bmp');
end;

procedure TSpaceGameCell.Paint;
begin
  inherited;
  Canvas.Brush.Color := RGB(30, 40, 34);
  Canvas.Pen.Color := clBlack;
  Canvas.Pen.Width := 1;
  Canvas.Rectangle(0, 0, Width, Height);
  Canvas.Draw(0, 0, FBitMap);
end;

constructor TSpace1GameCell.Create(AOwner: TWinControl);
begin
  inherited;
  FBitMap := TBitMap.Create();
  FBitMap.LoadFromFile('.\Pictures\Space2.bmp');
end;

procedure TSpace1GameCell.Paint;
begin
  inherited;
  Canvas.Brush.Color := RGB(255, 187, 0);
  Canvas.Pen.Color := RGB(255, 187, 0);
  Canvas.Pen.Width := 1;
  Canvas.Ellipse(Width div 4, Height Div 4, (Width * 3) div 4, (Height * 3) div 4);
  Canvas.Draw(0, 0, FBitMap);
end;

{ TSpace2GameCell }

constructor TSpace2GameCell.Create(AOwner: TWinControl);
begin
  inherited;
  FBitMap := TBitMap.Create();
  FBitMap.LoadFromFile('.\Pictures\Space3.bmp');
end;

procedure TSpace2GameCell.Paint;
begin
  inherited;
  Canvas.Draw(0, 0, FBitMap);
end;

INITIALIZATION
  ClassGC[MaxGC] := TSpaceGameCell;
  inc(MaxGC);
  ClassGC[MaxGC] := TSpace1GameCell;
  inc(MaxGC);
  ClassGC[MaxGC] := TSpace2GameCell;
  inc(MaxGC);

end.
