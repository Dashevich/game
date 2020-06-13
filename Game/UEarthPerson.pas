unit UEarthPerson;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls, UPerson;

TYPE
    TEarthPerson = class (TPerson)
      private
      protected
      public
        constructor Create; override;
        procedure DrawSelf(Canvas: TCanvas); override;
    end;

implementation

{ TPerson }

constructor TEarthPerson.create;
begin
  inherited;
  FBitMap := TBitMap.Create;
  FBitMap.LoadFromFile ('Pictures\EarthPerson.bmp');
  FBitMap.TransparentColor := FBitMap.Canvas.Pixels[0,0];
  FBitMap.Transparent := True;
  FBitMap.TransparentMode := tmFixed;
end;

procedure TEarthPerson.DrawSelf(Canvas: TCanvas);
begin
  inherited;
  Canvas.Draw(10, 10, FBitMap);
end;

end.
 