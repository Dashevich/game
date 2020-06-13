unit UfrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGameCell, UGameMech, UFireGameCell, StdCtrls, ExtCtrls, AppEvnts,
  Math, UEarthGameCell, UFinish, UEnemy, UEnemyVenom, UArtefacts;// UWaterGameCell,
//  UAirGameCell, USpaceGameCell, StdCtrls, UKrokGameCell;
                                                                                                          
type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  GameMech: TGameMech;
  k : integer;
implementation


const N = 10; M = 10;

{$R *.dfm}
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var count: integer;
begin
  count := 0;
  if Key = 65 then
  begin
    GameMech.MovePerson(0);
    count := 1;
  end;
  if (Key = 68) then
  begin
    GameMech.MovePerson(1);
    count := 1;
  end;
  if (Key = 87) then
  begin
    GameMech.MovePerson(2);
    count := 1;
  end;
  if (Key = 83) then
  begin
    GameMech.MovePerson(3);
    count := 1;
  end;
  if count = 1 then
    begin
    GameMech.PersonOnFinish;
    if k mod 2 <> 0 then
    GameMech.MoveEnemy;
    GameMech.DeathByEnemy;
    GameMech.PersonTakeArtefact;

    count := 0;
    end;
    k := k + 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GameMech := TGameMech.Create(N, M, self);
  GameMech.Left := 1000;
  GameMech.Width := 1000;
  GameMech.Height := 1000;
  GameMech.CreatePerson();
  GameMech.CreateEnemy();
  GameMech.CreateArtefact();
end;

end.

