unit Conversation_Money;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, frxClass;

type
  TForm1 = class(TForm)
    Pan_all: TPanel;
    Pane_top: TPanel;
    GridPanel1: TGridPanel;
    Label2: TLabel;
    Image1: TImage;
    GridPanel3: TGridPanel;
    Label1: TLabel;
    GridPanel4: TGridPanel;
    Label4: TLabel;
    GridPanel5: TGridPanel;
    Label5: TLabel;
    GridPanel6: TGridPanel;
    edt_nomber: TEdit;
    Label6: TLabel;
    Image6: TImage;
    Labe_arab: TLabel;
    Labe_french: TLabel;
    Labe_english: TLabel;
    frxReport1: TfrxReport;
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
   


  private
    { DÈclarations privÈes }
  public
    { DÈclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.Image1Click(Sender: TObject);
var AR,EN,FR : TfrxMemoView ;
begin
    AR := TfrxMemoView(frxReport1.FindObject('memo4'));
    AR.Memo.Text := Labe_arab.Caption ;
   //--------
    FR := TfrxMemoView(frxReport1.FindObject('memo5'));
    FR.Memo.Text := Labe_french.Caption ;
    //--------
    EN := TfrxMemoView(frxReport1.FindObject('memo6'));
    EN.Memo.Text := Labe_english.Caption ;
     //--------

   frxReport1.ShowReport;
 end;

procedure TForm1.Label1Click(Sender: TObject);
var chaine1,chaine:string;
    p,nombre,q,DEC:integer;
    N,n1:real;
procedure decimale(var p3:integer);
begin
  if p3=10 then chaine:=chaine+ ' Ten';
  if p3=11 then chaine:=chaine+ ' Eleven';
  if p3=12 then chaine:=chaine+ ' Twelve';
  if p3=13 then chaine:=chaine+ ' Thirteen';
  if p3=14 then chaine:=chaine+ ' Quatorze';
  if p3=15 then chaine:=chaine+ ' Fifteen';
  if p3=16 then chaine:=chaine+ ' Sixteen';
  if p3=17 then chaine:=chaine+ ' Seventeen';
  if p3=18 then chaine:=chaine+ ' Eighteen';
  if p3=19 then chaine:=chaine+ ' Nineteen';
end;
procedure chiffre(var p2:integer);
begin
  if p2=1 then chaine:=chaine+ ' One';
  if p2=2 then chaine:=chaine+ ' Two';
  if p2=3 then chaine:=chaine+ ' Three';
  if p2=4 then chaine:=chaine+ ' Four';
  if p2=5 then chaine:=chaine+ ' Five';
  if p2=6 then chaine:=chaine+ ' Six';
  if p2=7 then chaine:=chaine+ ' Seven';
  if p2=8 then chaine:=chaine+ ' Eight';
  if p2=9 then chaine:=chaine+ ' Nine';
end;
procedure mille(var p1:integer);
var c:integer;
begin
  c:=p1 div 100;
  if c=1 then chaine:=chaine+ ' Hundred';
  if c=2 then chaine:=chaine+ ' Two Hundred';
  if c=3 then chaine:=chaine+ ' Three Hundred';
  if c=4 then chaine:=chaine+ ' Four Hundred';
  if c=5 then chaine:=chaine+ ' Five Hundred';
  if c=6 then chaine:=chaine+ ' Six Hundred';
  if c=7 then chaine:=chaine+ ' Seven Hundred';
  if c=8 then chaine:=chaine+ ' Eight Hundred';
  if c=9 then chaine:=chaine+ ' Nine Hundred';
  p1:=p1-c*100; c:=p1 div 10;
  if c=2 then begin chaine:=chaine+ ' Twenty';
  p1:=p1-c*10; chiffre(p1);
end;
  if c=3 then
  begin
    chaine:=chaine+ ' Thirty';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=4 then
  begin
    chaine := chaine+ ' Forty';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=5 then
  begin
  chaine:=chaine+ ' Fifty';
  p1:=p1-c*10;
  chiffre(p1);
  end;
  if c=6 then
  begin
    chaine:=chaine+ ' Sixty';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=8 then
  begin
    chaine:=chaine+ ' Eighty';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=0 then chiffre(p1);
  if c=1 then decimale(p1);
  if c=7 then
begin
  chaine := chaine+ ' Sixty';
  p1:=p-60;
  decimale(p1);
end;
if c=9 then
begin
  chaine:=chaine+ ' Eighty';
   p1:=p1-80;
  decimale(p1);
end;
end;

       //----------{Programme principal}------------

var abc:real;
begin
  chaine:=' ';
  n:= StrToFloat(edt_nomber.Text);
  nombre:=trunc(n);
  abc:=int(n*100);
  dec:=trunc(abc) mod 100;
if nombre>=1000000000 then
begin
  p := nombre div 1000000000;
  nombre:= nombre - p * 1000000000;
if p<>0 then
begin
 mille(p);
 chaine:=chaine+ ' Billion';
end;
end;

   //---------{milliards}---------------------

if nombre>=1000000 then
begin
 p := nombre div 1000000;
 nombre := nombre - p * 1000000;
if p<>0 then
begin
  mille(p);
   chaine:=chaine+ ' Million';
end;
end;

     //---------{milliers}---------------------

if nombre>=1000 then
begin
  p := nombre div 1000;
  nombre := nombre - p * 1000;
if p<>1 then
begin
  mille(p);
  chaine := chaine + ' Thousand';
end else
  chaine := chaine + 'Thousand';
end;

    //---------{simple}---------------------

if (0<=nombre) and (nombre<1000) then
begin
  p := nombre;
  mille(p);
end;
 chaine:=chaine+ ' dinars' +' And';
 begin
 q:=dec; mille(q);
 IF q=0 THEN chaine := chaine+ ' Zero CTS'
Else chaine := chaine+ ' CTS'
end;

  //---------{chaine:=chaine+ ' dinars' +' et'+chaine1+' CTS';}--------

  Labe_english.caption := chaine;

end;

procedure TForm1.Label4Click(Sender: TObject);
 var chaine1,chaine:string;
    p,nombre,q,DEC:integer;
    N,n1:real;
procedure decimale(var p3:integer);
begin
  if p3=10 then chaine:=chaine+ ' Dix';
  if p3=11 then chaine:=chaine+ ' Onze';
  if p3=12 then chaine:=chaine+ ' Douze';
  if p3=13 then chaine:=chaine+ ' Treize';
  if p3=14 then chaine:=chaine+ ' Quatorze';
  if p3=15 then chaine:=chaine+ ' Quinze';
  if p3=16 then chaine:=chaine+ ' Seize';
  if p3=17 then chaine:=chaine+ ' Dix Sept';
  if p3=18 then chaine:=chaine+ ' Dix Huit';
  if p3=19 then chaine:=chaine+ ' Dix Neuf';
end;
procedure chiffre(var p2:integer);
begin
  if p2=1 then chaine:=chaine+ ' Un';
  if p2=2 then chaine:=chaine+ ' Deux';
  if p2=3 then chaine:=chaine+ ' Trois';
  if p2=4 then chaine:=chaine+ ' Quatre';
  if p2=5 then chaine:=chaine+ ' Cinq';
  if p2=6 then chaine:=chaine+ ' Six';
  if p2=7 then chaine:=chaine+ ' Sept';
  if p2=8 then chaine:=chaine+ ' Huit';
  if p2=9 then chaine:=chaine+ ' Neuf';
end;
procedure mille(var p1:integer);
var c:integer;
begin
  c:=p1 div 100;
  if c=1 then chaine:=chaine+ ' Cent';
  if c=2 then chaine:=chaine+ ' Deux Cent';
  if c=3 then chaine:=chaine+ ' Trois Cent';
  if c=4 then chaine:=chaine+ ' Quatre Cent';
  if c=5 then chaine:=chaine+ ' Cinq Cent';
  if c=6 then chaine:=chaine+ ' Six Cent';
  if c=7 then chaine:=chaine+ ' Sept Cent';
  if c=8 then chaine:=chaine+ ' Huit Cent';
  if c=9 then chaine:=chaine+ ' Neuf Cent';
  p1:=p1-c*100; c:=p1 div 10;
  if c=2 then begin chaine:=chaine+ ' Vingt';
  p1:=p1-c*10; chiffre(p1);
end;
  if c=3 then
  begin
    chaine:=chaine+ ' Trente';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=4 then
  begin
    chaine := chaine+ ' Quarante';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=5 then
  begin
  chaine:=chaine+ ' Cinquante';
  p1:=p1-c*10;
  chiffre(p1);
  end;
  if c=6 then
  begin
    chaine:=chaine+ ' Soixante';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=8 then
  begin
    chaine:=chaine+ ' Quatre Vingt';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=0 then chiffre(p1);
  if c=1 then decimale(p1);
  if c=7 then
begin
  chaine := chaine+ ' Soixante';
  p1:=p-60;
  decimale(p1);
end;
if c=9 then
begin
  chaine:=chaine+ ' Quatre Vingt';
   p1:=p1-80;
  decimale(p1);
end;
end;

       //----------{Programme principal}------------

var abc:real;
begin
  chaine:=' ';
  n:= StrToFloat(edt_nomber.Text);
  nombre:=trunc(n);
  abc:=int(n*100);
  dec:=trunc(abc) mod 100;
if nombre>=1000000000 then
begin
  p := nombre div 1000000000;
  nombre:= nombre - p * 1000000000;
if p<>0 then
begin
 mille(p);
 chaine:=chaine+ ' Milliard';
end;
end;

   //---------{milliards}---------------------

if nombre>=1000000 then
begin
 p := nombre div 1000000;
 nombre := nombre - p * 1000000;
if p<>0 then
begin
  mille(p);
   chaine:=chaine+ ' Million';
end;
end;

     //---------{milliers}---------------------

if nombre>=1000 then
begin
  p := nombre div 1000;
  nombre := nombre - p * 1000;
if p<>1 then
begin
  mille(p);
  chaine := chaine + ' Mille';
end else
  chaine := chaine + 'mille';
end;

    //---------{simple}---------------------

if (0<=nombre) and (nombre<1000) then
begin
  p := nombre;
  mille(p);
end;
 chaine:=chaine+ ' dinars' +' et';
 begin
 q:=dec; mille(q);
 IF q=0 THEN chaine := chaine+ ' Zero CTS'
Else chaine := chaine+ ' CTS'
end;

  //---------{chaine:=chaine+ ' dinars' +' et'+chaine1+' CTS';}--------

  Labe_french.caption := chaine;
end;



procedure TForm1.Label5Click(Sender: TObject);
var chaine1,chaine:string;
    p,nombre,q,DEC:integer;
    N,n1:real;
procedure decimale(var p3:integer);
begin
  if p3=10 then chaine:=chaine+ ' ⁄‘—…';
  if p3=11 then chaine:=chaine+ ' «Õœ ⁄‘—…';
  if p3=12 then chaine:=chaine+ ' «À‰« ⁄‘—…';
  if p3=13 then chaine:=chaine+ ' À·«À… ⁄‘—…';
  if p3=14 then chaine:=chaine+ ' «—»⁄… ⁄‘—…';
  if p3=15 then chaine:=chaine+ ' Œ„”… ⁄‘—…';
  if p3=16 then chaine:=chaine+ ' ” … ⁄‘—…';
  if p3=17 then chaine:=chaine+ ' ”»⁄… ⁄‘—… ';
  if p3=18 then chaine:=chaine+ ' À„«‰Ì… ⁄‘—… ';
  if p3=19 then chaine:=chaine+ '  ”⁄… ⁄‘—… ';
end;
procedure chiffre(var p2:integer);
begin
  if p2=1 then chaine:=chaine+ ' Ê«Õœ';
  if p2=2 then chaine:=chaine+ ' «À‰«‰';
  if p2=3 then chaine:=chaine+ ' À·«À…';
  if p2=4 then chaine:=chaine+ ' «—»⁄…';
  if p2=5 then chaine:=chaine+ ' Œ„”…';
  if p2=6 then chaine:=chaine+ ' ” …';
  if p2=7 then chaine:=chaine+ ' ”»⁄…';
  if p2=8 then chaine:=chaine+ ' À„«‰Ì…';
  if p2=9 then chaine:=chaine+ '  ”⁄…';
end;
procedure mille(var p1:integer);
var c:integer;
begin
  c:=p1 div 100;
  if c=1 then chaine:=chaine+ ' „∆…';
  if c=2 then chaine:=chaine+ ' „∆ «‰';
  if c=3 then chaine:=chaine+ ' À·«À „∆…';
  if c=4 then chaine:=chaine+ ' «—»⁄ „∆…';
  if c=5 then chaine:=chaine+ ' Œ„” „∆…';
  if c=6 then chaine:=chaine+ ' ”  „∆…';
  if c=7 then chaine:=chaine+ ' ”»⁄ „∆…';
  if c=8 then chaine:=chaine+ ' À„«‰ „∆…';
  if c=9 then chaine:=chaine+ '  ”⁄ „∆…';
  p1:=p1-c*100; c:=p1 div 10;
  if c=2 then begin chaine:=chaine+ ' ⁄‘—Ê‰';
  p1:=p1-c*10; chiffre(p1);
end;
  if c=3 then
  begin
    chaine:=chaine+ ' À·«ÀÊ‰';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=4 then
  begin
    chaine := chaine+ ' «—»⁄Ê‰';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=5 then
  begin
  chaine:=chaine+ ' Œ„”Ê‰';
  p1:=p1-c*10;
  chiffre(p1);
  end;
  if c=6 then
  begin
    chaine:=chaine+ ' ” Ê‰';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=8 then
  begin
    chaine:=chaine+ '  ”»⁄Ê‰';
    p1:=p1-c*10;
    chiffre(p1);
  end;
  if c=0 then chiffre(p1);
  if c=1 then decimale(p1);
  if c=7 then
begin
  chaine := chaine+ ' À„«‰Ê‰';
  p1:=p-60;
  decimale(p1);
end;
if c=9 then
begin
  chaine:=chaine+ '  ”⁄Ê‰';
   p1:= p1 - 80;
  decimale(p1);
end;
end;

       //----------{Programme principal}------------

var abc:real;
begin
  chaine :=' ';
  n:= StrToFloat(edt_nomber.Text);
  nombre := trunc(n);
  abc := int(n * 100);
  dec := trunc(abc) mod 100;
if nombre >= 1000000000 then
begin
  p := nombre div 1000000000;
  nombre:= nombre - p * 1000000000;
if p<>0 then
begin
  mille(p);
  chaine := chaine+ ' „·Ì«—';
end;
end;

   //---------{milliards}---------------------

if nombre>=1000000 then
begin
 p := nombre div 1000000;
 nombre := nombre - p * 1000000;
if p<>0 then
begin
   mille(p);
   chaine:=chaine+ ' „·«ÌÌ‰';
end;
end;

     //---------{milliers}---------------------

if nombre >= 1000 then
begin
  p := nombre div 1000;
  nombre := nombre - p * 1000;
if p<>1 then
begin
  mille(p);
  chaine := chaine + ' «·«›';
end else
  chaine := chaine + '«·›';
end;

    //---------{simple}---------------------

if (0<=nombre) and (nombre<1000) then
begin
  p := nombre;
  mille(p);
end;
 chaine:=chaine+ ' œÌ‰«—' +' Ê';
 begin
 q:=dec; mille(q);
 IF q=0 THEN chaine := chaine+ ' ’›— ”‰ Ì„'
Else chaine := chaine+ ' ”‰ Ì„'
end;

  //---------{chaine:= chaine+ ' dinars' +' et'+chaine1+' CTS';}--------
  Labe_arab.caption := chaine;

end;

end.
