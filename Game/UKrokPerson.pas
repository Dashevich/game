unit UKrokPerson;

interface
uses UGameCell,UPerson, Graphics;

TYPE

    TKrokPerson = class(TPerson)
    private

    protected

    public
      constructor Create; override;
    

    end;
  

implementation



constructor TKrokPerson.Create;
begin
  Inherited;

  FBitMap := TBitMap.Create;
  FBitMap.LoadFromFile('Pictures\KrokPerson.bmp');  //????????? ? ???? 
                                                  //???????? ?? ??????? ?????
  FBitMap.TransparentColor := FBitMap.Canvas.Pixels[0,0];
  FBitMap.Transparent := True;
  FBitMap.TransparentMode := tmFixed;

end;


INITIALIZATION
 // ClassGP[MaxGP] := TKrokPerson;
  //Inc(MaxGP);

end.
