unit UFinish;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UGameCell, UPerson;

Type
  TFinish = class(TGameCell)
    private
    protected
    public
      property Person : TPerson read FPerson;
      constructor Create(AOwner: TWinControl); override;
    end;



implementation

constructor TFinish.Create;
begin
inherited Create(AOwner);
   FBitMap:= TBitMap.Create;
   FBitMap.LoadFromFile('Pictures\Finish.bmp');
end;

INITIALIZATION
  ClassGFC[0] := TFinish;

end.
