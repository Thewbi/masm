; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe
; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x86\ml.exe
; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx86\x64
; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx86\x86\ml64.exe

; "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe" main_masm_x64.asm /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:main
; "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe" main_masm_x64.asm /link /subsystem:windows /defaultlib:kernel64.lib /defaultlib:user64.lib /entry:main

; compile: I could not compile the 32-bit version using the Visual Studio Tools because the file kernel.inc does not exist
; To compile install the MASM SDK (http://www.codingcrew.de/masm32/index.php)
; "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x86\ml.exe" main_masm_x86.asm /link /subsystem:windows /I"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x86" /defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x86\kernel32.lib" /defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x86\user32.lib" /entry:Main

; compile: this works!!! Needs MASM SDK installation: (http://www.codingcrew.de/masm32/index.php)
; compile without link
; C:\masm32\bin\ml.exe /c /coff /Cp main_masm_x86.asm 
; perform link
; C:\masm32\bin\link /subsystem:windows main_masm_x86.obj 

; https://stackoverflow.com/questions/1023593/how-to-write-hello-world-in-assembly-under-windows

;---ASM Hello World Win32 MessageBox

.386
.model flat, stdcall
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib
include C:\masm32\include\user32.inc
includelib C:\masm32\lib\user32.lib

.data
titletxt db 'Win32', 0
msg db 'Hello World', 0

.code

Main:
push 0            ; uType = MB_OK
push offset titletxt ; LPCSTR lpCaption
push offset msg   ; LPCSTR lpText
push 0            ; hWnd = HWND_DESKTOP
call MessageBoxA
push eax          ; uExitCode = MessageBox(...)
call ExitProcess

End Main