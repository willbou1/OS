.section .text 

.extern handleIRQ
.extern handleException

.global _exception0
_exception0:
	pushal
	pushl $0
	pushl $0
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception1
_exception1:
	pushal
	pushl $0
	pushl $1
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception2
_exception2:
	pushal
	pushl $0
	pushl $2
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception3
_exception3:
	pushal
	pushl $0
	pushl $3
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception4
_exception4:
	pushal
	pushl $0
	pushl $4
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception5
_exception5:
	pushal
	pushl $0
	pushl $5
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception6
_exception6:
	pushal
	pushl $0
	pushl $6
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception7
_exception7:
	pushal
	pushl $0
	pushl $7
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception8
_exception8:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $8
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception9
_exception9:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $9
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception10
_exception10:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $10
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception11
_exception11:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $11
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception12
_exception12:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $12
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception13
_exception13:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $13
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception14
_exception14:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $14
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception15
_exception15:
	pushal
	pushl $0
	pushl $15
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception16
_exception16:
	pushal
	pushl $0
	pushl $16
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception17
_exception17:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $17
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception18
_exception18:
	pushal
	pushl $0
	pushl $18
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception19
_exception19:
	pushal
	pushl $0
	pushl $19
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception20
_exception20:
	pushal
	pushl $0
	pushl $20
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception21
_exception21:
	pushal
	pushl $0
	pushl $21
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception22
_exception22:
	pushal
	pushl $0
	pushl $22
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception23
_exception23:
	pushal
	pushl $0
	pushl $23
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception24
_exception24:
	pushal
	pushl $0
	pushl $24
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception25
_exception25:
	pushal
	pushl $0
	pushl $25
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception26
_exception26:
	pushal
	pushl $0
	pushl $26
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception27
_exception27:
	pushal
	pushl $0
	pushl $27
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception28
_exception28:
	pushal
	pushl $0
	pushl $28
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception29
_exception29:
	pushal
	pushl $0
	pushl $29
	call handleException
	add $8, %esp
	popal
	iretl

.global _exception30
_exception30:
	pushl %eax
	movl 4+(%esp), %eax
	pushal
	pushl %eax
	pushl $30
	call handleException
	add $8, %esp
	popal
	popl %eax
	add $4, %esp
	iretl

.global _exception31
_exception31:
	pushal
	pushl $0
	pushl $31
	call handleException
	add $8, %esp
	popal
	iretl

.global _unused
_unused:
	iretl

.global _irq32
_irq32:
	pushal
	pushl $32
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq33
_irq33:
	pushal
	pushl $33
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq34
_irq34:
	pushal
	pushl $34
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq35
_irq35:
	pushal
	pushl $35
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq36
_irq36:
	pushal
	pushl $36
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq37
_irq37:
	pushal
	pushl $37
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq38
_irq38:
	pushal
	pushl $38
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq39
_irq39:
	pushal
	pushl $39
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq40
_irq40:
	pushal
	pushl $40
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq41
_irq41:
	pushal
	pushl $41
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq42
_irq42:
	pushal
	pushl $42
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq43
_irq43:
	pushal
	pushl $43
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq44
_irq44:
	pushal
	pushl $44
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq45
_irq45:
	pushal
	pushl $45
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq46
_irq46:
	pushal
	pushl $46
	call handleIRQ
	add $4, %esp
	popal
	iretl

.global _irq47
_irq47:
	pushal
	pushl $47
	call handleIRQ
	add $4, %esp
	popal
	iretl