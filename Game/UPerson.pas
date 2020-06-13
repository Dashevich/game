unit UPerson;

interface
uses Forms, ExtCtrls, Windows, Classes, Graphics, Messages, Controls, UGameTypes;

{
0 - �����
1- �����
2 - ����
3 - ������
4 - ������
5 - ���
6 - ���� (����)
}

TYPE
  TMagic = (mgFire,mgEarth,mgWater,mgSpace,mgAir,mgWood,mgKrok);
  TPerson = class(TObject)                      //������� ����� ���������
  private
    function GetMagic(Index: TMagic): integer; virtual;
    procedure SetMagic(Index: TMagic; const Value: integer); virtual;
  protected
    FBitmap : TBitMap;
    FBitMapFile: string;                        // ���� ��� �������� ������ �� ��������
    FMagic : array [TMagic] of integer;           //������ ��� �������� �����
    FPerson : TPerson;
  public
     
    Owner : TObject;
    procedure DrawSelf(Canvas : TCanvas); virtual;       //������� ���� �� �����
    constructor Create; virtual;               //�������� ��������� (����������� �����������)
    property Magic [ Index : TMagic] : integer read GetMagic write SetMagic;
  end;
  TClassGamePerson = class of TPerson;   //������ �� ����� ���������  

var
  ClassGP: array[0..50] of TClassGamePerson;  //������ ������ �� ������ (50 - � �������)
  Person : TPerson;                                          //����� �� ����� ������� ������ �� ��� ������
                                           //����������, ������� ����� ���������
  MaxGP: integer;                         //��������� ������������� �������
implementation

{ TPerson }

constructor TPerson.Create;
   var i: TMagic;
  begin
  inherited;
  for i := mgFire to mgKrok do
  begin
    FMagic[i] := 100;
  end;
end;

procedure TPerson.DrawSelf(Canvas: TCanvas);
begin
  Canvas.Draw(10,10,FBitMap);
end;

function TPerson.GetMagic(Index: TMagic): integer;
begin
  Result := FMagic[Index];
end;

procedure TPerson.SetMagic(Index: TMagic; const Value: integer);
var res: word;
 M: TMessage;
begin
  FMagic[Index] := Value;
  if (Owner <> nil) and (FMagic[Index] <= 10) then
  begin
  //ShowMessage(' ');
    Person.Free;
    Person := nil;
    res := MessageBox(Application.Handle, PChar('�� ������'), PChar('���� ��������'), MB_OK + MB_ICONINFORMATION);
    M.Msg := WM_Person_Died;
    Owner.Dispatch(res);
  end;
end;

end.



