unit UGameCell;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls, UPerson, UEnemy, UArtefacts;


TYPE

    TGameCell = class (TPanel)    //������� ����� ������� ������
    private
    

    protected
      FBitmap : TBitMap;                // ���� ��� �������� ������ �� ��������
      FBitMapFile : string;
      FPerson : TPerson;
      FEnemy : TEnemy;
      FArtefact : TArtefact;

      procedure LoadBitmap; virtual;
      procedure SetPerson(const Value: TPerson); virtual;
      procedure SetEnemy(const Value: TEnemy); virtual;
      procedure SetArtefact(const Value: TArtefact); virtual;

    public

      procedure Paint; override;
      constructor Create(AOwner: TWinControl); virtual;    //����� �����������
      procedure ChangeMagic; virtual;
      property Person : TPerson read FPerson write SetPerson;
      property Enemy : TEnemy read FEnemy write SetEnemy;
      property Artefact : TArtefact read FArtefact write SetArtefact;

  end;

//--------------------����� ������ �� ������ --------------

    TClassGameCell = class of TGameCell;  // ��� - ������ �� ����� (�� �� ������!)
                                          //����� ������ ����� ��������� ��� ��
                                          //TGameCell ��� � �� ����� �� ���
                                          // �����������
var
  ClassGC: array[0..50] of TClassGameCell;  //������ ������ �� ������ (50 - � �������)
  ClassGFC: array[0..1] of TClassGameCell;   //����� �� ����� ������� ������ �� ��� ������
                                             //�����, ������� ����� ���������
                                             
  MaxGC: integer;                         //��������� ������������� �������
//---------------------------------------------------------

  

implementation
{ TGameCell }

constructor TGameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);

  Width := 70;    //������� ����� ������ ��� �������� ����� ������ ���� ������
  Height := 70;
  Parent := AOwner;
  BevelOuter := bvNone;
  Caption := '';

end;

procedure TGameCell.ChangeMagic;
var i: integer;
    Magics: array[1..4] of TMagic;
begin
  if FPerson <> nil then
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
        if FPerson = nil then break;
      end;
  end;
  Paint;
end;

procedure TGameCell.LoadBitmap;
begin
  FBitMap := TBitMap.Create;
  FBitMap.LoadFromFile(FBitMapFile);
end;



procedure TGameCell.Paint;
begin
  inherited;            //������� �������� ���������� ���������

  Canvas.Draw(1,1,FBitMap);  //������ ������ ���� ��������
                              //��������� 1 ������ ����� ����� ���������� 
                              //���� �������

  If FPerson <> nil then FPerson.DrawSelf(Canvas);
  If FEnemy <> nil then FEnemy.DrawSelf(Canvas);
  If FArtefact <> nil then FArtefact.DrawSelf(Canvas);
end;

procedure TGameCell.SetPerson(const Value: TPerson);
begin
  FPerson := Value;
  Paint;
  
end;
procedure TGameCell.SetEnemy(const Value: TEnemy);
begin
  FEnemy := Value;
  Paint;

end;

procedure TGameCell.SetArtefact(const Value: TArtefact);
begin
  FArtefact := Value;
  Paint;

end;




//--------------------����� ������ �� ������ --------------
// ������ ������� ����������� ����� ������ ��� �������� ���������
// ��� �� ���������� ��������� ����
// ��� ��������� ��� ��������� ������ ������ �� ������ (����� � ��)
// ��� ���������� ��������� ���� ������ ��� ����� ��������.
// ������ ������ ����� �������������� � ����� ������, ������ ����������� ���������������
// �� ������ � ������


INITIALIZATION
//  ClassGC[MaxGC] := TGameCell;  //� ������ ����������� ������� ClassGC � �������� MaxGC
                                //���������� ������ �� ����� �� ����� ������ - TGameCell
//  Inc(MaxGC);   //����������� ������, ��������� ����� ��������� ������.
end.
