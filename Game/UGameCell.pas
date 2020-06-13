unit UGameCell;

interface
uses ExtCtrls, Classes, Graphics, Messages, Controls, UPerson, UEnemy, UArtefacts;


TYPE

    TGameCell = class (TPanel)    //базовый класс Игровая Клетка
    private
    

    protected
      FBitmap : TBitMap;                // Поле для хранения ссылки на картинку
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
      constructor Create(AOwner: TWinControl); virtual;    //Новый конструктор
      procedure ChangeMagic; virtual;
      property Person : TPerson read FPerson write SetPerson;
      property Enemy : TEnemy read FEnemy write SetEnemy;
      property Artefact : TArtefact read FArtefact write SetArtefact;

  end;

//--------------------МАГИЯ ССЫЛОК НА КЛАССЫ --------------

    TClassGameCell = class of TGameCell;  // Тип - ссылка на КЛАСС (не на объект!)
                                          //такая ссылка может указывать как на
                                          //TGameCell так и на любой из его
                                          // НАСЛЕДНИКОВ
var
  ClassGC: array[0..50] of TClassGameCell;  //Массив ссылок на классы (50 - с запасом)
  ClassGFC: array[0..1] of TClassGameCell;   //здесь мы будем хранить ссылки на все КЛАССЫ
                                             //ячеек, которые знает программа
                                             
  MaxGC: integer;                         //указатель заполненности массива
//---------------------------------------------------------

  

implementation
{ TGameCell }

constructor TGameCell.Create(AOwner: TWinControl);
begin
  inherited Create(AOwner);

  Width := 70;    //Базовый класс ячейка при создании сразу меняет свой размер
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
  inherited;            //сначала вызываем стандарную отрисовку

  Canvas.Draw(1,1,FBitMap);  //рисуем поверх свою картинку
                              //отступаем 1 пиксел чтобы между клеточками 
                              //была граница

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




//--------------------МАГИЯ ССЫЛОК НА КЛАССЫ --------------
// Данная сейкция выполняется самой первой при загрузке программы
// ещё до выполнения основного кода
// это позволяет нам заполнить массив ССЫЛОК НА КЛАССЫ (ячеек и тп)
// При выполнении основного кода массив уже будет заполнен.
// Данная секция может присутствовать в любом модуле, секции выполняются последовательно
// от модуля к модулю


INITIALIZATION
//  ClassGC[MaxGC] := TGameCell;  //В ячейку глобального массива ClassGC с индексом MaxGC
                                //записываем ссылку на класс из этого модуля - TGameCell
//  Inc(MaxGC);   //увеличиваем индекс, следующий класс запишется дальше.
end.
