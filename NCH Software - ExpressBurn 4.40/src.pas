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

procedure sRipX;
asm
 push ebx
 push esi
 mov esi, eax
 movsx edx, byte ptr ds:[esi]
 movsx eax, byte ptr ds:[ecx]
 lea eax, dword ptr ds:[eax+edx-$0c2]
 cdq
 push edi
 push $01a
 pop edi
 idiv edi
 mov bl, $061
 push edi
 add dl, bl
 mov byte ptr ds:[ecx], dl
 movsx eax, byte ptr ds:[esi+1]
 movsx edx, byte ptr ds:[ecx+1]
 lea eax, dword ptr ds:[eax+edx-$0c2]
 cdq
 idiv edi
 add dl, bl
 mov byte ptr ds:[ecx+1], dl
 movsx eax, byte ptr ds:[esi+2]
 movsx edx, byte ptr ds:[ecx+2]
 lea eax, dword ptr ds:[eax+edx-$0c2]
 cdq
 idiv edi
 add dl, bl
 mov byte ptr ds:[ecx+2], dl
 movsx eax, byte ptr ds:[esi+3]
 movsx edx, byte ptr ds:[ecx+3]
 lea eax, dword ptr ds:[eax+edx-$0c2]
 cdq
 idiv edi
 add dl, bl
 mov byte ptr ds:[ecx+3], dl
 movsx eax, byte ptr ds:[esi+4]
 movsx edx, byte ptr ds:[ecx+4]
 lea eax, dword ptr ds:[eax+edx-$0c2]
 cdq
 idiv edi
 add dl, bl
 mov byte ptr ds:[ecx+4], dl
 movsx eax, byte ptr ds:[esi+5]
 movsx edx, byte ptr ds:[ecx+5]
 lea eax, dword ptr ds:[eax+edx-$0c2]
 pop esi
 cdq
 idiv esi
 pop edi
 pop esi
 mov byte ptr ds:[ecx+6], 0
 add dl, bl
 mov byte ptr ds:[ecx+5], dl
 pop ebx
end;

function sCoKeyA(input : integer):string;
begin
 case input of
  0 : result := 'mnbvaq';
  1 : result := 'cxzlbr';
  2 : result := 'kjhgct';
  3 : result := 'fdsady';
  4 : result := 'poiueu';
  5 : result := 'ytrefo';
  6 : result := 'wqalgx';
  7 : result := 'ksjdhv';
  8 : result := 'hfgbif';
 end;
end;

function sCoKeyB(input : integer):string;
begin
 case input of
  0 : result := 'qazwja';
  1 : result := 'sxedkf';
  2 : result := 'crfvlg';
  3 : result := 'tgbymh';
  4 : result := 'hnujni';
  5 : result := 'miklop';
  6 : result := 'plokpc';
 end;
end;

function Generate_Serial(user_name,location: string): string;
var part1 ,part2,part3 ,part4,part5,
    part6,part7,part8,part9,part10,
    part11,part12,FinalPart     : string;
    a,b,c,d,e,f,g,h,j,k,l,m,n,p : integer;
    p1 : string;
    ww : string;
    id : integer;
    pid: string;
    i  : integer;
    id_: integer;
    label J_1;
    label J_2;
    label J_3;
    label J_4;
    label J_5;
    label J_6;
    label J_7;
    label J_8;
    label J_9;
    label J_10;
    label J_11;
    label J_12;
    label J_13;
    label J_14;
    label J_15;
begin
 result := '';

 if length(user_name) < 2 then begin
  result := 'user';
  SetDlgItemText(Global_hwnd, IDC_Username, pChar(result));
  exit;
 end;

 if length(location) < 2 then begin
  result := 'location';
  SetDlgItemText(Global_hwnd, IDC_Serial, pChar(result));
  exit;
 end;

 repeat
  pid := random_serial(1,0); // < 532024
 until (strtoint(pid) >= 6);

 pid := pid + random_serial(5,0);
 id  := strtoint(pid);
 id_ := strtoint(copy(pid,0,4));

 ww := 'abcdef';
 for i := 1 to length(ww) do begin
  p1 := p1 + ww[i];
 end;

 a := id_ mod 9;
 b := id_ div 9;
 part1 := sCoKeyA(a);

 c := b mod 7;
 part2 := sCoKeyB(c);

 d := id_ div $3f;
 e := d div 9;
 f := d mod 9;
 part3 := sCoKeyA(f);

 g := e div 7;
 h := e mod 7;
 part4 := sCoKeyB(h);

 i := d div $3f;
 j := i div 9;
 k := i mod 9;
 part5 := sCoKeyA(k);

 l := j mod 7;
 part6 := sCoKeyB(l);

 m := g div $3f;
 n := m mod 9;
 part7 := sCoKeyA(n);

 p := n div 7;
 part8 := sCoKeyB(p);

 part9  := sCoKeyA(3);
 part10 := sCoKeyB(2);
 part11 := sCoKeyA(1);
 part12 := sCoKeyB(0);

 asm
  pushad
   mov edi, dword ptr ss:[user_name]
   mov ebx, dword ptr ss:[location]
   mov esi, dword ptr ss:[p1]
  jmp J_1
  J_6:
   cmp al, $061
  jl J_2
   cmp al, $07a
   jle J_3
  J_2:
   cmp al, $041
  jl J_4
   cmp al, $05a
   jle J_5
  J_4:
   inc edi
  J_1:
   mov al, byte ptr ds:[edi]
   test al, al
  jnz J_6
  jmp J_7
  J_3:
   mov al, byte ptr ds:[edi]
  jmp J_8
  J_5:
   mov al, byte ptr ds:[edi]
   add al, $020
  J_8:
   mov byte ptr ds:[esi+4], al
  jmp J_7
  J_13:
   cmp al, $061
  jl J_9
   cmp al, $07a
  jle J_10
  J_9:
   cmp al, $041
  jl J_11
   cmp al, $05a
  jle J_12
  J_11:
   inc ebx
  J_7:
   mov al, byte ptr ds:[ebx]
   test al, al
  jnz J_13
  jmp J_14
  J_10:
   mov al, byte ptr ds:[ebx]
  jmp J_15
  J_12:
   mov al, byte ptr ds:[ebx]
   add al, $020
  J_15:
   mov byte ptr ds:[esi+5], al
  J_14:

   mov ecx, esi
   mov eax, part1
   call sRipX

   mov ecx, esi
   mov eax, part2
   call sRipX

   mov ecx, esi
   mov eax, part3
   call sRipX

   mov ecx, esi
   mov eax, part4
   call sRipX

   mov ecx, esi
   mov eax, part5
   call sRipX

   mov ecx, esi
   mov eax, part6
   call sRipX

   mov ecx, esi
   mov eax, part7
   call sRipX

   mov ecx, esi
   mov eax, part8
   call sRipX

   //mov ecx, esi
   mov eax, part9
   call sRipX

   mov eax, part10
   call sRipX

   mov eax, part11
   call sRipX

   mov eax, part12
   call sRipX

   mov FinalPart ,ecx
  popad
 end;

 SetDlgItemText(Global_hwnd, IDC_ID, Pchar(inttostr(id)));
 SetDlgItemText(Global_hwnd, IDC_Key, Pchar(copy(FinalPart,0,4) + 'cl' + random_serial(3,2)));
 result := '';

end;
