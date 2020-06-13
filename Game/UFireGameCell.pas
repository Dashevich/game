unit UFireGameCell;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UGameCell, UPerson, UFirePerson;

Type
  TFireGameCell = class(TGameCell)
    private
    protected
    public
      //property Person : TPerson read FPerson;
      constructor Create(AOwner: TWinControl); override;
      procedure ChangeMagic; override;
    end;

  TFire1GameCell = class(TFireGameCell)
    private
    protected
    public
      constructor Create(AOwner: TWinControl); override;
    end;

  TFire2GameCell = class(TFire1GameCell)
    private
    protected
    public
      constructor Create(AOwner: TWinControl); override;
    end;

implementation

constructor TFireGameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
   FBitMap:= TBitMap.Create;
   FBitMap.LoadFromFile('Pictures\FewFire.bmp');
end;

constructor TFire1GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\MiddleFire.bmp');

end;

constructor TFire2GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\MoreFire.bmp');
end;

procedure TFireGameCell.ChangeMagic;
var i: integer;
    mg: TMagic;
    Magics: array[1..4] of TMagic;
begin
  if FPerson <> nil then
  begin
    if FPerson is TFirePerson then
    begin
      for mg := low(TMagic) to high(TMagic) do
      begin
        if FPerson.Magic[mg] * 2 > 100 then
          FPerson.Magic[mg] := 100
        else
          FPerson.Magic[mg] := FPerson.Magic[mg] * 2;
      end;
    end
    else
    begin
      Magics[1] := TMagic(Random(integer(high(TMagic))));
      repeat
        Magics[2] := TMagic(Random(integer(high(TMagic))))
      until Magics[2] <> Magics[1];
      repeat
        Magics[3] := TMagic(Random(integer(high(TMagic))))
      until (Magics[3] <> Magics[1]) and (Magics[3] <> Magics[2]);
      repeat
        Magics[4] := TMagic(Random(integer(high(TMagic))))
      until (Magics[4] = Magics[1]) and (Magics[4] <> Magics[2]) and (Magics[4] <> Magics[3]);
      for i := 1 to 4 do
      begin
        if FPerson.Magic[Magics[i]] - 15 < 0 then
          FPerson.Magic[Magics[i]] := 0
        else
          FPerson.Magic[Magics[i]] := FPerson.Magic[Magics[i]] - 15;
      end;
    end;
  end;
  Paint;

end;


INITIALIZATION
  ClassGC[MaxGC] := TFireGameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TFire1GameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TFire2GameCell;
  Inc(MaxGC);
end.


