unit UEnemy;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls;


TYPE
  TEnemy = class(TObject)                      //базовый класс персонажа
  private
  protected
    FBitmap : TBitMap;
    FBitMapFile: string;                        // Поле для хранения ссылки на картинку
  public
    Owner : TObject;
    procedure DrawSelf(Canvas : TCanvas); virtual;       //Отрисуй себя на канве
    constructor Create; virtual;               //создание персонажа (обязательно виртуальная)
  end;
  TClassGameEnemy = class of TEnemy;   //ссылка НА КЛАСС персонажа

var
  ClassGE: array[0..50] of TClassGameEnemy;  //Массив ссылок на классы (50 - с запасом)
                                             //здесь мы будем хранить ссылки на все КЛАССЫ
                                           //персонажей, которые знает программа
  MaxGE: integer;                         //указатель заполненности массива
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
