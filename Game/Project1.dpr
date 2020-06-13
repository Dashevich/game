program Project1;

uses
  Forms,
  UfrmMain in 'UfrmMain.pas' {Form1},
  UFireGameCell in 'UFireGameCell.pas',
  UKrokGameCell in 'UKrokGameCell.pas',
  UPerson in 'UPerson.pas',
  UFirePerson in 'UFirePerson.pas',
  UKrokPerson in 'UKrokPerson.pas',
  UEarthPerson in 'UEarthPerson.pas',
  UGameMech in 'UGameMech.pas',
  UFinish in 'UFinish.pas',
  UEnemy in 'UEnemy.pas',
  UEnemyVenom in 'UEnemyVenom.pas',
  UArtefacts in 'UArtefacts.pas',
  UTeleportArtefact in 'UTeleportArtefact.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
