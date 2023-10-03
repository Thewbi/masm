; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe
; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x86\ml.exe
; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx86\x64
; C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx86\x86\ml64.exe

; "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe" main_masm_x64.asm /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:main
; "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe" main_masm_x64.asm /link /subsystem:windows /defaultlib:kernel64.lib /defaultlib:user64.lib /entry:main

; compile:
; "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe" main_masm_x64.asm /link /subsystem:windows /defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64\kernel32.lib" /defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64\user32.lib" /entry:main

; https://stackoverflow.com/questions/1023593/how-to-write-hello-world-in-assembly-under-windows

;---ASM Hello World Win64 MessageBox

extrn MessageBoxA: PROC
extrn ExitProcess: PROC

.data
titletxt db 'Win64', 0
msg db 'Hello World!', 0

.code
main proc
  sub rsp, 28h  
  mov rcx, 0       ; hWnd = HWND_DESKTOP
  lea rdx, msg     ; LPCSTR lpText
  lea r8, titletxt   ; LPCSTR lpCaption
  mov r9d, 0       ; uType = MB_OK
  call MessageBoxA
  add rsp, 28h  
  mov ecx, eax     ; uExitCode = MessageBox(...)
  call ExitProcess
main endp

End