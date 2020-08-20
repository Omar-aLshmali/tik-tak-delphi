unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

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
    spieler1: TLabel;
    spieler2: TLabel;
    unent: TLabel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;

    procedure Button12Click(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  ButtonArray : Array[1..9] of TButton;
 zug, spieler, s1,s2, unentschieden : Integer;
      function HatGewonnen():Boolean ;
    { Private-Deklarationen }
  public

    { Public-Deklarationen }
  end;

var



  Form1: TForm1;



implementation


{$R *.dfm}

procedure TForm1.Button12Click(Sender: TObject);

begin
Close();

end;

procedure TForm1.btnClick(Sender: TObject);
var
button:TButton;

begin

       button  := sender as TButton;


      if spieler = 0 then
      begin
     button.Caption:='X';
     spieler:=1;
     Inc(zug);
        end

       else
      if spieler =1 then
      begin
      button.Caption:='O';
     spieler :=0;
    Inc(zug);
      end  ;

     if HatGewonnen()  then
        begin
         Showmessage('Gewonnen');
        end
        else
        if zug =9 then
        begin
          Showmessage('Unentschieden');
        end


end;

function TForm1.HatGewonnen():Boolean ;
   var
   m,n,i:Integer;
begin
   for i:=0 to 8 do

   if( ButtonArray[i].Caption = ButtonArray[i+1].Caption) and (ButtonArray[i].Caption =ButtonArray[i+2].Caption) and (ButtonArray[i].Caption<>'' )then
   begin
   result := true;
   exit
   end ;
   i:=i+3;

      for n:=0 to 3 do

     if (ButtonArray[n].Caption = ButtonArray[n+3].Caption )and  (ButtonArray[n].Caption = ButtonArray[n+6].Caption) and (ButtonArray[i].Caption<>'') then

     begin
      result := true;
      exit
      end;
      n:=n+1;

            for  m := 0 to 2 do

            if (ButtonArray[m].Caption = ButtonArray[m+4-m].Caption )and( ButtonArray[m].Caption = ButtonArray[10-m-2].Caption) and( ButtonArray[m].Caption <> '')then
               begin
      result := true;
      exit
      end ;
      m :=m+2;


   result := false;


end;
procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin

  for    i := low (ButtonArray) to high (ButtonArray)  do
  ButtonArray[i] := FindComponent('btn'+inttoStr(i))as TButton


end;

end.
