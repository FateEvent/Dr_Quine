global ft_list_sort
section .text

; ft_list_sort sorts the list's elements by ascending order by
; comparing two elements by comparing their data with a function
;
; 0 - rdi	t_list **		list_start
; 1 - rsi	int				(*cmp)()
;
; The function does not return

%macro SAVE_VARS 0
	push	r8
	push	r9
	push	r10
	push	r11
%endmacro

%macro GET_VARS 0
	pop		r11
	pop		r10
	pop		r9
	pop		r8
%endmacro

ft_list_sort:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, BYTE 0				; check if list_start is null
	je		.return
	cmp		BYTE [rdi], BYTE 0
	je		.return
	cmp		rsi, BYTE 0				; check if cmp is null
	je		.return

	xor		r8, r8					; R8 will store our t_list *current_node variable
	xor		r9, r9					; R9 will store our t_list *tmp_node var
	xor		r10, r10				; R10 will store our void *tmp_data var
	xor		r11, r11

	mov		r11, rsi				; copying cmp ptr on R11

	mov		r8, [rdi]				; assigning to current_node the beginning of the list


.loop:
	cmp		r8, BYTE 0				; checking if current_node->next ptr is null
	je		.return

	mov		r9, [r8 + 8]			; tmp_node = current_node->next;


.cmp_loop:
	cmp		r9, 0					; checking if current_node->next ptr is null
	je		.return

	; preparing to call cmp on the first list element
	mov		rdi, [r8]				; setting current_node->data on RDI
	mov		rsi, [r9]				; setting tmp_node->data on RSI

	SAVE_VARS

	call	r11						; calling cmp(current_node->data, tmp_node->data)

	GET_VARS

	cmp		rax, 0					; checking the return of cmp
	jg		.swap_data

	jmp		.advance_cursor_nodes


.swap_data:
	mov		r10, [r9]				; tmp_data = tmp_node->data;
	mov		rax, [r8]				; tmp_node->data = current_node->data;
	mov		[r9], rax
	mov		[r8], r10				; current_node->data = tmp_data;


.advance_cursor_nodes:
	mov		r9, [r9 + 8]
	cmp		r9, 0
	jne		.cmp_loop
	mov		r8, [r8 + 8]
	jmp		.loop


.return:
	leave
	ret
