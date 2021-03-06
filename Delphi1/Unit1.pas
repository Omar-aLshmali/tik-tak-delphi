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
  StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls;

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
    CheckBox1: TCheckBox;
    play: TButton;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    ColorDialog1: TColorDialog;
    Button1: TButton;
    BitBtn1: TBitBtn;

    procedure End_playClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure New_playClick(Sender: TObject);
    procedure New_beginClick(Sender: TObject);
    procedure playClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);


  private
    ButtonArray: array [1 .. 9] of TButton;

    playerInput, player, player1, player2, draw: Integer;
    function IsWinn(): Boolean;
    procedure NewPlay();
    procedure IsDraw();
    procedure RandomBegin();
    procedure PcInputNormal();
    procedure PcInputHard();
    procedure PcInput(Sender: TObject);
    procedure PlayHelp(i: Integer);
    function HorizontalProfit(): Boolean;
    function VertikalProfit(): Boolean;
    function MidProfit(): Boolean;
    procedure Tow_o();
    procedure Tow_X();
    procedure ImportantPcHardInput();

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
  PcInput(Sender);
end;

// Reset everything to zero and start a new game
procedure TForm1.New_beginClick(Sender: TObject);
var
  i: Integer;
begin
  playerInput := 0;
  player1 := 0;
  player2 := 0;
  draw := 0;
  play1.Caption := 'Du : ' + inttostr(player1);
  play2.Caption := 'Gegner : ' + inttostr(player2);
  draw_result.Caption := 'Uneuntschieden : ' + inttostr(draw);

  for i := low(ButtonArray) to high(ButtonArray) do
  begin
    ButtonArray[i].Caption := '';
  end;
  RandomBegin();
  PcInput(Sender);
end;
// Play end
procedure TForm1.Button1Click(Sender: TObject);
begin
if ColorDialog1.Execute=true then
 form1.Color:=ColorDialog1.Color;
end;

procedure TForm1.End_playClick(Sender: TObject);

begin
  Close();
end;
// Random Function ,who starts
procedure TForm1.RadioGroup1Click(Sender: TObject);
   var
    i:integer;
     RadioButton :  TRadioGroup;
   const Farbe :array[0..3] of TColor=(Clwhite,Clgreen,Clred,Clyellow);
begin
       RadioButton:= sender as TRadioGroup;
    for I := 0 to 3 do
    begin
    RadioButton.Color := Farbe[RadioGroup1.ItemIndex];
      form1.Color:=RadioButton.Color ;

    end  ;
end;

procedure TForm1.RandomBegin();
var
  randomPlayer: Integer;
begin
  randomPlayer := Random(2);
  if randomPlayer = 0 then
  begin
    begin_play.Caption := 'Du f�ngst an';
    player := 1;
  end
  else
  begin
    begin_play.Caption := ' PC f�ngt an';
    player := 0;
  end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
BitBtn1.Caption:='Deaktiviert';

if Timer1.Enabled=false then
begin
Timer1.Enabled:=true;
BitBtn1.Caption:='Aktiviert';

end
else
 if Timer1.Enabled=True then
 Timer1.Enabled:=false;
end;

procedure TForm1.btnClick(Sender: TObject);
var
  button: TButton;

begin

  button := Sender as TButton;

  if (player = 1) and (button.Caption = '') then
  begin
    button.Caption := 'X';
    player := 0;
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

  end

  else if (playerInput = 9) and (IsWinn() <> true) then
  begin
    Inc(draw);
    IsDraw();

  end;

  PcInput(Sender);
end;

// Check method for profit opportunities

function TForm1.IsWinn(): Boolean;
begin

  if (VertikalProfit()) or (HorizontalProfit()) or (MidProfit()) then
  begin
    exit(true)
  end;
  result := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;

begin

  RandomBegin();

  for i := low(ButtonArray) to high(ButtonArray) do
  begin
    ButtonArray[i] := FindComponent('btn' + inttostr(i)) as TButton
  end;

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

  Showmessage('Unentschieden');
  NewPlay();
end;

// Pc input difficult option
procedure TForm1.PcInputHard();
begin
  // Positions that increase profit
  if (playerInput = 1) and (player = 0) and (ButtonArray[5].Caption = '') then
  begin
    PlayHelp(5);
  end;
  Tow_O();
  Tow_X();
  ImportantPcHardInput();
end;

// Pc input simple option
procedure TForm1.PcInputNormal();
var
  i, j, inputRandom: Integer;
begin
  for j := 1 to 100 do
  begin
    inputRandom := Random(10);
    for i := low(ButtonArray) to high(ButtonArray) do
    begin
      if (inputRandom = i) and (ButtonArray[i].Caption = '') and (player = 0)
      then
      begin
        ButtonArray[i].Caption := 'O';
        Inc(playerInput);
        Inc(player);

      end;

    end;
    if (player = 1) then
    begin
      break;
    end;

  end;

end;

procedure TForm1.playClick(Sender: TObject);
begin
  PcInput(Sender);
end;

// Pc input options difficult and simple
procedure TForm1.PcInput(Sender: TObject);
var
  button: TButton;
