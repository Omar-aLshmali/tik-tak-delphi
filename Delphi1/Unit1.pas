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
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
  ButtonArray : Array[1..9] of TButton;
 zug, spieler, s1,s2, unentschieden : Integer;
      function HatGewonnen():Boolean ;
       procedure NeuesSpiel();
    { Private-Deklarationen }
  public

    { Public-Deklarationen }
  end;

var



  Form1: TForm1;



implementation


{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
begin
NeuesSpiel();
end;

procedure TForm1.Button11Click(Sender: TObject);
var
i: integer;
begin
 zug :=0;

        spieler1.Caption:='Du : '+'0';
        spieler2.Caption:='Gegner : '+'0';
    for    i := low (ButtonArray) to high (ButtonArray)  do
   ButtonArray[i].Caption := '';


end;

procedure TForm1.Button12Click(Sender: TObject);

begin
Close();

end;

procedure TForm1.btnClick(Sender: TObject);
var
button:TButton;

begin


       button  := sender as TButton;


      if (spieler = 0) and (button.Caption='')then
      begin
       button.Caption:='X';
       spieler:=1;
       Inc(zug);
      end

       else
      if (spieler =1 ) and (button.Caption='' )then
      begin
      button.Caption:='O';
     spieler :=0;
    Inc(zug);
      end  ;



        if HatGewonnen() then


        begin
        if button.Caption='X' then
         begin
               Showmessage('Du hast Gewonnen');

              Inc(s1);
              NeuesSpiel();
         end

           else
        begin
          Showmessage('Gegner hast Gewonnen');
               Inc(s2);
               neuesSpiel();
        end;

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


i:=1;


  while i<9  do

   begin
   if(ButtonArray[i].Caption<>'' ) and  (ButtonArray[i].Caption = ButtonArray[i+1].Caption) and ( ButtonArray[i].Caption = ButtonArray[i+2].Caption)then
   begin
   result := true;
     exit
   end ;

      i:=i+3;
     end;




    n:=1;
      while n<4  do

   begin

     if  (ButtonArray[n].Caption<>'') and   (ButtonArray[n].Caption = ButtonArray[n+3].Caption )and  (ButtonArray[n].Caption = ButtonArray[n+6].Caption)  then

     begin
      result := true;
      exit
      end;
      n:=n+1;
   end;



      m:=1;
      while m<4 do
   begin

       if ( ButtonArray[m].Caption <> '') and (ButtonArray[m].Caption = ButtonArray[m+5-m].Caption )and( ButtonArray[m].Caption = ButtonArray[10-m].Caption) then
      begin
      result := true;
      exit
      end ;

      m :=m+2;
   end;



 result := false;


end;
procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin


   for    i := low (ButtonArray) to high (ButtonArray)  do
   ButtonArray[i] := FindComponent('btn'+inttoStr(i))as TButton


end;
 procedure TForm1.NeuesSpiel();
   var i : Integer;
 begin
       zug :=0;

        spieler1.Caption:='Du : '+s1.ToString();
        spieler2.Caption:='Gegner : '+s2.ToString();
    for    i := low (ButtonArray) to high (ButtonArray)  do
   ButtonArray[i].Caption := '';

 end;
end.
