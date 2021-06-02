{*******************************************************************************
              |-------------------------------------------------|
              |                _     _     _   _                |
              |              _| |___| |___| |_|_|               |
              |             | . | -_| | . |   | |               |
              |             |___|___|_|  _|_|_|_|               |
              |                       |_|                       |
              |                                                 |
              |-------------------------------------------------|
 Compiler ver  : Delphi 7 Enterprise (2009-2011)
*******************************************************************************}

function s004819A0(input : integer) : integer;
const Magic : array [0..23] of byte = (
                                       $00, $05, $05, $05, $05, $05, $01, $05,
                                       $05, $05, $02, $05, $05, $05, $05, $05,
                                       $05, $05, $05, $05, $05, $05, $03, $04 );
var a,b,d,e : integer;
begin
 d := input and $1F;
 a := d - $08;
 if (a >= 0) and (a <= $17) then begin
  b := magic[a];
   case b of
    0 : begin result := $5A; exit; end;
    1 : begin result := $59; exit; end;
    2 : begin result := $73; exit; end;
    3 : begin result := $58; exit; end;
    4 : begin result := $57; exit; end;
   end;
 end;
 e := d + $41;
  if d > $15 then e := d + $1C;
 result := e;
end;

function Generate_Serial(user_name: string): string;
var part1       : string;
    p1          : string;
    RevSerial   : string;
    m,i         : integer;
    a1,a2,a3,a4 : integer;
    b1,b2       : integer;
    Year,rn     : integer;
    d1,d2,d3,d4 : integer;
begin
 result := '';

 d1 := s004819A0($B); //0B = 2011
 p1 := p1 + HexToStr(sbinttohex(d1,2,0));
 GetSystemTime(Jetzt);
 Year := ((Jetzt.wYear) and $0F); // +1;
 randomize;
 rn := random(Year);
 d2 := s004819A0(rn);
 p1 := p1 + HexToStr(sbinttohex(d2,2,0)) ;
 randomize;
 rn := random(7);
 case rn of
  0 : d3 := s004819A0($0B); // 2011
  1 : d3 := s004819A0($0C); // 2012
  2 : d3 := s004819A0($0D); // 2013
  3 : d3 := s004819A0($0E); // 2014
  4 : d3 := s004819A0($0F); // 2015
  5 : d3 := s004819A0($10); // 2016
  6 : d3 := s004819A0($11); // 2017
 end;
  p1 := p1 + HexToStr(sbinttohex(d3,2,0));
 d4 := s004819A0(1);    // result = 1
 p1 := p1 + HexToStr(sbinttohex(d4,2,0));
 part1 := random_serial(1,6) + p1 + random_serial(6,6);
 a3 := 0;
 for i := 1 to length(part1) do begin
  m  := ord(part1[i]);
  a1 := m shl $9;
  a2 := a1 or m;
  a4 := (a3 * 8) + a2;
  a3 := (a3 shr $10) xor a4;
 end;
  a3 := a3 and $3FFFFFFF;
 b1 := a3;
 for i := 1 to 6 do begin
  if i = 1 then begin
   b2 := b1;
  end else begin
   b2 := b1 shr 5;
  end;
  b1 := s004819A0(b2);
  RevSerial := RevSerial + HexToStr(sbinttohex(b1,2,0));
  b1 := b2;
 end;
  RevSerial := RevSerial[01] + RevSerial[02] + RevSerial[03] +
               RevSerial[06] + RevSerial[05] + RevSerial[04] ;

 result :=  RevSerial + part1;
end;
