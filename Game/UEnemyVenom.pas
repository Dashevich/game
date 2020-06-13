unit UEnemyVenom;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls, UEnemy;

TYPE

    TVenomEnemy = class(TEnemy)
    private
    protected
    public
      constructor Create; override;
    end;
implementation

constructor TVenomEnemy.Create;
begin
  Inherited;
  FBitMap := TBitMap.Create;
  FBitMap.LoadFromFile('Pictures\Venom.bmp');
  FBitMap.TransparentColor := FBitMap.Canvas.Pixels[0,0];
  FBitMap.Transparent := True;
  FBitMap.TransparentMode := tmFixed;
end;



INITIALIZATION
  ClassGE[MaxGE] := TVenomEnemy;
  Inc(MaxGE);

end.