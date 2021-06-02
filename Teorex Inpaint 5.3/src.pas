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
const co : integer = $19;
      pl : integer = $41;

var m    : integer;
    temp : integer;
    Calc : array [1..19] of integer;
    _Str : array [1..19] of string;
    RSrt : array [1..7]  of string;
begin
 result := '';

 //RSrt[01] := 'J';
 RSrt[01] := random_serial(1, 4);                           // 1
 m := ord(RSrt[01][1]);

 temp := m * m;

 Calc[01] := (((temp shl 5) + temp) mod co) + pl;           // 1-1
 _Str[01] := hextostr(sbinttohex(Calc[01], 2, 0));

 Calc[02] := (((m * Calc[01]) * $15) mod co) + pl;          // 1-2
 _Str[02] := hextostr(sbinttohex(Calc[02], 2, 0));

 Calc[03] := (((Calc[02] * 4 ) + Calc[02]) mod co) + pl;    // 1-3
 _Str[03] := hextostr(sbinttohex(Calc[03], 2, 0));

 temp := Calc[03] * Calc[03];

 Calc[04] := (((temp * Calc[02]) * $0D) mod co) + pl;       // 1-4
 _Str[04] := hextostr(sbinttohex(Calc[04], 2, 0));

 //RSrt[02] := 'V';
 RSrt[02] := random_serial(1, 4);                           // 2
 m := ord(RSrt[02][1]);

 Calc[05] := (((Calc[04] + m) + $100) mod co) + pl;         // 2-1
 _Str[05] := hextostr(sbinttohex(Calc[05], 2, 0));

 temp := Calc[05] + Calc[04];

 Calc[06] := ((temp + Calc[04]) mod co) + pl;               // 2-2
 _Str[06] := hextostr(sbinttohex(Calc[06], 2, 0));

 //

 //RSrt[03] := 'U';
 RSrt[03] := random_serial(1, 4);                           // 3
 m := ord(RSrt[03][1]);

 Calc[07] := ((m * m) mod co) + pl;                         // 3-1
 _Str[07] := hextostr(sbinttohex(Calc[07], 2, 0));

 temp := m + Calc[06];

 Calc[08] := (((temp + Calc[05]) + $1E9) mod co) + pl;      // 3-2
 _Str[08] := hextostr(sbinttohex(Calc[08], 2, 0));

 Calc[09] := (((Calc[08] * Calc[07]) * m ) mod co) + pl;    // 3-3
 _Str[09] := hextostr(sbinttohex(Calc[09], 2, 0));

 result := RSrt[01] + _Str[01] + _Str[02] + _Str[03] + '-' +
           RSrt[02] + _Str[04] + _Str[05] + _Str[06] + '-' +
           RSrt[03] + _Str[07] + _Str[08] + _Str[09] + '-' +
           random_serial(4,4) +    '-' +
           random_serial(4,4) +    '-' +
           random_serial(4,4) +    '-' +
           random_serial(4,4) +    '-' +
           random_serial(4,4) ;
end;