begin
  button := Sender as TButton;
  if CheckBox1.checked then
  begin
    PcInputHard();
  end
  else
  begin
    PcInputNormal();
  end;

  if IsWinn() then

  begin

    Showmessage('Gegner hat gewonnen');
    Inc(player2);
    NewPlay();

  end

  else if (playerInput = 9) and (IsWinn() <> true) then
  begin
    Inc(draw);
    IsDraw();
  end;
end;

procedure TForm1.PlayHelp(i: Integer);
begin
  ButtonArray[i].Caption := 'O';
  Inc(player);
  Inc(playerInput);
end;

function TForm1.HorizontalProfit(): Boolean;
var
  n: Integer;
begin

  n := 1;
  while n < 4 do
  begin

    if (ButtonArray[n].Caption <> '') and
      (ButtonArray[n].Caption = ButtonArray[n + 3].Caption) and
      (ButtonArray[n].Caption = ButtonArray[n + 6].Caption) then

    begin
      exit(true)
    end;
    n := n + 1;
  end;
  result := false;
end;

// Vertical profit opportunities
function TForm1.VertikalProfit(): Boolean;
var
  i: Integer;
begin

  i := 1;
  while i < 9 do

  begin
    if (ButtonArray[i].Caption <> '') and
      (ButtonArray[i].Caption = ButtonArray[i + 1].Caption) and
      (ButtonArray[i].Caption = ButtonArray[i + 2].Caption) then
    begin
      exit(true)
    end;
    i := i + 3;
  end;
  result := false;
end;

// Mid-profit opportunities
function TForm1.MidProfit(): Boolean;
var
  m: Integer;
begin
  m := 1;
  while m < 4 do
  begin
    if (ButtonArray[m].Caption <> '') and
      (ButtonArray[m].Caption = ButtonArray[m + 5 - m].Caption) and
      (ButtonArray[m].Caption = ButtonArray[10 - m].Caption) then
    begin
      exit(true)
    end;
    m := m + 2;
  end;
  result := false;
end;
// If there are two O , insert a third
 procedure TForm1.Timer1Timer(Sender: TObject);
 var i:integer;
begin
      i:= RadioGroup1.ItemIndex;
      if i<3  then i:=i+1
      else i:=0;
      RadioGroup1.ItemIndex:=i;



end;

