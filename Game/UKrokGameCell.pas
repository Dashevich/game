unit UKrokGameCell;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UGameCell;

Type
  TKrokGameCell = class(TGameCell)
    private
    protected
    public
      constructor Create(AOwner: TWinControl); override;
    end;

  TKrok1GameCell = class(TKrokGameCell)
    private
    protected
    public
      constructor Create(AOwner: TWinControl); override;
    end;

  TKrok2GameCell = class(TKrok1GameCell)
    private
    protected
    public
      constructor Create(AOwner: TWinControl); override;
    end;



implementation


constructor TKrokGameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
   FBitMap:= TBitMap.Create;
   FBitMap.LoadFromFile('Pictures/Ozero1.bmp');
end;

constructor TKrok1GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\Ozero2.bmp');

end;

constructor TKrok2GameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);
  FBitMap := TBitmap.Create;
  FBitMap.LoadFromFile('Pictures\Ozero3.bmp');
end;



INITIALIZATION
  ClassGC[MaxGC] := TKrokGameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TKrok1GameCell;
  Inc(MaxGC);
  ClassGC[MaxGC] := TKrok2GameCell;
  Inc(MaxGC);
end.




