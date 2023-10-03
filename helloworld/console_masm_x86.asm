; https://doc.lagout.org/operating%20system%20/Windows/winasmtut.pdf
;
; Needs MASM SDK installation: (http://www.codingcrew.de/masm32/index.php)
;
; C:\masm32\bin\ml.exe /c /coff /Cp console_masm_x86.asm 
; C:\masm32\bin\link /subsystem:console console_masm_x86.obj
; .\console_masm_x86.exe

.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
.data
 HelloWorld db "Hello World!", 0
.code
start:
 invoke StdOut, addr HelloWorld
 invoke ExitProcess, 0
end start