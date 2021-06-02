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

function sRipX(input: integer): integer;
asm
  mov eax, input
  cmp eax, $069
 jnz @JMP1
  mov eax, $062
 @JMP1:
  cmp eax, $06c
 jnz @JMP2
  mov eax, $063
 @JMP2:
  cmp eax, $049
 jnz @JMP3
  mov eax, $064
 @JMP3:
  cmp eax, $031
 jnz @JMP4
  mov eax, $065
 @JMP4:
  cmp eax, $04c
 jnz @JMP5
  mov eax, $066
 @JMP5:
  cmp eax, $030
 jnz @JMP6
  mov eax, $067
 @JMP6:
  cmp eax, $04f
 jnz @JMP7
  mov eax, $068
 @JMP7:
  mov ecx, eax
  cmp ecx, $030
 jl @JMP8
  cmp ecx, $039
 jle @JMP9
  cmp ecx, $041
 jl @JMP8
 @JMP9:
  cmp ecx, $05a
 jle @JMP10
  cmp ecx, $061
 jl @JMP8
 @JMP10:
  cmp ecx, $07a
 jle @JMP11
 @JMP8:
  mov eax, $054
 @JMP11:
  mov result ,ecx
end;

function Sar_1(Value: Integer): Integer;
asm
 sar eax,1
end;

function jump(input:integer): integer;
const magic: array[1..256] of Byte = (
                                       $20, $00, $20, $00, $20, $00, $20, $00,
                                       $20, $00, $20, $00, $20, $00, $20, $00,
                                       $20, $00, $28, $00, $28, $00, $28, $00,
                                       $28, $00, $28, $00, $20, $00, $20, $00,
                                       $20, $00, $20, $00, $20, $00, $20, $00,
                                       $20, $00, $20, $00, $20, $00, $20, $00,
                                       $20, $00, $20, $00, $20, $00, $20, $00,
                                       $20, $00, $20, $00, $20, $00, $20, $00,
                                       $48, $00, $10, $00, $10, $00, $10, $00,
                                       $10, $00, $10, $00, $10, $00, $10, $00,
                                       $10, $00, $10, $00, $10, $00, $10, $00,
                                       $10, $00, $10, $00, $10, $00, $10, $00,
                                       $84, $00, $84, $00, $84, $00, $84, $00,
                                       $84, $00, $84, $00, $84, $00, $84, $00,
                                       $84, $00, $84, $00, $10, $00, $10, $00,
                                       $10, $00, $10, $00, $10, $00, $10, $00,
                                       $10, $00, $81, $00, $81, $00, $81, $00,
                                       $81, $00, $81, $00, $81, $00, $01, $00,
                                       $01, $00, $01, $00, $01, $00, $01, $00,
                                       $01, $00, $01, $00, $01, $00, $01, $00,
                                       $01, $00, $01, $00, $01, $00, $01, $00,
                                       $01, $00, $01, $00, $01, $00, $01, $00,
                                       $01, $00, $01, $00, $01, $00, $10, $00,
                                       $10, $00, $10, $00, $10, $00, $10, $00,
                                       $10, $00, $82, $00, $82, $00, $82, $00,
                                       $82, $00, $82, $00, $82, $00, $02, $00,
                                       $02, $00, $02, $00, $02, $00, $02, $00,
                                       $02, $00, $02, $00, $02, $00, $02, $00,
                                       $02, $00, $02, $00, $02, $00, $02, $00,
                                       $02, $00, $02, $00, $02, $00, $02, $00,
                                       $02, $00, $02, $00, $02, $00, $10, $00,
                                       $10, $00, $10, $00, $10, $00, $20, $00 );

var a,b,c : integer;
begin
 a := (input * 2) + 1;
 b := magic[a];
 c := b and $103;
 result := c;
end;

