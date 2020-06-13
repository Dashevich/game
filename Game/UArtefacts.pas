unit UArtefacts;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls;


TYPE
  TArtefact = class(TObject)                      //������� ����� ���������
  private
  protected
    FBitmap : TBitMap;
    FBitMapFile: string;                        // ���� ��� �������� ������ �� ��������
  public
    Owner : TObject;
    procedure DrawSelf(Canvas : TCanvas); virtual;       //������� ���� �� �����
    constructor Create; virtual;               //�������� ��������� (����������� �����������)
  end;
  TClassGameArtefact = class of TArtefact;   //������ �� ����� ���������

var
  ClassGA: array[0..50] of TClassGameArtefact;  //������ ������ �� ������ (50 - � �������)
                                             //����� �� ����� ������� ������ �� ��� ������
                                           //����������, ������� ����� ���������
  MaxGA: integer;                         //��������� ������������� �������
implementation

{ TPerson }

constructor TArtefact.Create;
  begin
  inherited;
end;

procedure TArtefact.DrawSelf(Canvas: TCanvas);
begin
  Canvas.Draw(10,10,FBitMap);
end;

end.
