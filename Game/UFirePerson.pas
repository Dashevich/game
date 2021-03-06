unit UFirePerson;

interface
uses Forms, ExtCtrls, Windows, Classes, Graphics, Messages, Controls, UPerson;

TYPE

    TFirePerson = class(TPerson)
    private
    protected
    public
      constructor Create; override;
      procedure DrawSelf(Canvas: TCanvas); override;

    end;
implementation
const MaxLvl = 6;

constructor TFirePerson.Create;
begin
  Inherited;
  FBitMap := TBitMap.Create;
  FBitMap.LoadFromFile('Pictures\FirePerson.bmp'); 
  FBitMap.TransparentColor := FBitMap.Canvas.Pixels[0,0];
  FBitMap.Transparent := True;
  FBitMap.TransparentMode := tmFixed;
end;


procedure DrawStat(canvas: TCanvas; value: integer; count: integer);
var X3, Y3, X4, Y4: integer;
begin
  if value = 0 then
  begin
    exit;
  end;
  X3 := 0;
  Y3 := count;
  X4 := value div 3;
  Y4 := count + 1;
  Canvas.rectangle(X3, Y3, X4, Y4);
end;


procedure TFirePerson.DrawSelf(Canvas: TCanvas);
var count: integer;
res : word;
begin
  count := 5;
  inherited;
  Canvas.Pen.Width := 4;
  Canvas.Pen.Color := clRed;
  DrawStat(Canvas, FMagic[mgFire], count);
  count := count + 10;
  Canvas.Pen.Color := clLime;
  DrawStat(Canvas, FMagic[mgKrok], count);
  count := count + 10;
  Canvas.Pen.Color := clMaroon;
  DrawStat(Canvas, FMagic[mgEarth], count);
  count := count + 10;
  Canvas.Pen.Color := clAqua;
  DrawStat(Canvas, FMagic[mgAir], count);
  count := count + 10;
  Canvas.Pen.Color := clDkGray;
  DrawStat(Canvas, FMagic[mgSpace], count);
  count := count + 10;
  Canvas.Pen.Color := clBlue;
  DrawStat(Canvas, FMagic[mgWater], count);
  count := count + 10;
  Canvas.Pen.Color := clGreen;
  DrawStat(Canvas, FMagic[mgWood], count);
end;

INITIALIZATION
  ClassGP[MaxGP] := TFirePerson;
  Inc(MaxGP);
end.