function Generate_Advisor_Serial(User_Name,License: string): pchar;
var cal_1 : array[1..6]of cardinal;
    cal_2 : array[1..3]of cardinal;   
    cal_3 : array[1..2]of cardinal;
    cal_4 : array[1..3]of cardinal;
    cal_5 : array[1..7]of cardinal;
    a1,a2,a3,a4,a5,a,c,d,jmp,y,xx1            : integer;
    luser_name,uuser_name,Lserial,FinalSerial : string;
    part1,part2,part3,part4,part5,part6,part7 : string;
    x1                                        : real;
begin

 if not(IsNumber(license)) then begin
  Messagebox(Global_Hwnd,'Serial Error : [ Use digital number. ]','WTF ?',MB_OK);
  result := '';
  exit;
 end;

 if (license) = '' then begin
  Messagebox(Global_Hwnd,'Serial Error : [ Use digital number. ]','WTF ?',MB_OK);
  result := '';
  exit;
 end;

 if length(license) < 5 then begin
  Messagebox(Global_Hwnd,'Serial Error : [ Minimum length (5). ]','WTF ?',MB_OK);
  result := '';
  exit;
 end;

 if pos(';', user_name) <> 0 then begin
  Messagebox(Global_Hwnd,'Username Error : [ Do not use ---> ; ]','WTF ?',MB_OK);
  result := '';
  exit;
 end;

 if (user_name[1]= ' ')or(user_name[length(user_name)]= ' ') then begin
  Messagebox(Global_Hwnd,'[ Do not use (space) in first / last char. ]','WTF ?',MB_OK);
  result := '';
  exit;
 end;

 if length(user_name) < 6 then begin
  Messagebox(Global_Hwnd,'Username Error : [ Minimum length (6). ]','WTF ?',MB_OK);
  result := '';
  exit;
 end;

 SetDlgItemText(Global_hwnd, IDC_Serial, pChar(random_serial(5,0)));
 GetDlgItemText(Global_hwnd, IDC_Serial, Clserial , Max_Path);
 License := Clserial;

 //user_name := '';
 //license   := '';

//Part (1)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101

 uuser_name := uppercase(user_name);
 cal_1 [1]  := ord(user_name[3]);
 jmp        := jump(cal_1 [1]);

 if jmp > 0 then begin
 cal_1 [1] := ord(uuser_name[3]);

  //if (cal_1 [1] - $61) < $19 then begin     // Uppercase
  // cal_1 [1] := cal_1 [1] - $20;
  //end;
  cal_1 [1] := cal_1 [1] and $7F;

 end else begin
  cal_1 [1] := $41;
 end;

 cal_1 [2] := ord(user_name[length(user_name)-1]);
 jmp       := jump(ord(user_name[length(user_name)-1]));

 if jmp > 0 then begin
  if (cal_1 [2] - $61) < $19 then begin     // Uppercase
   cal_1 [2] := cal_1 [2] - $20;
  end;
  cal_1 [2] := cal_1 [2] and $7F;
  cal_1 [2] := cal_1 [1] + cal_1 [2];
 end else begin
  cal_1 [2] := cal_1 [1] + $43;
 end;

  if cal_1 [2] >= 0 then      // cdq
   cal_1 [3] := $0
  else
   cal_1 [3] := $FFFFFFFF;

 cal_1 [4] := sar_1(cal_1 [2] - cal_1 [3]);
 cal_1 [5] := length(uuser_name) - length(license);

 if ($0F - $07) > cal_1 [5] then begin
  cal_1 [5] := $0F - length(license);
  dec(cal_1 [5]);

  if cal_1 [5] >= 0 then      // cdq
   cal_1 [6] := $0
  else
   cal_1 [6] := $FFFFFFFF;

  cal_1 [4] := (sar_1(cal_1 [5] - cal_1 [6])) + cal_1 [4];
 end else begin
  inc(cal_1 [4]);
  inc(cal_1 [4]);
 end;

 if cal_1 [4] > $5A then begin    // Z
  cal_1 [4] := $33;
 end;

 if cal_1 [4] < $41 then begin   //  A
  cal_1 [4] := $33;
 end;

 a1    := sRipX(cal_1 [4]);
 Part1 := HexToStr(sbInttohex(a1,2,0));

