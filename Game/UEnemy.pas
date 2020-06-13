unit UEnemy;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls;


TYPE
  TEnemy = class(TObject)                      //������� ����� ���������
  private
  protected
    FBitmap : TBitMap;
    FBitMapFile: string;                        // ���� ��� �������� ������ �� ��������
  public
    Owner : TObject;
    procedure DrawSelf(Canvas : TCanvas); virtual;       //������� ���� �� �����
    constructor Create; virtual;               //�������� ��������� (����������� �����������)
  end;
  TClassGameEnemy = class of TEnemy;   //������ �� ����� ���������

var
  ClassGE: array[0..50] of TClassGameEnemy;  //������ ������ �� ������ (50 - � �������)
                                             //����� �� ����� ������� ������ �� ��� ������
                                           //����������, ������� ����� ���������
  MaxGE: integer;                         //��������� ������������� �������
implementation

{ TPerson }

constructor TEnemy.Create;
  begin
  inherited;
end;

procedure TEnemy.DrawSelf(Canvas: TCanvas);
begin
  Canvas.Draw(10,10,FBitMap);
end;

end.
