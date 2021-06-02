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

function Generate_Serial(user_name: string): string;
var i,j             : dword;
    Magic_1         : string;
    Magic_2         : byte;
    Magic_3         : byte;
    Sn_1            : string;
    Sn_2            : string;
    M               : dword;
    calc_1          : array [1..07] of dword;
    calc_2          : array [1..05] of dword;
    Serial          : string;
    Count           : integer;
    MainLoopConst_1 : byte;
    MainLoopConst_2 : byte;
begin
 result := '';

 Magic_1   := 'C0DKFDFPOWE9PMNTPGAS0MFWS0789C';

 calc_1[01] := 0;
 for i := 1 to length(user_name) do begin
  M := ord(user_name[i]);
  calc_1[02] := (M * i) + calc_1[01];
  calc_1[01] := calc_1[02];
 end;

 Magic_2    := $1E;
 calc_1[03] := calc_1[01] mod Magic_2;

 Sn_1 := copy(Magic_1, calc_1[03] + 1, length(Magic_1));

 Magic_3 := $0A;
 calc_1[04] := calc_1[01];
 M := ord(Sn_1[01]);
 for i := 1 to 4 do begin
  calc_1[05] := (calc_1[04] mod Magic_3) + $30;
  Serial := Serial + HexToStr(IntToHex(calc_1[05]));
  calc_1[06] := calc_1[05] + M;
  calc_1[04] := calc_1[04] div Magic_3;
  M := calc_1[06];
 end;

 Serial := Sn_1[01] + Serial;
 calc_1[07] := calc_1[06] mod Magic_2;
 Serial := Serial + copy(Magic_1, calc_1[07] + 1, 1);

 // Part 2 ---------------------------------------------------------------------

 for i := 1 to 3 do begin

  case i of
   1 : begin MainLoopConst_1 := 3;   MainLoopConst_2 := $07; end;
   2 : begin MainLoopConst_1 := 5;   MainLoopConst_2 := $0B; end;
   3 : begin MainLoopConst_1 := 7;   MainLoopConst_2 := $11; end;
  end;

  calc_2[01] := (calc_1[01] * calc_1[01]) div MainLoopConst_1;

  calc_2[02] := calc_2[01] mod Magic_2;

  calc_2[04] := 0;
  count      := 0;

   for j := 1 to 5 do begin

    Sn_2 := copy(Magic_1, calc_2[02] + 1, length(Magic_1));
    M    := ord(Sn_2[1]);

    calc_2[03] := ((count mod 2) + 1) * M;
    calc_2[04] := calc_2[03] + calc_2[04];
    calc_2[01] := calc_2[01] div MainLoopConst_2;

    Serial := Serial + Sn_2[1];

    calc_2[02] := calc_2[01] mod Magic_2;

    inc(count);
   end;

  calc_2[05] := calc_2[04] mod Magic_2;
  Serial := Serial + copy(Magic_1, calc_2[05] + 1, 1);

 end; // for i

 Serial := 'SLNR' + Serial;

 insert('-', Serial, 05);
 insert('-', Serial, 12);
 insert('-', Serial, 19);
 insert('-', Serial, 26);

 Serial := lowercase(copy(StrMD5(Serial), 9, 16));

 result := Serial;

end;