procedure TForm1.Tow_o();
 begin

       if ((ButtonArray[1].Caption = '') and (ButtonArray[2].Caption = 'O') and (ButtonArray[3].Caption = 'O')and(player=0))
       or ((ButtonArray[1].Caption = '') and (ButtonArray[5].Caption = 'O') and (ButtonArray[9].Caption = 'O')and(player=0))
       or ((ButtonArray[1].Caption = '') and (ButtonArray[7].Caption = 'O') and (ButtonArray[4].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(1);
  end
  else if ((ButtonArray[6].Caption = '') and (ButtonArray[3].Caption = 'O') and (ButtonArray[9].Caption = 'O')and(player=0))
       or ((ButtonArray[6].Caption = '') and (ButtonArray[4].Caption = 'O') and (ButtonArray[5].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(6);
  end
  else if ((ButtonArray[2].Caption = '') and (ButtonArray[8].Caption = 'O') and(ButtonArray[5].Caption = 'O')and(player=0))
       or ((ButtonArray[2].Caption = '') and (ButtonArray[1].Caption = 'O') and(ButtonArray[3].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(2);
  end
  else if ((ButtonArray[3].Caption = '') and (ButtonArray[7].Caption = 'O') and (ButtonArray[5].Caption = 'O')and(player=0))
       or ((ButtonArray[3].Caption = '') and (ButtonArray[2].Caption = 'O') and (ButtonArray[1].Caption = 'O')and(player=0))
       or ((ButtonArray[3].Caption = '') and (ButtonArray[9].Caption = 'O') and (ButtonArray[6].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(3);
  end
  else if ((ButtonArray[8].Caption = '') and (ButtonArray[5].Caption = 'O') and (ButtonArray[2].Caption = 'O')and(player=0))
       or ((ButtonArray[8].Caption = '') and (ButtonArray[7].Caption = 'O') and (ButtonArray[9].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(8);
  end
  else if ((ButtonArray[9].Caption = '') and (ButtonArray[8].Caption = 'O') and (ButtonArray[7].Caption = 'O')and(player=0))
     or   ((ButtonArray[9].Caption = '') and (ButtonArray[3].Caption = 'O') and (ButtonArray[6].Caption = 'O')and(player=0))
     or   ((ButtonArray[9].Caption = '') and (ButtonArray[1].Caption = 'O') and (ButtonArray[5].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(9);
  end
  else if ((ButtonArray[5].Caption = '') and (ButtonArray[2].Caption = 'O') and (ButtonArray[8].Caption = 'O')and(player=0))
       or ((ButtonArray[5].Caption = '') and (ButtonArray[1].Caption = 'O') and (ButtonArray[9].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(5);
  end
  else if ((ButtonArray[4].Caption = '') and (ButtonArray[1].Caption = 'O') and (ButtonArray[7].Caption = 'O')and(player=0))
       or ((ButtonArray[4].Caption = '') and (ButtonArray[5].Caption = 'O') and (ButtonArray[6].Caption = 'O')and(player=0)) then
  begin
    PlayHelp(4);
  end;
 end;

 // If there are two X , insert a third
 procedure TForm1.Tow_X();
 begin

       if ((ButtonArray[2].Caption = '') and (ButtonArray[8].Caption = 'X') and (ButtonArray[5].Caption = 'X')and(player=0))
       or ((ButtonArray[2].Caption = '') and (ButtonArray[1].Caption = 'X') and (ButtonArray[3].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(2);
  end
  else if ((ButtonArray[8].Caption = '') and (ButtonArray[5].Caption = 'X') and (ButtonArray[2].Caption = 'X')and(player=0))
       or ((ButtonArray[8].Caption = '') and (ButtonArray[7].Caption = 'X') and (ButtonArray[9].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(8);
  end
  else if ((ButtonArray[9].Caption = '') and (ButtonArray[8].Caption = 'X') and (ButtonArray[7].Caption = 'X')and(player=0))
       or ((ButtonArray[9].Caption = '') and (ButtonArray[3].Caption = 'X') and (ButtonArray[6].Caption = 'X')and(player=0))
       or ((ButtonArray[9].Caption = '') and (ButtonArray[1].Caption = 'X') and (ButtonArray[5].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(9);
  end
  else if ((ButtonArray[1].Caption = '') and (ButtonArray[2].Caption = 'X') and (ButtonArray[3].Caption = 'X')and(player=0))
       or ((ButtonArray[1].Caption = '') and (ButtonArray[5].Caption = 'X') and (ButtonArray[9].Caption = 'X')and(player=0))
       or ((ButtonArray[1].Caption = '') and (ButtonArray[7].Caption = 'X') and (ButtonArray[4].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(1);
  end
  else if ((ButtonArray[3].Caption = '') and (ButtonArray[7].Caption = 'X') and (ButtonArray[5].Caption = 'X')and(player=0))
       or ((ButtonArray[3].Caption = '') and (ButtonArray[2].Caption = 'X') and (ButtonArray[1].Caption = 'X')and(player=0))
       or ((ButtonArray[3].Caption = '') and (ButtonArray[9].Caption = 'X') and (ButtonArray[6].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(3);
  end
  else if ((ButtonArray[5].Caption = '') and (ButtonArray[2].Caption = 'X') and (ButtonArray[8].Caption = 'X')and(player=0))
       or ((ButtonArray[5].Caption = '') and (ButtonArray[1].Caption = 'X') and (ButtonArray[9].Caption = 'X')and(player=0))
       or ((ButtonArray[5].Caption = '') and (ButtonArray[4].Caption = 'X') and (ButtonArray[6].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(5);
  end
  else if ((ButtonArray[4].Caption = '') and (ButtonArray[5].Caption = 'X') and (ButtonArray[6].Caption = 'X')and(player=0))
       or ((ButtonArray[4].Caption = '') and (ButtonArray[1].Caption = 'X') and (ButtonArray[7].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(4);
  end
  else if ((ButtonArray[6].Caption = '') and (ButtonArray[3].Caption = 'X') and (ButtonArray[9].Caption = 'X')and(player=0))
       or ((ButtonArray[6].Caption = '') and (ButtonArray[4].Caption = 'X') and (ButtonArray[5].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(6);
  end
  else if ((ButtonArray[7].Caption = '') and (ButtonArray[1].Caption = 'X') and (ButtonArray[4].Caption = 'X')and(player=0))
       or ((ButtonArray[7].Caption = '') and (ButtonArray[8].Caption = 'X') and (ButtonArray[9].Caption = 'X')and(player=0))
       or ((ButtonArray[7].Caption = '') and (ButtonArray[5].Caption = 'X')and  (ButtonArray[3].Caption = 'X')and(player=0)) then
  begin
    PlayHelp(7);
  end ;
 end;

 // important input positions

 procedure TForm1.ImportantPcHardInput();
 begin

  if (ButtonArray[5].Caption = 'O') and (player = 0) and
    (ButtonArray[9].Caption = 'X') and (ButtonArray[6].Caption = '') then
  begin
    PlayHelp(6);
  end
   else if (ButtonArray[5].Caption = 'O') and (player = 0) and
    (ButtonArray[4].Caption = 'X') and (ButtonArray[7].Caption = '') then
  begin
    PlayHelp(7);
  end
  else if (ButtonArray[5].Caption = 'O') and (player = 0) and
    (ButtonArray[7].Caption = 'X') and (ButtonArray[4].Caption = '') then
  begin
    PlayHelp(4);
  end

  else if (player = 0) and (ButtonArray[3].Caption = '') then
  begin
    PlayHelp(3);
  end
  else if (player = 0) and (ButtonArray[7].Caption = '') then
  begin
    PlayHelp(7);
  end

  // Random position
  else
  begin
    PcInputNormal();
  end;
 end;
end.
