section .text
GLOBAL write

;--------------------------------
;int write(int fd, char * buff, size_t count)
;---------------------------------------
write:
	;Armo stack
	push ebp
	mov ebp, esp

	;Guardo estado de registros
	push ebx
	push ecx
	push edx


	mov eax, 0x04     ;sys call id para write
	mov ebx, [ebp+8]  ; fd
	mov ecx, [ebp+12] ; buff
	mov edx, [ebp+16] ; count
	int 80h           ;ejecuto syscall

	;Recupero registros
	pop edx
	pop ecx
	pop ebx

	;Desarmo stack
	mov esp, ebp
	pop ebp
	ret
	