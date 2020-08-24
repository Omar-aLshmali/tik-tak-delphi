unit Unit1;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    play1: TLabel;
    play2: TLabel;
    draw_result: TLabel;
    New_play: TButton;
    New_begin: TButton;
    End_play: TButton;
    begin_play: TLabel;

    procedure End_playClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure New_playClick(Sender: TObject);
    procedure New_beginClick(Sender: TObject);
  private
    ButtonArray: array[1..9] of TButton;
    playerInput, player, player1, player2, draw: Integer;
    function IsWinn(): Boolean;
    procedure NewPlay();
    procedure IsDraw();
    procedure RandomBegin();
    procedure PcInputNomral();
    procedure PcInputHard();
    procedure PcInput(Sender: TObject);
    { Private-Deklarationen }
  public

    { Public-Deklarationen }
  end;

var

  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.New_playClick(Sender: TObject);
begin

  NewPlay();
end;

// Reset everything to zero and start a new game

procedure TForm1.New_beginClick(Sender: TObject);
var
  i: integer;
begin
  playerInput := 0;
  player1 := 0;
  player2 := 0;
  draw := 0;
  play1.Caption := 'Du : ' + inttostr(player1);
  play2.Caption := 'Gegner : ' + inttostr(player2);
  draw_result.Caption := 'Uneuntschieden : ' + inttostr(draw);

  for i := low(ButtonArray) to high(ButtonArray) do
    ButtonArray[i].Caption := '';

end;

// Play end

procedure TForm1.End_playClick(Sender: TObject);

begin
  Close();

end;

procedure TForm1.btnClick(Sender: TObject);
var
  button: TButton;

begin

  button := sender as TButton;

  if (player = 0) and (button.Caption = '') then
  begin
    button.Caption := 'X';
    player := 1;
    Inc(playerInput);
  end;

  if IsWinn() then

  begin
    if button.Caption = 'X' then
    begin
      Showmessage('Du hast gewonnen');

      Inc(player1);
      NewPlay();
    end

  end;

  if (playerInput = 9) and (IsWinn() <> true) then
  begin
    inc(draw);
    IsDraw();

  end;

  PcInput(sender);
end;

// Check method for profit opportunities

function TForm1.IsWinn(): Boolean;
var
  m, n, i: Integer;
begin

  i := 1;

  //  Vertical profit opportunities
  while i < 9 do

  begin
    if (ButtonArray[i].Caption <> '') and (ButtonArray[i].Caption = ButtonArray[i + 1].Caption) and
      (ButtonArray[i].Caption = ButtonArray[i + 2].Caption) then
    begin
      result := true;
      exit
    end;

    i := i + 3;
  end;

  // Horizontal profit opportunities
  n := 1;
  while n < 4 do

  begin

    if (ButtonArray[n].Caption <> '') and (ButtonArray[n].Caption = ButtonArray[n + 3].Caption) and
      (ButtonArray[n].Caption = ButtonArray[n + 6].Caption) then

    begin
      result := true;
      exit
    end;
    n := n + 1;
  end;

  // Mid-profit opportunities
  m := 1;
  while m < 4 do
  begin

    if (ButtonArray[m].Caption <> '') and (ButtonArray[m].Caption = ButtonArray[m + 5 - m].Caption) and
      (ButtonArray[m].Caption = ButtonArray[10 - m].Caption) then
    begin
      result := true;
      exit
    end;

    m := m + 2;
  end;

  result := false;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  RandomBegin();

  for i := low(ButtonArray) to high(ButtonArray) do
    ButtonArray[i] := FindComponent('btn' + inttoStr(i)) as TButton

end;

// got the result and repeat the round

procedure TForm1.NewPlay();
var
  i: Integer;

begin

  playerInput := 0;

  draw_result.Caption := 'Unentschieden : ' + inttostr(draw);
  play1.Caption := 'Du : ' + inttostr(player1);
  play2.Caption := 'Gegner : ' + inttostr(player2);

  for i := low(ButtonArray) to high(ButtonArray) do
    ButtonArray[i].Caption := '';

  RandomBegin();
end;

// when nobody wins

procedure TForm1.IsDraw();

begin
  NewPlay();
  Showmessage('Unentschieden');

end;

procedure TForm1.RandomBegin();
var
  randomPlayer: Integer;
begin
  randomPlayer := Random(2);
  if RandomPlayer = 0 then
  begin
    begin_play.Caption := 'Du f�ngst an';
    player := 0;
  end
  else
  begin
    begin_play.Caption := ' PC f�ngt an';
    player := 1;
  end;
  PcInputNomral();
end;

procedure TForm1.PcInputHard();

begin


end;
procedure TForm1.PcInputNomral();
var
  i, j, inputRandom: Integer;
begin
  for j := low(ButtonArray) to high(ButtonArray) do
  begin
    inputRandom := Random(10);
    for i := low(ButtonArray) to high(ButtonArray) do
    begin
      if (inputRandom = i) and (ButtonArray[i].Caption = '') and (player = 1) then
      begin
        buttonArray[i].Caption := 'O';
        inc(playerinput);
        player := player - 1;

      end;

    end;
    if (player = 0) then
    begin
      break;
    end;

  end;

end;

procedure TForm1.PcInput(Sender: TObject);
var
  button: TButton;
begin
  button := sender as TButton;
  PcInputNomral();
  if IsWinn() then

  begin

    Showmessage('Gegner hat gewonnen');
    Inc(player2);
    NewPlay();

  end

  else if (playerInput = 9) and (IsWinn() <> true) then
  begin
    inc(draw);
    IsDraw();
  end;
end;

end.

