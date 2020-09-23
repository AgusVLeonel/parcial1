
GLOBAL print
GLOBAL exit
GLOBAL numToString

section .text

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; exit - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret
;-----------------------------------------------------------
; Argumentos:
;	ebp+12: puntero al numero
;	ebp+8: puntero a la cadena
; Retorno:
;	eax: puntero a la cadena
;-----------------------------------------------------------
numToString:
	
	push	ebp
	mov	ebp,esp

	mov	ebx,[ebp+8]	;cargo el puntero a la cadena
	add	ebx,9
	mov byte [ebx],0
	mov ecx,10		;divisor
	mov	eax,[ebp+12]	;dividendo
dividir	mov	edx,0		;limpio
	div	ecx
	dec	ebx
	add	dl,30h
	mov byte [ebx],dl
	cmp	eax,0
	jz	end
	jmp	dividir
	
end	mov	eax,ebx	
	mov	esp,ebp
	pop	ebp	
	ret
	
section .bss
bebp resb 4

	

		

	

