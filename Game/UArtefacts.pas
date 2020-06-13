unit UArtefacts;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls;


TYPE
  TArtefact = class(TObject)                      //базовый класс персонажа
  private
  protected
    FBitmap : TBitMap;
    FBitMapFile: string;                        // Поле для хранения ссылки на картинку
  public
    Owner : TObject;
    procedure DrawSelf(Canvas : TCanvas); virtual;       //Отрисуй себя на канве
    constructor Create; virtual;               //создание персонажа (обязательно виртуальная)
  end;
  TClassGameArtefact = class of TArtefact;   //ссылка НА КЛАСС персонажа

var
  ClassGA: array[0..50] of TClassGameArtefact;  //Массив ссылок на классы (50 - с запасом)
                                             //здесь мы будем хранить ссылки на все КЛАССЫ
                                           //персонажей, которые знает программа
  MaxGA: integer;                         //указатель заполненности массива
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
