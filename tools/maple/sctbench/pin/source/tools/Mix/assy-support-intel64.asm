
	.CODE
	ALIGN 4
	mix_fp_save PROC
	fxsave  BYTE PTR [rcx]
	emms
	ret 
	mix_fp_save ENDP

	.CODE
	ALIGN 4
	mix_fp_restore PROC
	fxrstor  BYTE PTR [rcx]
	ret 
	mix_fp_restore ENDP

	END