//Part (2)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101

 luser_name := lowercase(user_name);
 a          := length(user_name) ;
 xx1        := length(license);

 asm
  pushad
   xor edi, edi
   xor ebx, ebx
   cmp a, ebx
   mov c, edi
  jle @Fm_00602162
  @Fm_006020d2:
   cmp edi, 7
  je @Fm_0060214B
   mov esi, luser_name
   movsx eax, byte ptr ds:[esi + edi]
  // lea ecx, dword ptr ds:[eax-$041]
  // cmp ecx, $019
  //ja @Fm_00633b27
  // add eax, $020
  //@Fm_00633b27:
   call jump
   test eax, eax
  je @Fm_0060214B
   movsx eax, byte ptr ds:[esi + edi]
  // lea ecx, dword ptr ds:[eax-$041]
  // cmp ecx, $019
  //ja @Fm_00633b28
  // add eax, $020
  //@Fm_00633b28:
   and eax, $07f
   add ebx, eax
   inc c
   cmp edi, 2
  jnz @Fm_0062e012
   add ebx, 3
  jmp @Fm_00602114
  @Fm_0062e012:
   cmp edi, 5
  jnz @Fm_0060210E
   inc ebx
   inc ebx
  jmp @Fm_00602114
  @Fm_0060210e:
   cmp edi, 6
  jnz @Fm_00602114
   inc ebx
  @Fm_00602114:
   mov ecx, a
   cmp ecx, 8
  jle @Fm_0060211F
   sub ebx, 7
  @Fm_0060211f:
   cmp ebx, $095
   mov eax, $0F                      // const = $0F
  jle @Fm_00602142
   mov edx, eax
   sub edx, xx1
   lea ecx, dword ptr ds:[edx + ecx + 2]
   cmp ecx, $0e
  jle @Fm_0060214B
   cdq
   idiv xx1
   add ebx, edx
  jmp @Fm_0060214B
  @Fm_00602142:
   sub eax, ecx
   add eax, xx1
  jns @Fm_0060214B
   dec ebx
   dec ebx
  @Fm_0060214b:
   inc edi
   cmp edi, a
  jl @Fm_006020D2              // end loop
   cmp c, 0
  jle @Fm_00602162
   mov eax, ebx
   cdq
   idiv c
  jmp @Fm_00602165
  @Fm_00602162:
   push $072
   pop eax
  @Fm_00602165:
   cmp eax, $07a
   mov c, eax
  jg @Fm_00602172
   cmp eax, $061
  jge @Fm_00602179
  @Fm_00602172:
   mov c, $074

  @Fm_00602179:
  popad
 end;

 a2    := sRipX(c);
 Part2 := hextostr(sbinttohex(a2,2,0));

//Part (3)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101

 cal_3 [1] := ord(uuser_name[1]);

 if cal_3 [1] >= $4A then begin
  cal_3 [2] := (ord(license[5])) + $35;
 end else begin
  cal_3 [2] := $69 - (ord(license[4]));
 end;

 a3    := sRipX(cal_3 [2]);
 Part3 := hextostr(sbinttohex(a3,2,0));


