unit UGameMech;
interface
uses Forms, Windows, ExtCtrls, Classes, Graphics, Messages, Controls,
UGameCell, UPerson, UEnemy, UArtefacts, UFireGameCell, UFirePerson, UGameTypes;

TYPE
  TGameMech = class(TPanel)

  private
    FmaxX, FmaxY: integer;
    FPersonX, FPersonY, FFinishY, FFinishX, FEnemyX, FEnemyY, FArtefactX, FArtefactY: integer;
  protected

    FField : array of array of TGameCell;
    FPerson : TPerson;
    FEnemy : TEnemy;
    FArtefact : TArtefact;
  public
    constructor Create(MaxX : integer; MaxY : integer; AOwner: TWinControl); virtual;
    procedure CreatePerson;
    procedure CreateEnemy;
    procedure CreateArtefact;
    procedure PersonOnFinish;
    procedure MovePerson(XY : integer); virtual;
    procedure PersonTakeArtefact;
    procedure MoveEnemy;
    procedure PersonDie(var M: TMessage);  message WM_Person_Died;
    procedure DeathByEnemy;
  end;
implementation

{ TGameMech }
var
     X : TGameCell;
     x1,y1 : integer;
     Field : array [0..100] of array [0..100] of TGameCell;
     P : TPerson;
     E : TEnemy;
     A : TArtefact;
     FireGameCell : TFireGameCell;

constructor TGameMech.Create(MaxX, MaxY: integer; AOwner: TWinControl);
begin
  inherited Create(AOwner);
  Parent := AOwner;
  for x1 := 0 to MaxX do
  begin
    for y1 := 0 to MaxY do
    begin
      Field[x1,y1] := ClassGC[random(MaxGC)].Create(AOwner);
      Field[x1,y1].Top := 70 * (y1);
      Field[x1,y1].Left := 70 * (x1 )+140;
    end;
  end;
  FMaxX := MaxX;
  FMaxY := MaxY;
  x1:= FMaxX ;
  y1:= random(FMaxY);
  Field[x1,y1] := ClassGFC[0].Create(AOwner);
  Field[x1,y1].Top := 70 * (y1);
  Field[x1,y1].Left := 70 * (x1 )+140;
  FFinishX := x1;
  FFinishY := y1;
end;

procedure TGameMech.CreatePerson;
begin
  P := ClassGP[random(MaxGP)].Create;
  FPersonX:= 0;
  FPersonY:= random(FMaxY);
 // Person.Owner := self;
  Field[FPersonX, FPersonY].Person:=P;
end;

procedure TGameMech.PersonDie(var M: TMessage);
begin
  MessageBox(0, 'GAME OVER', 'Message', 0);
  Field[FPersonX,FPersonY].Person := nil;
  FPerson := nil;
end;

procedure TGameMech.CreateArtefact;
begin
  A := ClassGA[random(MaxGA)].Create;
  FArtefactX:= random(FMaxX-2) + 2;
  FArtefactY:= random(FMaxY);
  Field[FArtefactX, FArtefactY].Artefact:=A;
end;

procedure TGameMech.CreateEnemy;
begin
  E := ClassGE[random(MaxGE)].Create;
  FEnemyX:= random(2)+1;
  FEnemyY:= random(FMaxY);
  Field[FEnemyX, FEnemyY].Enemy := E;
end;

procedure TGameMech.PersonOnFinish;
var res : word;
begin
  if (FPersonX = FFinishX) and (FPersonY = FFinishY) then
  begin
    res := MessageBox(handle, PChar('Вы выиграли!'), PChar('Поздравляем!'), MB_OK + MB_ICONINFORMATION);
    Application.Terminate;
    Exit;
  end;
end;

procedure TGameMech.MoveEnemy;
  begin
      if abs(FPersonX - FEnemyX) > abs(FPersonY - FEnemyY) then
      begin
        if FPersonX > FEnemyX then
        begin
          Field[FEnemyX,FEnemyY].Enemy:=nil;
          FEnemyX := FEnemyX + 1;
          Field[FEnemyX,FEnemyY].Enemy:=E;
        end
        else
        begin
          Field[FEnemyX,FEnemyY].Enemy:=nil;
          FEnemyX := FEnemyX - 1;
          Field[FEnemyX,FEnemyY].Enemy:=E;
        end;
      end
      else
      begin
        if FPersonY > FEnemyY then
        begin
          Field[FEnemyX,FEnemyY].Enemy:=nil;
          FEnemyY := FEnemyY + 1;
          Field[FEnemyX,FEnemyY].Enemy:=E;
        end
        else
        begin
          Field[FEnemyX,FEnemyY].Enemy:=nil;
          FEnemyY := FEnemyY - 1;
          Field[FEnemyX,FEnemyY].Enemy:=E;
        end;
      end;
  end;

procedure TGameMech.MovePerson(XY : integer);
begin
  if (XY = 2) and (FPersonY>0)then begin
  Field[FPersonX,FPersonY].Person:=nil;
  FPersonY := FPersonY - 1;
  Field[FPersonX,FPersonY].Person:=P;
  end;
  if (XY = 3) and (FPersonY<FMaxY)then begin
  Field[FPersonX,FPersonY].Person:=nil;
  FPersonY := FPersonY + 1;
  Field[FPersonX,FPersonY].Person:=P;
  end;
  if (XY = 0) and (FPersonX>0)then begin
  Field[FPersonX,FPersonY].Person:=nil;
  FPersonX := FPersonX - 1;
  Field[FPersonX,FPersonY].Person:=P;
  end;
  if (XY = 1) and (FPersonX<FMaxX)then begin
  Field[FPersonX,FPersonY].Person:=nil;
  FPersonX := FPersonX + 1;
  Field[FPersonX,FPersonY].Person:=P;
  end;
  Field[FPersonX, FPersonY].ChangeMagic;
end;

procedure TGameMech.PersonTakeArtefact;
begin
if (FPersonX = FArtefactX) and (FPersonY = FArtefactY) then
  begin
  Field[FPersonX,FPersonY].Person:=nil;
  FPersonX := (FFinishX - FPersonX) div 2 + FPersonX;
  FPersonY := (FFinishY - FPersonY) div 2 + FPersonY;
  Field[FPersonX, FPersonY].Person:=P;
 
  end;
end;


procedure TGameMech.DeathByEnemy;
var res: word;
begin
if (FPersonX = FEnemyX) and (FPersonY = FEnemyY) then
  begin
    Field[FPersonX,FPersonY].Person:=nil;
    res := MessageBox(handle, PChar('Вы проиграли('), PChar('Вас убили!'), MB_OK + MB_ICONINFORMATION);
    Application.Terminate;
    Exit;
  end;
end;

end.

