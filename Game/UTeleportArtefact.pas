unit UTeleportArtefact;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls, UArtefacts;

TYPE

    TTeleportArtefact = class(TArtefact)
    private
    protected
    public
      constructor Create; override;
    end;
implementation

constructor TTeleportArtefact.Create;
begin
  Inherited;
  FBitMap := TBitMap.Create;
  FBitMap.LoadFromFile('Pictures\Teleport.bmp');
  FBitMap.TransparentColor := FBitMap.Canvas.Pixels[0,0];
  FBitMap.Transparent := True;
  FBitMap.TransparentMode := tmFixed;
end;



INITIALIZATION
  ClassGA[MaxGA] := TTeleportArtefact;
  Inc(MaxGA);

end.