//Part (4)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101

 if length(user_name) <= $0F then begin

  cal_2 [1] := ord(luser_name[4]);
  jmp       := jump(cal_2 [1]);

  if jmp > 0 then begin
   cal_2 [1] := ord(luser_name[4]);
   //if (cal_2 [1] - $41) < $19 then begin     // Lowercase
   // cal_2 [1] := cal_2 [1] + $20;
   //end;
  end else begin
   cal_2 [1] := $72;
  end;

  cal_2 [2] := ord(luser_name[5]);
  jmp       := jump(cal_2 [2]);

  if jmp > 0 then begin
   //cal_2 [2] := ord(luser_name[5]);
   //if (cal_2 [2] - $41) < $19 then begin     // Lowercase
   // cal_2 [2] := cal_2 [2] + $20;
   //end;
   cal_2 [1] := cal_2 [1] + cal_2 [2];
  end else begin
   cal_2 [1] := cal_2 [1] + $62;
  end;

  cal_2 [3] := ord(luser_name[3]);
  jmp       := jump(cal_2 [3]);

  if jmp > 0 then begin
   //cal_2 [3] := ord(luser_name[3]);
   //if (cal_2 [3] - $41) < $19 then begin     // Lowercase
   // cal_2 [3] := cal_2 [3] + $20;
   //end;
   cal_2 [1] := cal_2 [1] + cal_2 [3];
  end else begin
   cal_2 [1] := cal_2 [1] + $71;
  end;

  cal_2 [1] := cal_2 [1] div 03;

  if cal_2 [1] >= $6E then begin
   dec(cal_2 [1]);
   dec(cal_2 [1]);
  end else begin
   cal_2 [1] := cal_2 [1] + 03;
  end;

 end else begin
  cal_2 [1] := $7A;
 end;

 a4    := sRipX(cal_2 [1]);
 Part4 := hextostr(sbinttohex(a4,2,0));

//Part (5)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101

 cal_4 [1] := ord(uuser_name[length(uuser_name) - 1]);

 if cal_4 [1] <= $48 then begin
  cal_4 [2] := ord(license[3]) - $30;
  x1 := cal_4 [2] * 2.200000000000000;
  cal_4 [3] := $79 - trunc(x1);
 end else begin
  cal_4 [2] := ord(license[4]) - $30;
  x1 := cal_4 [2] * -1.800000000000000;
  cal_4 [3] := $62 - trunc(x1);
 end;

 a5    := sRipX(cal_4 [3]);
 Part5 := hextostr(sbinttohex(a5,2,0));

//Part (6)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
        
 GetSystemTime(Jetzt);
 cal_5 [1] := Jetzt.wYear;
 cal_5 [2] := Jetzt.wMonth;
 cal_5 [3] := Jetzt.wDay;

 cal_5 [4] := (cal_5 [2] - cal_5 [3]) + cal_5 [1];
 cal_5 [5] := (cal_5 [3] + $08) * cal_5 [2];
 cal_5 [6] := (cal_5 [4] * cal_5 [5]) - 2;

 if cal_5 [5] > $15A then begin
  cal_5 [7] := cal_5 [6] - (cal_5 [4] + $0F);
 end else begin
  if cal_5 [5] > $1CA then begin
   cal_5 [7] := cal_5 [6] + (cal_5 [4] - length(user_name));
  end;
 end;

 Part6 := '';

//Part (7)0101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101
//010101010101010101010101010101010101010101010101010101010101010101010101010101

 y       := strtoint(license) + length(license) + length(user_name);
 Lserial := Part1 + Part2 + random_serial(2,2) + Part4 +
            Part3 + Part5 + random_serial(7,2);

 //Lserial :=  Part1 + Part2 + 'xx' + Part4 + Part3 + Part5 + 'xxxxxxx';

 asm
   mov eax, y
   mov ebx, Lserial
   xor ecx, ecx
  @JmP1:
   movsx edx, byte ptr ss:[ebx + ecx]
   add eax, edx
   inc ecx
   cmp ecx, $0d
  jle @JmP1
   cdq
   push $019
   pop ecx
   idiv ecx
   push $05a
   pop eax
   and ecx, $7F
   sub eax, edx
   mov d, eax
 end;           

 Part7       := hextostr(sbinttohex(d,2,0));
 FinalSerial := Lserial + Part7;
 result      := pchar(FinalSerial);

end;