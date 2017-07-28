#!/usr/bin/ruby

$debug = 0
#--------------------------------------------
# 	Process for each instruction			#
#--------------------------------------------
# 1. Parse instruction name (happens in main) and pass control to instruction function (with same name)
# 2. Instruction function passes machine codes to subfunctions that support the encoding used
# => It's the subfunctions that are responsible for checking which machine encoding is used,
# => This is becuase these subfunctions are instruction agnostic; they just process the structure

def main
#--------------------------------------------
# 	Read Each Instruction From Input		#
#--------------------------------------------
	while 1 do
		print 'irasm > '						#Prompt
		asm = gets.chomp						#Get assembly instruction
		if /(quit|(?<!s)exit)/i.match(asm)		#If it's quit or exit
			exit								#	Exit the script
		end										#Otherwise start looking for instruction names

#--------------------------------------------
# 	Routines for Each Instruction			#
#--------------------------------------------

		case
			when asm.match(/^aaa/i)
				#ASCII Adjust After Addition
				printf("%-34s%-15s\n\n", '37', 'aaa')
			when asm.match(/^aad/i)
				#ASCII Adjust AX Before Division
				printf("%-34s%-15s\n\n", 'D50A', 'aad')
				printf("%-34s%-15s\n\n", 'D5XX', 'aad imm8 (Machine Code Only, XX is base)')
			when asm.match(/^aam/i)
				#ASCII Adjust AX After Multiply
				printf("%-34s%-15s\n\n", 'D40A', 'aam')
				printf("%-34s%-15s\n\n", 'D4XX', 'aam imm8 (Machine Code Only, XX is base)')	
			when asm.match(/^aas/i)
				#ASCII Adjust AL After Subtraction
				printf("%-34s%-15s\n\n", '3F', 'aas')
			when asm.match(/^adc[^x]/i)
				#Add with Carry
				if alimm8(asm, '14', '80D0')	
				elsif aximm16(asm, '6615', '6681D0', '6683D0')
				elsif eaximm32(asm, '15', '81D0', '83D0')		
				elsif modrmimm(asm, 'adc', '80', '2')
				elsif modrmmodrm(asm, '10')		
				else nasm(asm) end
			when asm.match(/^adcx/i)
				#Unsigned Integer Addition of Two Operands with Cary Flag
				if modrmmodrm(asm, '660F38F6')		
				else nasm(asm) end
			when asm.match(/^add/i)
				#Add
				if alimm8(asm, '04', '80C0')
				elsif aximm16(asm, '6605', '6681C0', '6683C0')
				elsif eaximm32(asm, '05', '81C0', '83C0')
				elsif modrmimm(asm, 'add', '80', '0')	
				elsif modrmmodrm(asm, '00')			
				else nasm(asm) end
			when asm.match(/^adox/i)
				#Unsigned Integer Addition of Two Operands with Overflow Flag
				if modrmmodrm(asm, 'F30F38F6')		
				else nasm(asm) end
			when asm.match(/^and/i)
				#Logical AND
				if alimm8_b(asm, '25', '81E0', '6625', '6681E0', '24', '80E0', '6683E0')
				elsif aximm16_b(asm, '25', '81E0', '6625', '6681E0', '24', '80E0', '6683E0')
				elsif eaximm32_b(asm, '25', '81E0', '6625', '6681E0', '24', '80E0', '6683E0')
				elsif modrmimm(asm, 'and', '80', '4')	
				elsif modrmmodrm(asm, '20')			
				else nasm(asm) end
			when asm.match(/^arpl/i)
				#Unsigned Integer Addition of Two Operands with Overflow Flag
				if modrmmodrm(asm, '63')		
				else nasm(asm) end
			when asm.match(/^bound/i)
				#Bound
				if modrmmodrm(asm, '62')			
				else nasm(asm) end
			when asm.match(/^bsf/i)
				#Bit Scan Forward
				if modrmmodrm(asm, '0FBC')		
				else nasm(asm) end
			when asm.match(/^bsr/i)
				#Bit Scan Reverse
				if modrmmodrm(asm, '0FBD')		
				else nasm(asm) end
			when asm.match(/^bswap/i)
				#Compare Two Operands
				if plusreg(asm, '0FC8')		
				else nasm(asm) end
			when asm.match(/^call\s/i)
				#Call
				if jcc(asm, 'E8')
				elsif ptr(asm, '9A')	
				elsif opmodrm(asm, 'FE', '2')	#Actually FF, but gets converted just fine
				else nasm(asm) end
			when asm.match(/^cbw/i)
				#Convert Byte to Word
				printf("%-34s%-15s\n\n", '6698', 'cbw')
			when asm.match(/^cflush\s/i)
				#Flush Case Line
				if opmodrm(asm, '0FAE', '7')	#Actually FF, but gets converted just fine
				else nasm(asm) end
			when asm.match(/^cwde/i)
				#Convert Word to Doubleword
				printf("%-34s%-15s\n\n", '98', 'cwde')
			when asm.match(/^clac/i)
				#Clear AC Flag in EFLAGS Register
				printf("%-34s%-15s\n\n", '0F01CA', 'clac')
			when asm.match(/^clc/i)
				#Clear Carry Flag
				printf("%-34s%-15s\n\n", 'F8', 'clc')
			when asm.match(/^cld/i)
				#Clear Direction Flag
				printf("%-34s%-15s\n\n", 'FC', 'cld')
			when asm.match(/^cli/i)
				#Clear Interupt Flag
				printf("%-34s%-15s\n\n", 'FA', 'cli')
			when asm.match(/^clts/i)
				#Clear Task-Switched Flag in CR0
				printf("%-34s%-15s\n\n", '0F06', 'clts')
			when asm.match(/^cmc/i)
				#Complement Carry Flag
				printf("%-34s%-15s\n\n", 'F5', 'cmc')
			when asm.match(/^cmova\s/i)
				#Move if Above
				if modrmmodrm(asm, '0F47')		
				else nasm(asm) end
			when asm.match(/^cmovae\s/i)
				#Move if Above or Equal
				if modrmmodrm(asm, '0F43')		
				else nasm(asm) end
			when asm.match(/^cmovb\s/i)
				#Move if Below
				if modrmmodrm(asm, '0F42')		
				else nasm(asm) end
			when asm.match(/^cmovbe\s/i)
				#Move if Below or Equal
				if modrmmodrm(asm, '0F46')		
				else nasm(asm) end
			when asm.match(/^cmovc\s/i)
				#Move if Carry
				if modrmmodrm(asm, '0F42')		
				else nasm(asm) end
			when asm.match(/^cmove\s/i)
				#Move if Equal
				if modrmmodrm(asm, '0F44')		
				else nasm(asm) end
			when asm.match(/^cmovg\s/i)
				#Move if Greater Than
				if modrmmodrm(asm, '0F4F')		
				else nasm(asm) end
			when asm.match(/^cmovge\s/i)
				#Move if Greater Than or Equal
				if modrmmodrm(asm, '0F4D')		
				else nasm(asm) end
			when asm.match(/^cmovl\s/i)
				#Move if Lesser Than
				if modrmmodrm(asm, '0F4C')		
				else nasm(asm) end
			when asm.match(/^cmovle\s/i)
				#Move if Lesser Than or Equal
				if modrmmodrm(asm, '0F4E')		
				else nasm(asm) end
			when asm.match(/^cmovna\s/i)
				#Move if Not Above
				if modrmmodrm(asm, '0F46')		
				else nasm(asm) end
			when asm.match(/^cmovnae\s/i)
				#Move if Not Above or Equal
				if modrmmodrm(asm, '0F42')		
				else nasm(asm) end
			when asm.match(/^cmovnb\s/i)
				#Move if Not Below
				if modrmmodrm(asm, '0F43')		
				else nasm(asm) end
			when asm.match(/^cmovnbe\s/i)
				#Move if Not Below or Equal
				if modrmmodrm(asm, '0F47')		
				else nasm(asm) end
			when asm.match(/^cmovnc\s/i)
				#Move if Not Carry
				if modrmmodrm(asm, '0F43')		
				else nasm(asm) end
			when asm.match(/^cmovne\s/i)
				#Move if Not Equal
				if modrmmodrm(asm, '0F45')		
				else nasm(asm) end
			when asm.match(/^cmovng\s/i)
				#Move if Not Greater Than
				if modrmmodrm(asm, '0F4E')		
				else nasm(asm) end
			when asm.match(/^cmovnl\s/i)
				#Move if Not Lesser Than
				if modrmmodrm(asm, '0F4D')		
				else nasm(asm) end
			when asm.match(/^cmovnle\s/i)
				#Move if Not Lesser Than or Equal
				if modrmmodrm(asm, '0F4F')		
				else nasm(asm) end
			when asm.match(/^cmovno\s/i)
				#Move if Not Over
				if modrmmodrm(asm, '0F41')		
				else nasm(asm) end
			when asm.match(/^cmovnp\s/i)
				#Move if Not Parity
				if modrmmodrm(asm, '0F4B')		
				else nasm(asm) end
			when asm.match(/^cmovns\s/i)
				#Move if Not Sign Flag
				if modrmmodrm(asm, '0F49')		
				else nasm(asm) end
			when asm.match(/^cmovnz\s/i)
				#Move if Not Zero
				if modrmmodrm(asm, '0F45')		
				else nasm(asm) end
			when asm.match(/^cmovo\s/i)
				#Move if Over
				if modrmmodrm(asm, '0F40')		
				else nasm(asm) end
			when asm.match(/^cmovp\s/i)
				#Move if Parity
				if modrmmodrm(asm, '0F4A')		
				else nasm(asm) end
			when asm.match(/^cmovpe\s/i)
				#Move if Parity Even
				if modrmmodrm(asm, '0F4A')		
				else nasm(asm) end
			when asm.match(/^cmovpo\s/i)
				#Move if Parity Odd
				if modrmmodrm(asm, '0F4B')		
				else nasm(asm) end
			when asm.match(/^cmovs\s/i)
				#Move if Sign Flag
				if modrmmodrm(asm, '0F48')		
				else nasm(asm) end
			when asm.match(/^cmovz\s/i)
				#Move if Zero
				if modrmmodrm(asm, '0F44')		
				else nasm(asm) end
			when asm.match(/^cmp[^sx]/i)
				#Compare Two Operands
				if alimm8_c(asm, '3C', '80F8')
				elsif aximm16_c(asm, '663D', '6681F8', '6683F8')
				elsif eaximm32_c(asm, '3D', '81F8', '83F8')
				elsif modrmimm(asm, 'cmp', '80', '7')	
				elsif modrmmodrm(asm, '38')			
				else nasm(asm) end
			when asm.match(/^cmpsb/i)
				#Compare String Operands (Byte)
				printf("%-34s%-15s\n\n", 'A6', 'cmpsb')
			when asm.match(/^cmpsw/i)
				#Compare String Operands (Word)
				printf("%-34s%-15s\n\n", '66A7', 'cmpsw (WORD PTR ds:[esi],WORD PTR es:[edi])')
			when asm.match(/^cmpsd/i)
				#Compare String Operands (Doubleword)
				printf("%-34s%-15s\n\n", 'A7', 'cmpsd (DWORD PTR ds:[esi],DWORD PTR es:[edi])')
			when asm.match(/^cmpxchg/i)
				#Compare Two Operands
				if modrmmodrm(asm, '0FB0')			
				else nasm(asm) end
			when asm.match(/^cpuid/i)
				#CPU Identification
				printf("%-34s%-15s\n\n", '0FA2', 'cpuid')
			when asm.match(/^crc32\s/i)
				#Accumulate CRC32 Value
				if modrmmodrm(asm, 'F20F38F1')		
				else nasm(asm) end
			when asm.match(/^cwd/i)
				#Convert Word to Doubleword
				printf("%-34s%-15s\n\n", '6699', 'cwd')
			when asm.match(/^cdq/i)
				#Convert Doubleword to Quadword
				printf("%-34s%-15s\n\n", '99', 'cdq')
			when asm.match(/^daa/i)
				#Decimal Adjust AL after Addition
				printf("%-34s%-15s\n\n", '27', 'daa')
			when asm.match(/^das/i)
				#Decimal Adjust AL after Subtraction
				printf("%-34s%-15s\n\n", '2F', 'das')
			when asm.match(/^dec/i)
				#Compare Two Operands
				if opmodrm(asm, 'FE', '1')			
				else nasm(asm) end
			when asm.match(/^div/i)
				#Compare Two Operands
				if opmodrm(asm, 'F6', '6')			
				else nasm(asm) end
			when asm.match(/^emms/i)
				#Empty MMX Technology State
				printf("%-34s%-15s\n\n", '0F77', 'emms')
			when asm.match(/^enter/i)
				if imm16imm8(asm, 'C8')		
				else nasm(asm) end
			when asm.match(/^f2xm1/i)
				#Compute 2^x-1
				printf("%-34s%-15s\n\n", 'D9F0', 'f2xm1')
			when asm.match(/^fabs/i)
				#Absolute Value
				printf("%-34s%-15s\n\n", 'D9E1', 'fabs')
			when asm.match(/^faddp/i)
				#Floating Point Add
				printf("%-34s%-15s\n\n", 'DEC1', 'faddp (faddp  st(1),st)')
			when asm.match(/^fchs/i)
				#Change Sign
				printf("%-34s%-15s\n\n", 'D9E0', 'fchs')
			when asm.match(/^fclex/i)
				#Clear Exceptions
				printf("%-34s%-15s\n\n", '9BDBE2', 'fclex')
			when asm.match(/^fnclex/i)
				#Clear Exceptions
				printf("%-34s%-15s\n\n", 'DBE2', 'fnclex')
			when asm.match(/^fcom$/i)
				#Compare Floating Point Values
				printf("%-34s%-15s\n\n", 'D8D1', 'fcom (st(1))')
			when asm.match(/^fcomp$/i)
				#Compare Floating Point Values and Pop
				printf("%-34s%-15s\n\n", 'D8D9', 'fcomp (st(1))')
			when asm.match(/^fcompp/i)
				#Compare Floating Point Values and Pop Twice
				printf("%-34s%-15s\n\n", 'DED9', 'fcompp')
			when asm.match(/^fcos/i)
				#Cosine
				printf("%-34s%-15s\n\n", 'D9FF', 'fcos')
			when asm.match(/^fdecstp/i)
				#Decrement Stack-Top Pointer
				printf("%-34s%-15s\n\n", 'D9F6', 'fdecstp')
			when asm.match(/^fdivp/i)
				#Divide
				printf("%-34s%-15s\n\n", 'DEF9', 'fdivp (st(1),st)')
			when asm.match(/^fdivrp/i)
				#Reverese Divide
				printf("%-34s%-15s\n\n", 'DEF1', 'fdivrp (st(1),st)')
			when asm.match(/^fincstp/i)
				#Increment Stack-Top Pointer
				printf("%-34s%-15s\n\n", 'D9F7', 'fincstp')
			when asm.match(/^finit/i)
				#Initialize Floating-Point Unit
				printf("%-34s%-15s\n\n", '9BDBE3', 'finit')
			when asm.match(/^fninit/i)
				#Initialize Floating-Point Unit
				printf("%-34s%-15s\n\n", 'DBE3', 'fninit')
			when asm.match(/^fld1$/i)
				#Load Constant (Push +1.0 onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9E8', 'fld1')
			when asm.match(/^fldl2t$/i)
				#Load Constant (Push log2,10 onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9E9', 'fldl2t')				
			when asm.match(/^fldl2e$/i)
				#Load Constant (Push log2,e onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9EA', 'fldl2e')
			when asm.match(/^fldpi$/i)
				#Load Constant (Push pi onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9EB', 'fldpi')
			when asm.match(/^fldlg2$/i)
				#Load Constant (Push log10,2 onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9EC', 'fldlg2')
			when asm.match(/^fldln2$/i)
				#Load Constant (Push log e,2 onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9ED', 'fldln2')
			when asm.match(/^fldz$/i)
				#Load Constant (Push +0.0 onto the FPU register stack)
				printf("%-34s%-15s\n\n", 'D9EE', 'fldz')
			when asm.match(/^fmulp/i)
				#Multiply
				printf("%-34s%-15s\n\n", 'DEC9', 'fmulp (st(1),st)')
			when asm.match(/^fnop$/i)
				#Floating Point NOP
				printf("%-34s%-15s\n\n", 'D9D0', 'fnop')
			when asm.match(/^fpatan$/i)
				#Partial Arctangent
				printf("%-34s%-15s\n\n", 'D9F3', 'fpatan')
			when asm.match(/^fprem$/i)
				#Partial Remainder
				printf("%-34s%-15s\n\n", 'D9F8', 'fprem')
			when asm.match(/^fprem1$/i)
				#Partial Remainder
				printf("%-34s%-15s\n\n", 'D9F5', 'fprem1')
			when asm.match(/^fptan$/i)
				#Partial Tangent
				printf("%-34s%-15s\n\n", 'D9F2', 'fptan')
			when asm.match(/^frndint$/i)
				#Round to Integer
				printf("%-34s%-15s\n\n", 'D9FC', 'frndint')
			when asm.match(/^fscale$/i)
				#Scale
				printf("%-34s%-15s\n\n", 'D9FD', 'fscale')
			when asm.match(/^fsin$/i)
				#Sine
				printf("%-34s%-15s\n\n", 'D9FE', 'fsin')
			when asm.match(/^fsincos$/i)
				#Sine and Cosine
				printf("%-34s%-15s\n\n", 'D9FB', 'fsincos')
			when asm.match(/^fsqrt$/i)
				#Square Root
				printf("%-34s%-15s\n\n", 'D9FA', 'fsqrt')
			when asm.match(/^fstswax$/i)
				#Store x87 FPU Status Word
				printf("%-34s%-15s\n\n", '9BDFE0', 'fstsw ax')
			when asm.match(/^fnstswax$/i)
				#Store x87 FPU Status Word (without checking for pending unmasked floating-point exceptions)
				printf("%-34s%-15s\n\n", 'DFE0', 'fnstsw ax')
			when asm.match(/^fsubp$/i)
				#Subtract
				printf("%-34s%-15s\n\n", 'DEE9', 'fsubp')
			when asm.match(/^fsubrp$/i)
				#Reverse Subtract
				printf("%-34s%-15s\n\n", 'DEE1', 'fsubrp')
			when asm.match(/^ftst$/i)
				#Test
				printf("%-34s%-15s\n\n", 'D9E4', 'ftst')
			when asm.match(/^fucom$/i)
				#Unordered Compare Floating Point Values
				printf("%-34s%-15s\n\n", 'DDE1', 'fucom (st(1))')
			when asm.match(/^fucomp$/i)
				#Unordered Compare Floating Point Values and pop register stack
				printf("%-34s%-15s\n\n", 'DDE9', 'fucomp (st(1))')
			when asm.match(/^fucompp$/i)
				#Unordered Compare Floating Point Values and pop register stack twice
				printf("%-34s%-15s\n\n", 'DAE9', 'fucompp')
			when asm.match(/^fxam$/i)
				#Examine ModR/M
				printf("%-34s%-15s\n\n", 'D9E5', 'fxam')
			when asm.match(/^fxch$/i)
				#Exchange Register Contents
				printf("%-34s%-15s\n\n", 'D9C9', 'fxch (st(1))')
			when asm.match(/^fxtract$/i)
				#Extract Exponent and Significand
				printf("%-34s%-15s\n\n", 'D9F4', 'fxtract') 
			when asm.match(/^fyl2x$/i)
				#Compute y * log2, x
				printf("%-34s%-15s\n\n", 'D9F1', 'fyl2x')
			when asm.match(/^fyl2xp1$/i)
				#Compute y * log2(x+1)
				printf("%-34s%-15s\n\n", 'D9F9', 'fyl2xp1')
			when asm.match(/^hlt$/i)
				#Halt
				printf("%-34s%-15s\n\n", 'F4', 'hlt')
			when asm.match(/^idiv\s/i)
				#Compare Two Operands
				if opmodrm(asm, 'F6', '7')			
				else nasm(asm) end
			when asm.match(/^imul\s/i)
				#Compare Two Operands
				if modrmmodrm(asm, '0FAF')		
				elsif opmodrm(asm, 'F6', '5')
				else nasm(asm) end
			when asm.match(/^in\s/i)
				#Input from Port
				if alimm8_d(asm, 'E4', 'E5')
				elsif inaldx(asm)		
				else nasm(asm) end
			when asm.match(/^int(3$|\s)/i)
				#Interupt
				if opimm8(asm, 'CD')		
				else nasm(asm) end
			when asm.match(/^inc\s/i)
				#Compare Two Operands
				if opmodrm(asm, 'FE', '0')			
				else nasm(asm) end
			when asm.match(/^insb$/i)
				#Input from Port to String (Byte)
				printf("%-34s%-15s\n\n", '6C', 'insb (BYTE PTR es:[edi],dx)')
			when asm.match(/^insw$/i)
				#Input from Port to String (Word)
				printf("%-34s%-15s\n\n", '666D', 'insw (WORD PTR es:[edi],dx)')
			when asm.match(/^insd$/i)
				#Input from Port to String (DWword)
				printf("%-34s%-15s\n\n", '6D', 'insd (DWORD PTR es:[edi],dx)')
			when asm.match(/^into$/i)
				#Call to Interrupt Procedure
				printf("%-34s%-15s\n\n", 'CE', 'into')
			when asm.match(/^invd$/i)
				#Invalidate Internal Caches
				printf("%-34s%-15s\n\n", '0F08', 'invd')
			when asm.match(/^invlpg\s/i)
				#Invalidate TLB Entries
				if opmodrm(asm, '0F01', '7')			
				else nasm(asm) end
			when asm.match(/^iretw$/i)
				#Interrupt Return (Word)
				printf("%-34s%-15s\n\n", '66CF', 'iretw')
			when asm.match(/^iretd?$/i)
				#Interrupt Return, this applies for IRET and IRTED
				printf("%-34s%-15s\n\n", 'CF', asm)
			when asm.match(/^ja\s/i)
				#Jump if Above
				if jcc(asm, '77')		
				else nasm(asm) end
			when asm.match(/^jae\s/i)
				#Jump if Above or Equal
				if jcc(asm, '73')		
				else nasm(asm) end
			when asm.match(/^jb\s/i)
				#Jump if Below
				if jcc(asm, '72')		
				else nasm(asm) end
			when asm.match(/^jbe\s/i)
				#Jump if Below or Equal
				if jcc(asm, '76')		
				else nasm(asm) end
			when asm.match(/^jc\s/i)
				#Jump if Carry
				if jcc(asm, '72')		
				else nasm(asm) end
			when asm.match(/^je\s/i)
				#Jump if Equal
				if jcc(asm, '74')		
				else nasm(asm) end
			when asm.match(/^jg\s/i)
				#Jump if Greater Than
				if jcc(asm, '7F')		
				else nasm(asm) end
			when asm.match(/^jge\s/i)
				#Jump if Greater Than or Equal
				if jcc(asm, '7D')		
				else nasm(asm) end
			when asm.match(/^jl\s/i)
				#Jump if Lesser Than
				if jcc(asm, '7C')		
				else nasm(asm) end
			when asm.match(/^jle\s/i)
				#Jump if Lesser Than or Equal
				if jcc(asm, '7E')		
				else nasm(asm) end
			when asm.match(/^jna\s/i)
				#Jump if Not Above
				if jcc(asm, '76')		
				else nasm(asm) end
			when asm.match(/^jnae\s/i)
				#Jump if Not Above or Equal
				if jcc(asm, '72')		
				else nasm(asm) end
			when asm.match(/^jnb\s/i)
				#Jump if Not Below
				if jcc(asm, '73')		
				else nasm(asm) end
			when asm.match(/^jnbe\s/i)
				#Jump if Not Below or Equal
				if jcc(asm, '77')		
				else nasm(asm) end
			when asm.match(/^jnc\s/i)
				#Jump if Not Carry
				if jcc(asm, '73')		
				else nasm(asm) end
			when asm.match(/^jne\s/i)
				#Jump if Not Equal
				if jcc(asm, '75')		
				else nasm(asm) end
			when asm.match(/^jng\s/i)
				#Jump if Not Greater Than
				if jcc(asm, '7E')		
				else nasm(asm) end
			when asm.match(/^jnl\s/i)
				#Jump if Not Lesser Than
				if jcc(asm, '7D')		
				else nasm(asm) end
			when asm.match(/^jnle\s/i)
				#Jump if Not Lesser Than or Equal
				if jcc(asm, '7F')		
				else nasm(asm) end
			when asm.match(/^jno\s/i)
				#Jump if Not Over
				if jcc(asm, '71')		
				else nasm(asm) end
			when asm.match(/^jnp\s/i)
				#Jump if Not Parity
				if jcc(asm, '7B')		
				else nasm(asm) end
			when asm.match(/^jns\s/i)
				#Jump if Not Sign Flag
				if jcc(asm, '79')		
				else nasm(asm) end
			when asm.match(/^jnz\s/i)
				#Jump if Not Zero
				if jcc(asm, '75')		
				else nasm(asm) end
			when asm.match(/^jo\s/i)
				#Jump if Over
				if jcc(asm, '70')		
				else nasm(asm) end
			when asm.match(/^jp\s/i)
				#Jump if Parity
				if jcc(asm, '7A')		
				else nasm(asm) end
			when asm.match(/^jpe\s/i)
				#Jump if Parity Even
				if jcc(asm, '7A')		
				else nasm(asm) end
			when asm.match(/^jpo\s/i)
				#Jump if Parity Odd
				if jcc(asm, '7B')		
				else nasm(asm) end
			when asm.match(/^js\s/i)
				#Jump if Sign Flag
				if jcc(asm, '78')		
				else nasm(asm) end
			when asm.match(/^jmp\s/i)
				#Jump
				if jcc(asm, 'EB')	
				elsif ptr(asm, 'EA')
				elsif opmodrm(asm, 'FE', '4')	#Actually FF, but gets converted just fine		
				else nasm(asm) end
			when asm.match(/^jz\s/i)
				#Jump if Zero
				if jcc(asm, '74')		
				else nasm(asm) end
			when asm.match(/^lahf$/i)
				#Load Status Flags into AH Register
				printf("%-34s%-15s\n\n", '9F', 'lahf')
			when asm.match(/^lea\s/i)
				#lea
				if modrmmodrm(asm, '8D')		
				else nasm(asm) end
			when asm.match(/^leave$/i)
				#High Level Procedure Exit
				printf("%-34s%-15s\n\n", 'C9', 'leave') 
			when asm.match(/^leavew$/i)
				#High Level Procedure Exit (Word)
				printf("%-34s%-15s\n\n", '66C9', 'leavew')
			when asm.match(/^lfence$/i)
				#Load Fence
				fence('lfence', '0FAE', 'E8')
			when asm.match(/^lldt\s/i)
				#Load Local Descriptor Table Register
				if opmodrm(asm, '0F00', '2')
				else nasm(asm) end
			when asm.match(/^lmsw\s/i)
				#Load Machine Status Word
				if opmodrm(asm, '0F01', '6')
				else nasm(asm) end
			when asm.match(/^lock$/i)
				lock(asm)					#Find a way to handle
			when asm.match(/^lodsb$/i)
				#Load String (Byte)
				printf("%-34s%-15s\n\n", 'AC', 'lodsb')
			when asm.match(/^lodsw$/i)
				#Load String (Word)
				printf("%-34s%-15s\n\n", '66AD', 'lodsw')
			when asm.match(/^lodsd$/i)
				#Load String (Doubleword)
				printf("%-34s%-15s\n\n", 'AD', 'lodsd')
			when asm.match(/^loop\s/i)
				#Loop
				if rel8(asm, 'E2')		
				else nasm(asm) end
			when asm.match(/^loope\s/i)
				#Loop if Equal
				if rel8(asm, 'E1')		
				else nasm(asm) end
			when asm.match(/^loopne\s/i)
				#Loop if Not Equal
				if rel8(asm, 'E0')		
				else nasm(asm) end
			when asm.match(/^ltr\s/i)
				#Load Task Register
				if opmodrm(asm, '0F00', '3')
				else nasm(asm) end
			when asm.match(/^mov\s/i)
				#Move
				if modrmimm(asm, 'mov', 'C6', '0')
				elsif modrmmodrm(asm, '88')			
				else nasm(asm) end
			when asm.match(/^mfence$/i)
				#Memory Fence
				fence('mfence', '0FAE', 'F0')
			when asm.match(/^monitor$/i)
				#Set Up Monitor Address
				printf("%-34s%-15s\n\n", '0F01C8', 'monitor')
			when asm.match(/^movsb$/i)
				#Move Data from String to String (Byte)
				printf("%-34s%-15s\n\n", 'A4', 'movsb')
			when asm.match(/^movsw$/i)
				#Move Data from String to String (Word)
				printf("%-34s%-15s\n\n", '66A5', 'movsw')
			when asm.match(/^movsd$/i)
				#Move Data from String to String (Doubleword)
				printf("%-34s%-15s\n\n", 'A5', 'movsd')
			when asm.match(/^mwait$/i)
				#Monitor Wait
				printf("%-34s%-15s\n\n", '0F01C9', 'mwait')
			when asm.match(/^nop$/i)
				#No Operation
				printf("%-34s%-15s\n\n", '90', 'nop')
			when asm.match(/^nop\s/i)
				#No Operation as a 'multibyte asm'
				if opmodrm(asm, '0F1F', '0')
				else nasm(asm) end
			when asm.match(/^or\s/i)
				#Logical Inclusive OR
				if alimm8_e(asm, '0D', '81C8', '660D', '6681C8', '0C', '80C8')
				elsif aximm16_e(asm, '0D', '81C8', '660D', '6681C8', '0C', '80C8', '6683C8')
				elsif eaximm32_e(asm, '0D', '81C8', '660D', '6681C8', '0C', '80C8', '83C8')
				elsif modrmimm(asm, 'or', '80', '1')		
				elsif modrmmodrm(asm, '08')			
				else nasm(asm) end
			when asm.match(/^outsb$/i)
				#Output String to Port (Byte)
				printf("%-34s%-15s\n\n", '6E', 'outsb')
			when asm.match(/^outsw$/i)
				#Output String to Port (Word)
				printf("%-34s%-15s\n\n", '666F', 'outsw')
			when asm.match(/^outsd$/i)
				#Output String to Port (Doubleword)
				printf("%-34s%-15s\n\n", '6F', 'outsd') 
			when asm.match(/^pause$/i)
				#Spin Loop Hint
				printf("%-34s%-15s\n\n", 'F390', 'pause')
			when asm.match(/^pop\s/i)
				#Compare Two Operands
				if opmodrm(asm, '8F', '0')		
				else nasm(asm) end
			when asm.match(/^popaw$/i)
				#Pop All General-Purpose Registers (Word)
				printf("%-34s%-15s\n\n", '6661', 'popaw')
			when asm.match(/^popad?$/i)
				#Pop All General-Purpose Registers
				printf("%-34s%-15s\n\n", '61', asm) 
			when asm.match(/^popcnt/i)
				#Return the Count of Number of Bits set to 1
				if modrmmodrm(asm, 'F30FB8')		
				else nasm(asm) end
			when asm.match(/^popfw$/i)
				#Pop Stack into EFLAGS Registers (Word)
				printf("%-34s%-15s\n\n", '669D', 'popfw')
			when asm.match(/^popfd?$/i)
				#Pop Stack into EFLAGS Registers
				printf("%-34s%-15s\n\n", '9D', asm)
			when asm.match(/^prefetch0\s/i)
				#Compare Two Operands
				if opmodrm(asm, '0F18', '1')		
				else nasm(asm) end
			when asm.match(/^prefetch1\s/i)
				#Compare Two Operands
				if opmodrm(asm, '0F18', '2')		
				else nasm(asm) end
			when asm.match(/^prefetch2\s/i)
				#Compare Two Operands
				if opmodrm(asm, '0F18', '3')		
				else nasm(asm) end
			when asm.match(/^prefetchnta\s/i)
				#Compare Two Operands
				if opmodrm(asm, '0F18', '0')		
				else nasm(asm) end 
			when asm.match(/^prefetchw\s/i)
				#Compare Two Operands
				if opmodrm(asm, '0F0D', '1')		
				else nasm(asm) end
			when asm.match(/^prefetchwt1\s/i)
				#Compare Two Operands
				if opmodrm(asm, '0F0D', '2')		
				else nasm(asm) end
			when asm.match(/^push\s/i)
				#Push data to the stack
				if opmodrm(asm, 'FE', '6')		#Actually FF, but gets converted just fine
				elsif pushimm(asm)	
				else nasm(asm) end
			when asm.match(/^pushaw$/i)
				#Push All General-Purpose Registers (Word)
				printf("%-34s%-15s\n\n", '6660', 'pushaw')
			when asm.match(/^pushad?$/i)
				#Push All General-Purpose Registers
				printf("%-34s%-15s\n\n", '60', asm)
			when asm.match(/^pushfw$/i)
				#Push EFLAGS Register onto the Stack (Word)
				printf("%-34s%-15s\n\n", '669C', 'pushfw')
			when asm.match(/^pushfd?$/i)
				#Push EFLAGS Register onto the Stack
				printf("%-34s%-15s\n\n", '9C', asm)
			when asm.match(/^rcl/i)
				#Rotate with Carry to the Left
				if modrmimm(asm, 'rcl', 'C0', '2')		
				else nasm(asm) end
			when asm.match(/^rcr/i)
				#Rotate with Carry to the Right
				if modrmimm(asm, 'rcr', 'C0', '3')
				else nasm(asm) end
			when asm.match(/^rdmsr$/i)
				#Read from Model Specific Register
				printf("%-34s%-15s\n\n", '0F32', 'rdmsr')
			when asm.match(/^rdpmc$/i)
				#Read Performance-Monitoring Counters
				printf("%-34s%-15s\n\n", '0F33', 'rdpmc')
			when asm.match(/^rdrand\s/i)
				#Random
				if plusreg(asm, '0FC7F0')		
				else nasm(asm) end
			when asm.match(/^rdseed\s/i)
				#Create Seed for Random
				if plusreg(asm, '0FC7F8')		
				else nasm(asm) end
			when asm.match(/^rdtsc$/i)
				#Read Time-Stamp Counter
				printf("%-34s%-15s\n\n", '0F31', 'rdtsc')
			when asm.match(/^rdtscp$/i)
				#Read Time-Stamp Counter and Processor ID
				printf("%-34s%-15s\n\n", '0F01F9', 'rdtscp')
			when asm.match(/^ret$/i)
				#Return from Procedure
				printf("%-34s%-15s\n\n", 'C3', 'ret')
			when asm.match(/^retf$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'CB', 'retf')
			when asm.match(/^rep\sinsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F36C', 'rep insb')
			when asm.match(/^rep\sinsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3666D', 'rep insw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F36D', 'rep insw')
			when asm.match(/^rep\sinsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F36D', 'rep insd')
			when asm.match(/^rep\smovsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3A4', 'rep movsb')
			when asm.match(/^rep\smovsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366A5', 'rep movsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3A5', 'rep movsw')
			when asm.match(/^rep\smovsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3A5', 'rep movsd')
			when asm.match(/^rep\soutsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F36E', 'rep outsb')
			when asm.match(/^rep\soutsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3666F', 'rep outsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F36F', 'rep outsw')
			when asm.match(/^rep\soutsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F36F', 'rep outsd')
			when asm.match(/^rep\slodsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AC', 'rep lodsb')
			when asm.match(/^rep\slodsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366AD', 'rep lodsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3AD', 'rep lodsw')
			when asm.match(/^rep\slodsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AD', 'rep lodsd')
			when asm.match(/^rep\sstosb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AA', 'rep stosb')
			when asm.match(/^rep\sstosw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366AB', 'rep stosw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3AB', 'rep stosw')
			when asm.match(/^rep\sstosd$/i)
				#Return from Procedure (Far)
			printf("%-34s%-15s\n\n", 'F3AB', 'rep lodsd')
			when asm.match(/^repe\scmpsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3A6', 'repe cmpsb')
			when asm.match(/^repe\scmpsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366A7', 'repe cmpsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3A7', 'repe cmpsw')
			when asm.match(/^repe\scmpsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3A7', 'repe cmpsd')
			when asm.match(/^repz\scmpsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3A6', 'repe cmpsb')
			when asm.match(/^repz\scmpsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366A7', 'repe cmpsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3A7', 'repe cmpsw')
			when asm.match(/^repz\scmpsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3A7', 'repe cmpsd')
			when asm.match(/^repe\sscasb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AE', 'repe scasb')
			when asm.match(/^repe\sscasw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366AF', 'repe scasw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3AF', 'repe scasw')
			when asm.match(/^repe\sscasd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AF', 'repe scasd')
			when asm.match(/^repz\sscasb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AE', 'repe scasb')
			when asm.match(/^repz\sscasw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F366AF', 'repe scasw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3AF', 'repe scasw')
			when asm.match(/^repz\sscasd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F3AF', 'repe scasd')
			when asm.match(/^repne\scmpsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2A6', 'repne cmpsb') 
			when asm.match(/^repne\scmpsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F266A7', 'repne cmpsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F2A7', 'repne cmpsw')
			when asm.match(/^repne\scmpsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2A7', 'repne cmpsd')
			when asm.match(/^repnz\scmpsb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2A6', 'repne cmpsb') 
			when asm.match(/^repnz\scmpsw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F266A7', 'repne cmpsw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F2A7', 'repne cmpsw')
			when asm.match(/^repnz\scmpsd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2A7', 'repne cmpsd')
			when asm.match(/^repne\sscasb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2AE', 'repne scasb')
			when asm.match(/^repne\sscasw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F266AF', 'repne scasw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3AF', 'repne scasw')
			when asm.match(/^repne\sscasd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2AF', 'repne scasd')
			when asm.match(/^repnz\sscasb$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2AE', 'repne scasb')
			when asm.match(/^repnz\sscasw$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F266AF', 'repne scasw')
				printf("%-34s%-15s (prefix swap)\n\n", '66F3AF', 'repne scasw')
			when asm.match(/^repnz\sscasd$/i)
				#Return from Procedure (Far)
				printf("%-34s%-15s\n\n", 'F2AF', 'repne scasd')
			when asm.match(/^rol/i)
				#Rotate to the Left
				if modrmimm(asm, 'rol', 'C0', '0')
				else nasm(asm) end
			when asm.match(/^ror/i)
				#Rotate to the Right
				if modrmimm(asm, 'ror', 'C0', '1')
				else nasm(asm) end
			when asm.match(/^rsm$/i)
				#Resume from System Management Mode
				printf("%-34s%-15s\n\n", '0FAA', 'rsm')
			when asm.match(/^sahf$/i)
				#Store AH into Flags
				printf("%-34s%-15s\n\n", '9E', 'sahf')
			when asm.match(/^sal/i)
				#Shift Arithmetic Left (SHL is the official for this)
				if modrmimm(asm, 'sal', 'C0', '6')
				else nasm(asm) end
			when asm.match(/^sar/i)
				#Shift Arithmetic Right
				if modrmimm(asm, 'sar', 'C0', '7')
				else nasm(asm) end
			when asm.match(/^sbb/i)
				#Integer Subtraction with Borrow
				if alimm8(asm, '1C', '80D8')
				elsif aximm16(asm, '661D', '6681D8', '6683D8')
				elsif eaximm32(asm, '1D', '81D8', '83D8')	
				elsif modrmimm(asm, 'sbb', '80', '3')	
				elsif modrmmodrm(asm, '18')			
				else nasm(asm) end
			when asm.match(/^scasb$/i)
				#Scan String (Byte)
				printf("%-34s%-15s\n\n", 'AE', 'scasb')
			when asm.match(/^scasw$/i)
				#Scan String (Word)
				printf("%-34s%-15s\n\n", '66AF', 'scasw')
			when asm.match(/^scasd$/i)
				#Scan String (Doubleword)
				printf("%-34s%-15s\n\n", 'AF', 'scasd')
			when asm.match(/^sfence$/i)
				#Store Fence
				fence('sfence', '0FAE', 'F8')
			when asm.match(/^sgdt\s/i)
				#Store Global Descriptor Table Register
				if opmodrm(asm, '0F01', '0')		
				else nasm(asm) end
			when asm.match(/^shl/i)
				#Shift Left
				if modrmimm(asm, 'shl', 'C0', '4')
				else nasm(asm) end
			when asm.match(/^sidt\s/i)
				#Store Interrupt Descriptor Table
				if opmodrm(asm, '0F01', '1')		
				else nasm(asm) end
			when asm.match(/^shr/i)
				#Shift Right
				if modrmimm(asm, 'shr', 'C0', '5')
				else nasm(asm) end
			when asm.match(/^smsw\s/i)
				#Store Machine Status Word r32/m16
				if opmodrm(asm, '0F01', '4')
				else nasm(asm) end
			when asm.match(/^stac$/i)
				#Set AC Flag in EFLAGS Register
				printf("%-34s%-15s\n\n", '0F01CB', 'stac')
			when asm.match(/^stc$/i)
				#Set Carry Flag
				printf("%-34s%-15s\n\n", 'F9', 'stc')
			when asm.match(/^std$/i)
				#Set Direction Flag
				printf("%-34s%-15s\n\n", 'FD', 'std')
			when asm.match(/^sti$/i)
				#Set Interrupt Flag
				printf("%-34s%-15s\n\n", 'FB', 'sti')
			when asm.match(/^stosb$/i)
				#Store String (Byte)
				printf("%-34s%-15s\n\n", 'AA', 'stosb')
			when asm.match(/^stosw$/i)
				#Store String (Word)
				printf("%-34s%-15s\n\n", '66AB', 'stosw')
			when asm.match(/^stosd$/i)
				#Store String (Doubleword)
				printf("%-34s%-15s\n\n", 'AB', 'stosd')
			when asm.match(/^str\s/i)
				#Store Task Register
				if opmodrm(asm, '0F00', '1')
				else nasm(asm) end
			when asm.match(/^sub/i)
				#Subtract
				if alimm8(asm, '2C', '80E8')
				elsif aximm16(asm, '662D', '6681E8', '6683E8')
				elsif eaximm32(asm, '2D', '81E8', '83E8')
				elsif modrmimm(asm, 'sub', '80', '5')	
				elsif modrmmodrm(asm, '28')			
				else nasm(asm) end
			when asm.match(/^swapgs/i)
				#Swap GS Base Register
				printf("%-34s%-15s\n\n", '0F01F8', 'swapgs') 
			when asm.match(/^syscall/i)
				#Fast System Call
				printf("%-34s%-15s\n\n", '0F05', 'syscall')
			when asm.match(/^sysenter/i)
				#Fast System Call
				printf("%-34s%-15s\n\n", '0F34', 'sysenter')
			when asm.match(/^sysexit/i)
				#Fast Return from Fast System Call
				printf("%-34s%-15s\n\n", '0F35', 'sysexit')
			when asm.match(/^sysret/i)
				#Return From Fast System Call
				printf("%-34s%-15s\n\n", '0F07', 'sysret')
			when asm.match(/^test/i)
				#Logical Compare
				if alimm8_c(asm, 'A8', 'F6C0')
				elsif aximm16_c(asm, '66A9', '66F7C0', 'invalid')
				elsif eaximm32_c(asm, 'A9', 'F7C0', 'invalid')		
				elsif modrmimm(asm, 'test', 'F6', '0')	
				elsif modrmmodrm(asm, '84')			
				else nasm(asm) end
			when asm.match(/^tzcnt/i)
				#Count the number of trailing zero bits
				if modrmmodrm(asm, 'F30FBC')		
				else nasm(asm) end
			when asm.match(/^ud2$/i)
				#Undefined asm
				printf("%-34s%-15s\n\n", '0F0B', 'ud2')
			when asm.match(/^verr\s/i)
				#Store Task Register
				if opmodrm(asm, '0F00', '4')
				else nasm(asm) end
			when asm.match(/^verw\s/i)
				#Store Task Register
				if opmodrm(asm, '0F00', '5')
				else nasm(asm) end
			when asm.match(/^vmwrite/i)
				#VMWrite
				if modrmmodrm(asm, '0F79')		
				else nasm(asm) end
			when asm.match(/^vmread/i)
				#VMRead
				if modrmmodrm(asm, '0F78')		
				else nasm(asm) end
			when asm.match(/^f?wait$/i)
				#Wait
				printf("%-34s%-15s\n\n", '9B', 'wait')
			when asm.match(/^wbinvd$/i)
				#Write Back and Invalidate Cache
				printf("%-34s%-15s\n\n", '0F09', 'wbinvd')
			when asm.match(/^wrmsr$/i)
				#Write to Model Specific Register
				printf("%-34s%-15s\n\n", '0F30', 'wrmsr')
			when asm.match(/^xabort\s/i)
				#Transactional Abort
				if opimm8(asm, 'C6F8')		
				else nasm(asm) end
			when asm.match(/^xbegin/i)
				#Transactional Begin
				if jcc(asm, 'C7F8')		
				else nasm(asm) end
			when asm.match(/^xchg/i)
				#Exchange two registers
				if plusreg(asm, '90')	
				elsif modrmmodrm(asm, '86')
				else nasm(asm) end
			when asm.match(/^xgetbv$/i)
				#Get Value of Extended Control Register
				printf("%-34s%-15s\n\n", '0F01D0', 'xgetbv')
			when asm.match(/^xlat$/i)
				#Table Look-up Translation
				printf("%-34s%-15s\n\n", 'D7', 'xlat (BYTE PTR ds:[ebx])')
			when asm.match(/^xor/i)
				#Logical Exlusive OR
				if alimm8_c(asm, '34', '80F0')
				elsif aximm16_c(asm, '6635', '6681F0', '6683F0')
				elsif eaximm32_c(asm, '35', '81F0', '83F0')	
				elsif modrmimm(asm, 'xor', '80', '6')	
				elsif modrmmodrm(asm, '30')		
				else nasm(asm) end
			when asm.match(/^xsetbv/i)
				#Set Extended Control Register
				printf("%-34s%-15s\n\n", '0F01D1', 'xsetbv')
			when asm.match(/^xtest/i)
				#Test If in Transactional Execution
				printf("%-34s%-15s\n\n", '0F01D6', 'xtest')																																																																																																																																																																				
			else 
				nasm(asm) 
		end
	end
end

#------------------------------------
# 	Format Operand Data Subs  		#
#------------------------------------

def imm8 data
	#We want number as hex string without '0x' prefix
	if not /^0x/i.match(data)				#If it's not hex formatted
		data = data.to_i(10).to_s(16)		#Convert to hex
	else
		data = data.gsub(/0x(.+)/, '\1')	#otherwise keep the hex without '0x' prefix
	end
	#This routine is for 8bit data, if argument supplied is too large, gracefully error
	if data.to_s.length > 2
		puts "Error, likely source operand is too large for destination\n\n"
		main
	end
	data = zeropad(data, 2).upcase			#Pad leading zeros if needed
	return data
end

def imm16 data
	#We want number as hex string without '0x' prefix	
	if not /^0x/i.match(data)				#If it's not hex formatted
		data = data.to_i(10).to_s(16) 		#Convert to hex
	else
		data = data.gsub(/0x(.+)/, '\1')	#otherwise keep the hex without '0x' prefix
	end
	#This routine is for 16bit data, if argument supplied is too large, gracefully error	
	if data.to_s.length > 4
		puts "Source operand too large for destination\n\n"
		main
	end
	data = zeropad(data, 4).upcase			#Pad leading zeros if needed
	return data
end

def imm32 data
	#We want number as hex string without '0x' prefix		
	if not /^0x/i.match(data)				#If it's not hex formatted
		data = data.to_i(10).to_s(16) 		#Convert to hex
	else
		data = data.gsub(/0x(.+)/, '\1')	#otherwise keep the hex without '0x' prefix
	end
	#This routine is for 32bit data, if argument supplied is too large, gracefully error	
	if data.to_s.length > 8
		puts "Source operand too large for destination\n\n"
		main
	end
	data = zeropad(data, 8).upcase			#Pad leading zeros if needed
	return data
end

#--------------------------------------------
# 	Instruction Format Subroutines			#
#--------------------------------------------
#imm reducable, not register convertable [add, adc, or]
#	'add ax, 5' is not the same as 'add al, 5'
#		if ax were 0x00fe, adding 5 to ax would be 0x0104, adding 5 to just all would give us 0x0004 in ax
#	'add al, 5' is not the same as 'add ax, 5'
#		if al were 0xfe, adding 5 to al would be 0x04, adding 5 to ax would increment ah unintentionally
#	'sub ax, 5' is not the same as 'sub al, 5'
#		if ax were 0x0102, subtracting 5 from ax would be 0x00fd, subtracting 5 to just al would give us 0x01fd in ax
#	imm8, imm16, and imm32 can all be used interchangable so long as the supplied instruction fits into it
def alimm8 (instruction, m1, m2)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	m1 is the explicit machine code
	#	m2 is the r/m8, imm8 version of the machine code

	#Gatekeeper parse, Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) 					#validate sanity of imm8
		instruction_alt = objdump(m1 + s_operand)					#objdump format of instruction
		printf("%-34s%-15s\n\n", m1 + s_operand, instruction_alt)	#display instruction
		instruction_alt = objdump(m2 + s_operand)					#objdump format of alternate instruction
		printf("%-34s%-15s (r/m8, imm8)\n\n", m2 + s_operand, instruction_alt)	#display instruction
		sanity_check(m1 + s_operand, instruction)	#See if this output matches nasms
		return 1
	end
end

def aximm16 (instruction, m1, m2, m3)	#OP AX, imm16
	#Where instruction is the full instruction inputted
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the r/m16, imm8 version of the machine code

	#Gatekeeper parse, Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm16(extracted.captures[0])				#parse the imm16 operand
		#If there are at least two leading zero's, this can be done as imm8 as well
		if extracted_i = /00(..)/i.match(s_operand)
			instruction_alt = objdump(m3 + littleend(s_operand))						#objdump format
			printf("%-34s%-15s\n\n", m3 + extracted_i.captures[0], instruction_alt)		#
			sanity_check(m3 + extracted_i.captures[0], instruction)
			instruction_alt = objdump(m1 + littleend(s_operand))	
			printf("%-34s%-15s (ax, imm16)\n", m1 + littleend(s_operand), instruction_alt)
			instruction_alt = objdump(m2 + littleend(s_operand))
			printf("%-34s%-15s (r/m16, imm16)\n", m2 + littleend(s_operand), instruction_alt)
		else
			instruction_alt = objdump(m1 + littleend(s_operand))	
			printf("%-34s%-15s\n\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction)
			instruction_alt = objdump(m2 + littleend(s_operand))
			printf("%-34s%-15s (r/m16, imm16)\n", m2 + littleend(s_operand), instruction_alt)
		end
		puts "\n"		
		return 1
	end
end

def eaximm32 (instruction, m1, m2, m3)	#OP EAX, imm32
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the r/m32, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		if extracted_i = /000000(..)/i.match(s_operand)
			instruction_alt = objdump(m3 + extracted_i.captures[0])
			printf("%-34s%-15s\n\n", m3 + extracted_i.captures[0], instruction_alt)
			sanity_check(m3 + extracted_i.captures[0], instruction)	#See if this output matches nasms
			instruction_alt = objdump(m1 + littleend(s_operand))		
			printf("%-34s%-15s (eax, imm32)\n", m1 + littleend(s_operand), instruction_alt)
			instruction_alt = objdump(m2 + littleend(s_operand))
			printf("%-34s%-15s (r/m32, imm32)\n", m2 + littleend(s_operand), instruction_alt)
		else
			instruction_alt = objdump(m1 + littleend(s_operand))		
			printf("%-34s%-15s\n\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction)	#See if this output matches nasms		
			instruction_alt = objdump(m2 + littleend(s_operand))
			printf("%-34s%-15s (r/m32, imm32)\n", m2 + littleend(s_operand), instruction_alt)
		end
		puts "\n"		
		return 1
	end
end

#0xff extendable and 0xff reducable [and]
#and ax, 0xff55 = and al, 0x55
def alimm8_b (instruction, m1, m2, m3, m4, m5, m6, m7)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32 version of the machine code
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the ax, imm16 version of the machine code
	#	m4 is the r/m16, imm16 version of the machine code
	#	m5 is the al, imm8 version of the machine code
	#	m6 is the r/m8, imm8 version of the machine code
	#	m7 is the r/m16, imm8 version of the machine code					
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		instruction_alt = objdump(m5 + s_operand)
		printf("%-34s%-15s\n\n", m5 + s_operand, instruction_alt)
		instruction_alt = objdump(m6 + s_operand)
		printf("%-34s%-15s (r/m8, imm8)\n", m6 + s_operand, instruction_alt)
		instruction_alt = objdump(m3 + littleend('FF' + s_operand))
		printf("%-34s%-15s (ax, imm16)\n", m3 + littleend('FF' + s_operand), instruction_alt)
		instruction_alt = objdump(m7 + s_operand)
		printf("%-34s%-15s (r/m16, imm8)\n", m7 + s_operand, instruction_alt)
		instruction_alt = objdump(m4 + littleend('FF' + s_operand))	
		printf("%-34s%-15s (r/m16, imm16)\n", m4 + littleend('FF' + s_operand), instruction_alt)
		instruction_alt = objdump(m1 + littleend('FFFFFF' + s_operand))
		printf("%-34s%-15s (eax, imm32)\n", m1 + littleend('FFFFFF' + s_operand), instruction_alt)
		instruction_alt = objdump(m2 + littleend('FFFFFF' + s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n\n", m2 + littleend('FFFFFF' + s_operand), instruction_alt)
		sanity_check(m5 + s_operand, instruction)	#See if this output matches nasms
		return 1
	end
end

def aximm16_b (instruction, m1, m2, m3, m4, m5, m6, m7)
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32 version of the machine code
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the ax, imm16 version of the machine code
	#	m4 is the r/m16, imm16 version of the machine code
	#	m5 is the al, imm8 version of the machine code
	#	m6 is the r/m8, imm8 version of the machine code
	#	m7 is the r/m16, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		if disp_to_dec(s_operand) < 256 then
			s_operand = imm8(s_operand)			
			instruction_alt = objdump(m7 + s_operand)
			printf("%-34s%-15s\n\n", m7 + s_operand, instruction_alt)
			sanity_check(m7 + s_operand, instruction_alt)	#See if this output matches nasms
			s_operand = 'FF' + s_operand
			instruction_alt = objdump(m3 + littleend(s_operand))
			printf("%-34s%-15s (ax, imm16)\n", m3 + littleend(s_operand), instruction_alt)
			sanity_check(m3 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		else
			s_operand = imm16(s_operand)
			instruction_alt = objdump(m3 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m3 + littleend(s_operand), instruction_alt)
			sanity_check(m3 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		end
		instruction_alt = objdump(m4 + littleend(s_operand))
		printf("%-34s%-15s (r/m16, imm16)\n", m4 + littleend(s_operand), instruction_alt)
		instruction_alt = objdump(m1 + littleend('FFFF' + s_operand))
		printf("%-34s%-15s (eax, imm32)\n", m1 + littleend('FFFF' + s_operand), instruction_alt)
		instruction_alt = objdump(m2 + littleend('FFFF' + s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n", m2 + littleend('FFFF' + s_operand), instruction_alt)
		if extracted_i = /ff(..)/i.match(s_operand)
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-34s%-15s (al, imm8)\n", m5 + extracted_i.captures[0], instruction_alt)
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-34s%-15s (r/m8, imm8)\n", m6 + extracted_i.captures[0], instruction_alt)		
		end
		puts "\n"
		return 1
	end
end

def eaximm32_b (instruction, m1, m2, m3, m4, m5, m6, m7)
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32 version of the machine code
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the ax, imm16 version of the machine code
	#	m4 is the r/m16, imm16 version of the machine code
	#	m5 is the al, imm8 version of the machine code
	#	m6 is the r/m8, imm8 version of the machine code
	#	m7 is the r/m16, imm8 version of the machine code
	#Is it: OP eax, imm32?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		if disp_to_dec(s_operand) < 256 then
			s_operand = imm8(s_operand)			
			instruction_alt = objdump(m7 + s_operand)
			printf("%-34s%-15s\n\n", m7 + s_operand, instruction_alt)
			sanity_check(m7 + s_operand, instruction_alt)	#See if this output matches nasms
			s_operand = 'FFFFFF' + s_operand
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s (eax, imm32)\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		else
			s_operand = imm32(s_operand)
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		end
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n", m2 + littleend(s_operand), instruction_alt)
		if extracted_i = /FFFF(....)/i.match(s_operand)		
			instruction_alt = objdump(m3 + littleend(extracted_i.captures[0]))
			printf("%-34s%-15s (ax, imm16)\n", m3 + littleend(extracted_i.captures[0]), instruction_alt)
			instruction_alt = objdump(m4 + littleend(extracted_i.captures[0]))
		    printf("%-34s%-15s (r/m16, imm16)\n", m4 + littleend(extracted_i.captures[0]), instruction_alt)			
		end		
		if extracted_i = /FFFFFF(..)/i.match(s_operand)		
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-34s%-15s (al, imm8)\n", m5 + extracted_i.captures[0], instruction_alt)
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-34s%-15s (r/m8, imm8)\n", m6 + extracted_i.captures[0], instruction_alt)				
		end
		puts "\n"	
		return 1
	end
end

#Test and CMP
def alimm8_c (instruction, m1, m2)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	m1 is the explicit machine code
	#	m2 is the r/m8, imm8 version of the machine code
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		instruction_alt = objdump(m1 + s_operand)
		printf("%-34s%-15s\n\n", m1 + s_operand, instruction_alt)
		instruction_alt = objdump(m2 + s_operand)
		printf("%-34s%-15s (r/m8, imm8)\n\n", m2 + s_operand, instruction_alt)		
		sanity_check(m1 + s_operand, instruction_alt)	#See if this output matches nasms	
		return 1
	end
end

def aximm16_c (instruction, m1, m2, m3)
	#Where instruction is the full instruction inputted
	#	m1 is the explicit (ax, imm16) machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#   m3 is the r/m16, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		if disp_to_dec(s_operand) < 256 and m3 != 'invalid' then
			s_operand = imm8(s_operand)		
			instruction_alt = objdump(m3 + s_operand)
			printf("%-34s%-15s\n\n", m3 + s_operand, instruction_alt)
			sanity_check(m3 + s_operand, instruction_alt)	#See if this output matches nasms
			s_operand = '00' + s_operand
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s (ax, imm16)\n", m1 + littleend(s_operand), instruction_alt)		
		else
			s_operand = imm16(s_operand)
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		end		
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-34s%-15s (r/m16, imm16)\n\n", m2 + littleend(s_operand), instruction_alt)	
		return 1
	end
end

def eaximm32_c (instruction, m1, m2, m3)
	#Where instruction is the full instruction inputted
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#Is it: OP eax, imm32?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		if disp_to_dec(s_operand) < 256 and m3 != 'invalid' then
			s_operand = imm8(s_operand)		
			instruction_alt = objdump(m3 + s_operand)
			printf("%-34s%-15s\n\n", m3 + s_operand, instruction_alt)
			sanity_check(m3 + s_operand, instruction_alt)	#See if this output matches nasms
			s_operand = '000000' + s_operand
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s (eax, imm32)\n", m1 + littleend(s_operand), instruction_alt)		
		else
			s_operand = imm32(s_operand)
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		end	
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n\n", m2 + littleend(s_operand), instruction_alt)
		return 1
	end
end

#not extendable nor reducable and no r/m,imm redundancy and imm is always imm8 [IN]
def alimm8_d (instruction, m1, m2)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, etc...)
	#	m1 is the explicit machine code for 8bit
	#   m2 is the explicit machine code for 16 and 32 bit
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+e?a[lx],\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		if /^\w+\s+ax/.match(instruction)	#is it 16 bit
			m1 = '66' + m2					#if so, add the prefix
		end
		if /^\w+\s+eax/.match(instruction)	#is it 16 bit
			m1 = m2					#if so, add the prefix
		end		
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		instruction_alt = objdump(m1 + s_operand)		
		printf("%-34s%-15s\n\n", m1 + s_operand, instruction_alt)	
		sanity_check(m1 + s_operand, instruction)	#See if this output matches nasms
		return 1
	end
end

#null extendable and null reducable [or]
def alimm8_e (instruction, m1, m2, m3, m4, m5, m6)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32 version of the machine code
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the ax, imm16 version of the machine code
	#   m4 is the r/m16, imm16 version of the machine code
	#   m5 is the al, imm8 version of the machine code
	#   m6 is the r/m8, imm8 version of the machine code
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		instruction_alt = objdump(m5 + s_operand)
		printf("%-34s%-15s\n\n", m5 + s_operand, instruction_alt)
		sanity_check(m5 + s_operand, instruction)	#See if this output matches nasms
		instruction_alt = objdump(m6 + s_operand)
		printf("%-34s%-15s (r/m8, imm8)\n", m6 + s_operand, instruction_alt)
		instruction_alt = objdump(m3 + littleend('00' + s_operand))
		printf("%-34s%-15s (ax, imm16)\n", m3 + littleend('00' + s_operand), instruction_alt)
		instruction_alt = objdump(m4 + littleend('00' + s_operand))
		printf("%-34s%-15s (r/m16, imm16)\n", m4 + littleend('00' + s_operand), instruction_alt)
		instruction_alt = objdump(m1 + littleend('000000' + s_operand))
		printf("%-34s%-15s (eax, imm32)\n", m1 + littleend('000000' + s_operand), instruction_alt)
		instruction_alt = objdump(m2 + littleend('000000' + s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n\n", m2 + littleend('000000' + s_operand), instruction_alt)
		return 1
	end
end

def aximm16_e (instruction, m1, m2, m3, m4, m5, m6, m7)
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32 version of the machine code
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the ax, imm16 version of the machine code
	#   m4 is the r/m16, imm16 version of the machine code
	#   m5 is the al, imm8 version of the machine code
	#   m6 is the r/m8, imm8 version of the machine code
	#   m7 is the r/m16, imm8 version of the machine code	
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		if disp_to_dec(s_operand) < 256 then
			s_operand = imm8(s_operand)		
			instruction_alt = objdump(m7 + s_operand)
			printf("%-34s%-15s\n\n", m7 + s_operand, instruction_alt)
			sanity_check(m7 + s_operand, instruction_alt)	#See if this output matches nasms
			s_operand = '00' + s_operand
			instruction_alt = objdump(m3 + littleend(s_operand))
			printf("%-34s%-15s (ax, imm16)\n", m3 + littleend(s_operand), instruction_alt)		
		else
			s_operand = imm16(s_operand)
			instruction_alt = objdump(m3 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m3 + littleend(s_operand), instruction_alt)
			sanity_check(m3 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		end		
		instruction_alt = objdump(m4 + littleend(s_operand))
		printf("%-34s%-15s (r/m16, imm16)\n", m4 + littleend(s_operand), instruction_alt)
		instruction_alt = objdump(m1 + littleend('0000' + s_operand))
		printf("%-34s%-15s (eax, imm32)\n", m1 + littleend('0000' + s_operand), instruction_alt)
		instruction_alt = objdump(m2 + littleend('0000' + s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n", m2 + littleend('0000' + s_operand), instruction_alt)
		if extracted_i = /00(..)/i.match(s_operand)
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-34s%-15s (al, imm8)\n", m5 + extracted_i.captures[0], instruction_alt)
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-34s%-15s (r/m8, imm8)\n", m6 + extracted_i.captures[0], instruction_alt)		
		end
		puts "\n"
		return 1
	end
end

def eaximm32_e (instruction, m1, m2, m3, m4, m5, m6, m7)
	#Where instruction is the full instruction inputted
	#	m1 is the eax, imm32 version of the machine code
	#	m2 is the r/m32, imm32 version of the machine code
	#	m3 is the ax, imm16 version of the machine code
	#   m4 is the r/m16, imm16 version of the machine code
	#   m5 is the al, imm8 version of the machine code
	#   m6 is the r/m8, imm8 version of the machine code
	#   m7 is the r/m16, imm8 version of the machine code	
	#Is it: OP ax, imm32?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		if disp_to_dec(s_operand) < 256 then
			s_operand = imm8(s_operand)		
			instruction_alt = objdump(m7 + s_operand)
			printf("%-34s%-15s\n\n", m7 + s_operand, instruction_alt)
			sanity_check(m7 + s_operand, instruction_alt)	#See if this output matches nasms
			s_operand = '000000' + s_operand
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s (eax, imm32)\n", m1 + littleend(s_operand), instruction_alt)		
		else
			s_operand = imm32(s_operand)
			instruction_alt = objdump(m1 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m1 + littleend(s_operand), instruction_alt)
			sanity_check(m1 + littleend(s_operand), instruction_alt)	#See if this output matches nasms			
		end	
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-34s%-15s (r/m32, imm32)\n", m2 + littleend(s_operand), instruction_alt)
		if extracted_i = /0000(....)/i.match(s_operand)
			instruction_alt = objdump(m3 + littleend(extracted_i.captures[0]))
			printf("%-34s%-15s (ax, imm16)\n", m3 + littleend(extracted_i.captures[0]), instruction_alt)
			instruction_alt = objdump(m4 + littleend(extracted_i.captures[0]))			
		    printf("%-34s%-15s (r/m16, imm16\n", m4 + littleend(extracted_i.captures[0]), instruction_alt)			
		end		
		if extracted_i = /000000(..)/i.match(s_operand)	
			instruction_alt = objdump(m5 + extracted_i.captures[0])	
			printf("%-34s%-15s (al, imm8)\n", m5 + extracted_i.captures[0], instruction_alt)
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-34s%-15s (r/m8, imm8)\n", m6 + extracted_i.captures[0], instruction_alt)		
		end
		puts "\n"
		return 1
	end
end

#For the 'fence' instructions that have machine-code-only redundancies
def fence (instruction, m1, m2)
	#Where instruction is the full instruction inputted
	#	m1 is the 'prelude machine-code'
	#	m2 is the adjustable peice of machine code
	instruction_alt = objdump(m1 + m2)	
	printf("%-34s%-15s\n\n", m1 + m2, instruction_alt)
	for i in 1..7
		printf("%-34s%-15s\n", (m1 + (m2.hex.to_s(10).to_i + i).to_s(16)).upcase, instruction)
	end
	puts "\n"
	sanity_check(m1 + m2, instruction)	#See if this output matches nasms
	return 1
end

def modrmimm (instruction, op, m1, num)
	#instruction - full unparsed instruction
	#op - instruction name
	#m1 - machine code for it
	#num - the encoded instruction within the modr/m (i.e ADC r/m8,imm8 is /2)

	#This is a very complicated type of subroutine, below is a summary of how Mod/RM is worked through
	# 1. Extract register, offset, multiplier, and register being multiplied (if applicable to all)
	# 2. Based on offset size (none, 8bit, 32bit), set 2 bit MOD bits in MODRM
	# 3. calculate instruction (from num argument) and add those 3 bits to MODRM
	# 4. If there's no Scale
	#		add 3 bit Register to MODRM
	#    Otherwise
	#       a. Add SIB bits (100) to MODRM
	# 		b. Based on 'multiplier', adjust 2 scale bits in SIB byte
	#		c. add the 3 bits of the multiplied register to SIB byte
	#		d. add the 3 bits of the 'added' register to the SIB byte
	#		e. If no multiplier
	#			add appropriate displacements with 0's
	#		f. Add displacements (of appropriate size) if they exist

	#GateKeeper Parse
	if /(\]|e?[acdbsbd][lhxpi])\s*,\s*(\d+|0x[0-9a-f]+$)/i.match(instruction) then
		#We are good to parse and process
	else return false end

	###############################
	#           PARSING           #
	###############################	

	#Parse if dest operand is byte, word, or dword
	if extracted = /(byte|word|dword)|(e?[acdbsbd][lhxpi])/i.match(instruction)
		datasize = extracted.captures[0]
		if datasize == 'dword' or datasize == 'word' then	#modify the instruction to be 16/32 bit from 8bit default
			if m1 == '80' then m1 = '83' end	#adc, add, and, cmp, or, sbb, sub, xor
			if m1 == 'C0' then m1 = 'C1' end	#rcl, rcr, rol, ror, sal, sar, shl, shr
			if m1 == 'C6' then m1 = 'C7' end	#mov
			if m1 == 'F6' then m1 = 'F7' end	#test
		end
		if datasize == 'word' then
			m1 = '66' + m1				#add 16 bit override prefix to instruction
		end
	else
		puts "Must specify datasize for this kind of instruction (i.e.: xor byte [eax + ebx], 0x44)\n\n"
		return 1
	end

	#If it's just the register, then process it and leave
	if extracted = /(e?[acdbsbd][lhxpi])\s*,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		#mod = 2 (11xxxxxx) / 192
		#op = num (xxoooxxx) / num * 8
		#register = (xxxxxrrr)
		modrm = 192 + (num.to_i * 8)
		register = extracted.captures[0]
		s_operand = extracted.captures[1]

		#Get Register numbers for MOV instructions if needed
		if m1 == 'C6' then
			if /al/i.match(instruction) then regnum = '0' end
			if /cl/i.match(instruction) then regnum = '1' end
			if /dl/i.match(instruction) then regnum = '2' end
			if /bl/i.match(instruction) then regnum = '3' end
			if /ah/i.match(instruction) then regnum = '4' end
			if /ch/i.match(instruction) then regnum = '5' end
			if /dh/i.match(instruction) then regnum = '6' end
			if /bh/i.match(instruction) then regnum = '7' end					
			if /e?a[x]/i.match(instruction) then regnum = '8' end
			if /e?c[x]/i.match(instruction) then regnum = '9' end
			if /e?d[x]/i.match(instruction) then regnum = 'A' end
			if /e?b[x]/i.match(instruction) then regnum = 'B' end
			if /e?sp/i.match(instruction) then regnum = 'C' end
			if /e?bp/i.match(instruction) then regnum = 'D' end
			if /e?si/i.match(instruction) then regnum = 'E' end
			if /e?di/i.match(instruction) then regnum = 'F' end																						
		end

		#Need to dynamically handle different source operand sizes and change the machine code accordingly
		#Redundancies HERE!!!
		#NO #rcl, rcr, rol, ror, sal, sar, shl, shr, or mov
		m1_backup = m1
		s_operand_backup = s_operand
		mov_inst = 0
		#If the register is 8 bit and the imm operand is 8bits or less
		if disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 256 and /[acdb][lh]/i.match(instruction) then
			if m1 == 'C6' then
				mov_inst = 'B' + regnum + imm8(s_operand)
			end
			s_operand = imm8(s_operand)
		#If the register is 16 bit and the imm operand is 16 bits or less
		elsif disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 65536  and /[^e][acdbs][xpi]/i.match(instruction) then	
			if m1 == '80' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 256 then 
				s_operand = littleend(imm8(s_operand))	
				m1 = '6683' #adc, add, and, cmp, or, sbb, sub, xor	
			end	
			if m1 == '80' and disp_to_dec(s_operand) > 255 and disp_to_dec(s_operand) < 65536 then 
				s_operand = littleend(imm16(s_operand))				
				m1 = '6681' #adc, add, and, cmp, or, sbb, sub, xor
			end
			if m1 == 'F6' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 65536 then 
				s_operand = littleend(imm16(s_operand))	
				m1 = '66F7' #test
			end		
			if m1 == 'C6' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 65536 then 
				s_operand = littleend(imm16(s_operand))	
				m1 = '66C7' #mov
				mov_inst = '66B' + regnum + s_operand
			end					
		#If the register is 32 bit and the imm operand is 32 bits or less	
		elsif disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 4294967296 and /e[acdbs][xpi]/i.match(instruction) then	
			if m1 == '80' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 256 then 
				s_operand = littleend(imm8(s_operand))	
				m1 = '83' #adc, add, and, cmp, or, sbb, sub, xor	
			end	
			if m1 == '80' and disp_to_dec(s_operand) > 255 and disp_to_dec(s_operand) < 65536 then 
				s_operand = littleend(imm32(s_operand))				
				m1 = '81' #adc, add, and, cmp, or, sbb, sub, xor
			end			
			if m1 == '80' and disp_to_dec(s_operand) > 65535 and disp_to_dec(s_operand) < 4294967296 then 
				s_operand = littleend(imm32(s_operand))				
				m1 = '81' #adc, add, and, cmp, or, sbb, sub, xor
			end
			if m1 == 'F6' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 4294967296 then 
				s_operand = littleend(imm32(s_operand))	
				m1 = 'F7' #test	
			end			
			if m1 == 'C6' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 4294967296 then 
				s_operand = littleend(imm32(s_operand))	
				m1 = 'C7' #mov
				mov_inst = 'B' + regnum + s_operand					
			end						
		else
			puts "Value exceeds bounds or some other error\n\n"	
			return 1					
		end

		if /e?c[lx]/i.match(register) then modrm = modrm + 1
		elsif /e?d[lx]/i.match(register) then modrm = modrm + 2
		elsif /e?b[lx]/i.match(register) then modrm = modrm + 3
		elsif /e?[as][hp]/i.match(register) then modrm = modrm + 4
		elsif /e?[cb][hp]/i.match(register) then modrm = modrm + 5
		elsif /e?[ds][hi]/i.match(register) then modrm = modrm + 6
		elsif /e?[bd][hi]/i.match(register) then modrm = modrm + 7	
		end		

		if mov_inst != 0 then
			instruction_alt = objdump(mov_inst)
			printf("%-34s%-15s\n\n", mov_inst, instruction_alt)
			sanity_check(mov_inst, instruction)	#See if this output matches nasms
			
			modrm = (modrm.to_s(16)).upcase
			instruction_alt = objdump(m1 + modrm + s_operand)
			printf("%-34s%-15s (rm/imm)\n\n", m1 + modrm + s_operand, instruction_alt)
			return 1
		end

		modrm = (modrm.to_s(16)).upcase
		instruction_alt = objdump(m1 + modrm + s_operand)
		printf("%-34s%-15s\n\n", m1 + modrm + s_operand, instruction_alt)
		sanity_check(m1 + modrm + s_operand, instruction)	#See if this output matches nasms

		#Alternates?
		m1 = m1_backup
		s_operand = s_operand_backup
		if disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 255 and /[^e][acdbs][xpi]/i.match(instruction) then	
			if m1 == '80' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 255 then 
				s_operand = littleend(imm16(s_operand))				
				m1 = '6681' #adc, add, and, cmp, or, sbb, sub, xor
				instruction_alt = objdump(m1 + modrm + s_operand)
				printf("%-34s%-15s (r/m16, imm16)\n\n", m1 + modrm + s_operand, instruction_alt)				
			end
		elsif disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 255 and /e[acdbs][xpi]/i.match(instruction) then	
			if m1 == '80' and disp_to_dec(s_operand) > -1 and disp_to_dec(s_operand) < 255 then 
				s_operand = littleend(imm32(s_operand))	
				m1 = '81' #adc, add, and, cmp, or, sbb, sub, xor
				instruction_alt = objdump(m1 + modrm + s_operand)
				printf("%-34s%-15s (r/m32, imm32)\n\n", m1 + modrm + s_operand, instruction_alt)					
			end					
		end		

		return 1
	end	

	negative = 0	#Default, will be changed if subtraction of disp found
	reg_a = ''		#Default, will populate for an edge case
	reg_b = ''		#Default, will populate for an edge case

	#Parse the source operand
	if extracted = /,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = extracted.captures[0]
		s_operand_u	= s_operand					#an unprocessed form of source operand to use later
	end

	#Parse register, source operand, displacement, scale, and scaled register
	if extracted = /(byte|word|dword).+?\[[^\]]*?(e[acdbs][xip])[^\]]*?\]\s*?,\s*?(0x)?[a-f0-9]+$/i.match(instruction)
		register = extracted.captures[1]
		offset = '0'
		multiplier = '0'
		mreg = ''
	end

	#Parse and adjust source operand size
	if m1 == 'C0' or m1 == 'C1' or m1 == '66C1' and disp_to_dec(s_operand) > 255 then
		puts "This instruction does not support non-byte sized source operand\n\n"
		return 1
	end
	if disp_to_dec(s_operand) > 65535 and datasize == 'dword' then
		s_operand = littleend(imm32(s_operand))		
		if m1 == '83' then m1 = '81' end	#adc, add, and, cmp, or, sbb, sub, xor
	elsif disp_to_dec(s_operand) > 255 and datasize != 'byte' then
		s_operand = littleend(imm16(s_operand))
		if m1 == '6683' then m1 = '6681' end	#adc, add, and, cmp, or, sbb, sub, xor		
	else
		s_operand = imm8(s_operand)
	end

	#Parse offset
	#Is there a decimal formatted offset
	if extracted = /(byte|word|dword).+?\[[^\]]*?(?<![x*\s]{2})(\d+)[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		offset = extracted.captures[1]				#parse disp
	end		
	if extracted = /(byte|word|dword).+?\[[^\]]*?-\s*?\d+/i.match(instruction) then negative = 1 end		#parse negative value
	#Is there a hex formatted offset
	if extracted = /(byte|word|dword).+?\[[^\]]*?(0x[0-9a-f]+)[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		offset = extracted.captures[1]				#parse disp	
	end
	if extracted = /(byte|word|dword).+?\[[^\]]*?-\s*(0x[0-9a-f]+)/i.match(instruction) then negative = 1 end #parse negative value
	if $debug == 1 then puts "negative value?: %i" % negative end

	#Is there a scale
	if extracted = /(byte|word|dword).+?\[[^\]]*?(e[acdbs][xip])\s*?\*\s*?([1248])[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		mreg = extracted.captures[1] 				#parse scaled register
		multiplier = extracted.captures[2]			#parse scale
		s_operand = imm8(extracted.captures[3])		#parse imm
		if instruction !~ /.+?e[acdbs][xip].+e[acdbs][xip]/i	#parse possibility of no base register
			register = 'none'
		end
	end

	#Have to handle implicit * 1 with kid gloves, ie adc byte [eax + ebp], 88
	#For the regex, if there's a register followed by adding another register that does not have a scale after it
	if extracted = /(byte|word|dword).+?\[[^\]]*?(e[acdbs][xip])\s*?\+\s*?(e[acdbs][xip])(([^*]+)|(\s*\*\s*1.+))$/i.match(instruction) then
		reg_a = extracted.captures[1]	#parse first register
		reg_b = extracted.captures[2]	#parse second register
		tworegs = 1
	end	

	#If a dword and the source operand is 83/byte and it's actually wordsize, this needs an upgrade to dword/32bit
	if datasize == 'dword' and m1 == '83' then
		if s_operand.length == 4 then 
			s_operand = s_operand + '0000' 
			m1 = '81'
		end
	end

	#PROCESSING
	modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, num)
	if modrm_p == 'error' then return 1 end

	#MOV and TEST
	if extracted = /(mov|test)/i.match(op) then
		if disp_to_dec(s_operand_u) < 256 and datasize == 'word' then		#if imm is byte but dest is word/dword
			s_operand_p = s_operand_p + '00'
			modrmimm_results(multiplier_p, esp_areg_p, m1, modrm_p, s_operand_p, instruction, register_p, mreg_p, offset, sib_p)		
			s_operand = s_operand + '00'			
			modrmimm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
			return 1
		end
		if disp_to_dec(s_operand_u) < 256 and datasize == 'dword' then		#if imm is byte but dest is word/dword
			s_operand_p = s_operand_p + '000000'
			modrmimm_results(multiplier_p, esp_areg_p, m1, modrm_p, s_operand_p, instruction, register_p, mreg_p, offset, sib_p)		
			s_operand = s_operand + '000000'			
			modrmimm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
			return 1
		end		
		if disp_to_dec(s_operand_u) > 255 and disp_to_dec(s_operand) < 65536 and datasize != 'word' then #if imm is word but dest is dword
			s_operand_p = s_operand_p + '0000'			
			modrmimm_results(multiplier_p, esp_areg_p, m1, modrm_p, s_operand_p, instruction, register_p, mreg_p, offset, sib_p)
			s_operand = s_operand + '0000'
			modrmimm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
			return 1
		end
	end

	#OP R/M, 1 (Bit Shift instructions have a '1' immediate builtin to opcode)
	if m1 == 'C0' or m1 == 'C1' or m1 == '66C1' and disp_to_dec(s_operand_u) == 1 then
		m1 = m1.gsub(/C/i, 'D')
		modrmimm_results_so1(multiplier_p, esp_areg_p, m1, modrm_p, instruction, register_p, mreg_p, offset, sib_p)		
		#Standard result routine without sanity checking (as this is the alternate)
		m1 = m1.gsub(/D/i, 'C') #Change it back
		if multiplier_p == '0' and !esp_areg_p then 
			instruction_alt = objdump(m1 + modrm_p + s_operand_p)
			printf("%-34s%-15s (Explicit imm8)\n\n", m1 + modrm_p + s_operand_p, instruction_alt)
		elsif !register_p and !multiplier_p and !mreg_p and offset then 
			instruction_alt = objdump(m1 + modrm_p + s_operand_p)
			printf("%-34s%-15s (Explicit imm8)\n\n", m1 + modrm_p + s_operand_p, instruction_alt)
		else 
			instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
			printf("%-34s%-15s (Explicit imm8)\n\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt) 
		end
		modrmimm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
		m1 = m1.gsub(/C/i, 'D') #now change it back again
		modrmimm_pointer_alternates_so1(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
		return 1
	end

	###############################
	#   OUTPUT STANDARD RESULTS   #
	###############################	
	modrmimm_results(multiplier_p, esp_areg_p, m1, modrm_p, s_operand_p, instruction, register_p, mreg_p, offset, sib_p)

	###############################
	#  OUTPUT ALTERNATE RESULTS   #
	###############################
	modrmimm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)

	return 1
end

def modrmmodrm(instruction, m1)
	#instruction - full unparsed instruction
	#op - instruction name
	#m1 - machine code for it

	#GateKeeper Parse
	if extracted = /(e?[abcds][xhlpi])\s?,\s?(\[[^\]]+?\])/i.match(instruction)
		form = 'register'
		reg1 = extracted.captures[0]
		mem1 = extracted.captures[1]
	elsif extracted = /(\[[^\]]+?\])\s?,\s?(e?[abcds][xhlpi])/i.match(instruction)
		form = 'pointer'
		reg1 = extracted.captures[1]
		mem1 = extracted.captures[0]	
	elsif extracted = /(e?[abcds][xhlpi])\s?,\s?(e?[abcds][xhlpi])/i.match(instruction)
		form = 'register2'	
		reg1 = extracted.captures[0]
		reg2 = extracted.captures[1]		
	else return false end

	#Remove gratuitus byte/word/dword declaration, it is implied by operand
	instruction = instruction.gsub(/\s*(byte|word|dword)\s*/,' ')

	#Kick the ADCX, ADOX, VMWRITE, VMREAD, and CRC32 instructions out if it's not 32-bit
	if m1 == '660F38F6' or m1 == 'F30F38F6' or m1 == '0F79' or m1 == '0F78'  or m1 == 'F20F38F1' and not /^e[abcds][xpi]/i.match(reg1) then
		puts "This instruction only supports 32bit operands\n\n"
		return 1
	end

	#Kick the ARPL instruction out if it's not 16-bit
	if m1 == '63' and not /^[abcds][xpi]/i.match(reg1) then
		puts "This instruction only supports 16bit operands\n\n"
		return 1
	end

	#Kick the BSF, BSR, POPCNT, TZCNT, BOUND, and IMUL out if it is 8-bit
	if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == '62' or m1 == 'F30FBC' or m1 == '0FAF' or /^cmov/i.match(instruction) and not /^e?[abcds][xpi]/i.match(reg1) then
		puts "This instruction does not support 8-bit operands\n\n"
		return 1
	end

	#Process/Convert machinecode for opcode
	if form == 'pointer' then
		#Kick out the LEA Instructions
		if m1 == '8D' then 
			puts "LEA can only be LEA Register, Memory Location\n\n"
			return 1
		end
		#Kick out the ADCX, ADOX, and VMWRITE instructions
		if m1 == '660F38F6' or m1 == 'F30F38F6'  or m1 == '0F79' then
			puts "This instruction only supports register32, register32/pointer32 format\n\n"
			return 1
		end
		#Kick out the BSF, BSR, POPCNT, TZCNT, and all conditional MOV instructions
		if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == 'F30FBC'  or /^cmov/i.match(instruction) then
			puts "This instruction only supports register16_32, register16_32/pointer16_32 format\n\n"
			return 1
		end
		#Kick out the BOUND
		if m1 == '62' then
			puts "This instruction only supports register16_32, pointer16_32 format\n\n"
			return 1
		end
		# Upgrade CMPXCHG if needed
		if /^[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^0F(.)0/i, '660F\11')				
		elsif /^e[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^0F(.)0/i, '0F\11')			
		end				
		if /^[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '6687')			
			m1 = m1.gsub(/^(.)0/i, '66\11')
			m1 = m1.gsub(/^(.)8/i, '66\19')
			m1 = m1.gsub(/^84/i, '6685')			
		end
		if /^e[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '87')			
			m1 = m1.gsub(/^(.)0/i, '\11')
			m1 = m1.gsub(/^(.)8/i, '\19')
			m1 = m1.gsub(/^84/i, '85')				
		end
	elsif form == 'register' then
		#Kick out the ARPL, CMPXCHG, and VMREAD instructions
		if m1 == '63' or m1 == '0FB0'  or m1 == '0F78' then
			puts "This instruction doesn't support pointer for 2nd operand\n\n"
			return 1
		end
		if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == '62' or m1 == 'F30FBC' or /^cmov/i.match(instruction) then
			if /^[abcds][xpi]/i.match(reg1) then
				m1 = m1.gsub(/(.+)/i, '66\1')
			end
		end				
		if /^[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '6687')			
			m1 = m1.gsub(/^(.)0/i, '66\13')
			m1 = m1.gsub(/^(.)8/i, '66\1B')
			m1 = m1.gsub(/^84/i, '6685')		
			m1 = m1.gsub(/^8D/i, '668D')						
		elsif /^e[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '87')			
			m1 = m1.gsub(/^(.)0/i, '\13')
			m1 = m1.gsub(/^(.)8/i, '\1B')
			m1 = m1.gsub(/^84/i, '85')				
		else
			if m1 == '8D' then 
				puts "LEA is not 8-bit\n\n"
				return 1
			end				
			m1 = m1.gsub(/^(.)0/i, '\12')
			m1 = m1.gsub(/^(.)8/i, '\1A')				
		end
	else	#It's 2 registers
		#Kick out the LEA instructions
		if m1 == '8D' then 
			puts "LEA can only be a Register, Memory Location\n\n"
			return 1
		end	
		#Kick out the BOUND instructions
		if m1 == '62' then 
			puts "BOUND can only be a Register, Memory Location\n\n"
			return 1
		end				
		m1_u = m1		
		if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == 'F30FBC' or /^cmov/i.match(instruction) then
			if /^[abcds][xpi]/i.match(reg1) then
				m1 = m1.gsub(/(.+)/i, '66\1')
			end
		end		
		# Upgrade CMPXCHG if needed
		if /^[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^0F(.)0/i, '660F\11')				
		elsif /^e[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^0F(.)0/i, '0F\11')			
		end
		if /^[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '6687')			
			m1 = m1.gsub(/^(.)0/i, '66\11')
			m1 = m1.gsub(/^(.)8/i, '66\19')
			m1 = m1.gsub(/^84/i, '6685')				
		elsif /^e[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '87')			
			m1 = m1.gsub(/^(.)0/i, '\11')
			m1 = m1.gsub(/^(.)8/i, '\19')
			m1 = m1.gsub(/^84/i, '85')				
		end
		#Stage ModR/M with value supplied by source register
		modrm = 192
		if extracted = /e?c[xl]/i.match(reg2) then modrm = modrm + 8
		elsif extracted = /e?d[xl]/i.match(reg2) then modrm = modrm + 16
		elsif extracted = /e?b[xl]/i.match(reg2) then modrm = modrm + 24
		elsif extracted = /e?sp|ah/i.match(reg2) then modrm = modrm + 32
		elsif extracted = /e?bp|ch/i.match(reg2) then modrm = modrm + 40
		elsif extracted = /e?si|dh/i.match(reg2) then modrm = modrm + 48
		elsif extracted = /e?di|bh/i.match(reg2) then modrm = modrm + 56
		end
		if extracted = /e?c[xl]/i.match(reg1) then modrm = modrm + 1
		elsif extracted = /e?d[xl]/i.match(reg1) then modrm = modrm + 2
		elsif extracted = /e?b[xl]/i.match(reg1) then modrm = modrm + 3
		elsif extracted = /e?sp|ah/i.match(reg1) then modrm = modrm + 4
		elsif extracted = /e?bp|ch/i.match(reg1) then modrm = modrm + 5
		elsif extracted = /e?si|dh/i.match(reg1) then modrm = modrm + 6
		elsif extracted = /e?di|bh/i.match(reg1) then modrm = modrm + 7
		end		
		modrm = zeropad(modrm.to_s(16), 2)
		instruction_alt = objdump(m1 + modrm)			
		if not /^test/i.match(instruction) and not m1 == '660F38F6' and not m1 == 'F30F38F6' and not m1 == '0F79' and not m1_u == '0FBC' and not m1_u == '0FBD' and not m1_u == 'F30FB8' and not m1_u == 'F30FBC' and not /^(66)?8[67]/i.match(m1) and not /^cmov/i.match(instruction)
			printf("%-34s%-15s\n\n", m1 + modrm, instruction_alt)				
			sanity_check(m1 + modrm, instruction)	#See if this output matches nasms
		end
		m1 = m1_u	
		if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == 'F30FBC' or /^cmov/i.match(instruction) then
			if /^[abcds][xpi]/i.match(reg1) then
				m1 = m1.gsub(/(.+)/i, '66\1')
			end
		end					
		if /^[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '6687')				
			m1 = m1.gsub(/^(.)0/i, '66\13')
			m1 = m1.gsub(/^(.)8/i, '66\1B')			
		elsif /^e[abcds][xpi]/i.match(reg1) then
			m1 = m1.gsub(/^86/i, '87')				
			m1 = m1.gsub(/^(.)0/i, '\13')
			m1 = m1.gsub(/^(.)8/i, '\1B')		
		else
			m1 = m1.gsub(/^(.)0/i, '\12')
			m1 = m1.gsub(/^(.)8/i, '\1A')			
		end	
		modrm = 192
		if extracted = /e?c[xl]/i.match(reg1) then modrm = modrm + 8
		elsif extracted = /e?d[xl]/i.match(reg1) then modrm = modrm + 16
		elsif extracted = /e?b[xl]/i.match(reg1) then modrm = modrm + 24
		elsif extracted = /e?sp|ah/i.match(reg1) then modrm = modrm + 32
		elsif extracted = /e?bp|ch/i.match(reg1) then modrm = modrm + 40
		elsif extracted = /e?si|dh/i.match(reg1) then modrm = modrm + 48
		elsif extracted = /e?di|bh/i.match(reg1) then modrm = modrm + 56
		end
		if extracted = /e?c[xl]/i.match(reg2) then modrm = modrm + 1
		elsif extracted = /e?d[xl]/i.match(reg2) then modrm = modrm + 2
		elsif extracted = /e?b[xl]/i.match(reg2) then modrm = modrm + 3
		elsif extracted = /e?sp|ah/i.match(reg2) then modrm = modrm + 4
		elsif extracted = /e?bp|ch/i.match(reg2) then modrm = modrm + 5
		elsif extracted = /e?si|dh/i.match(reg2) then modrm = modrm + 6
		elsif extracted = /e?di|bh/i.match(reg2) then modrm = modrm + 7
		end		
		modrm = zeropad(modrm.to_s(16), 2)
		instruction_alt = objdump(m1 + modrm)	
		if not /^test/i.match(instruction) and not m1 == '660F38F6' and not m1 == 'F30F38F6' and not m1 == '0F79' and not m1 == '63' and not m1_u == '0FBC' and not m1_u == '0FBD' and not m1_u == 'F30FB8' and not m1_u == 'F30FBC' and not /0FB[01]/i.match(m1) and not m1_u == '0F78' and not /^(66)?8[67]/i.match(m1) and not /^cmov/i.match(instruction)
			printf("%-34s%-15s (The 'Other' ModR/M)\n\n", m1 + modrm, instruction_alt)
		elsif not m1 == '63' and not /0FB[01]/i.match(m1) and not m1 == '0F78'
			printf("%-34s%-15s\n\n", m1 + modrm, instruction_alt)
			sanity_check(m1 + modrm, instruction)	#See if this output matches nasms
		end

		return 1
	end

	###############################
	#           PARSING           #
	###############################	
	negative = 0	#Default, will be changed if subtraction of disp found
	reg_a = ''		#Default, will populate for an edge case
	reg_b = ''		#Default, will populate for an edge case

	#Parse register with no offset or scaled register
	if extracted = /\[[^\]]*?(e[acdbs][xip])[^\]]*?\]/i.match(mem1)
		register = extracted.captures[0]
		offset = '0'
		multiplier = '0'
		mreg = ''
	end

	#Parse offset
	#Is there a decimal formatted offset
	if extracted = /\[[^\]]*?(?<![x*\s]{2})(\d+)[^\]]*?\]/i.match(mem1)
		offset = extracted.captures[0]				#parse disp
	end		
	if extracted = /\[[^\]]*?-\s*?\d+/i.match(mem1) then negative = 1 end		#parse negative value
	#Is there a hex formatted offset
	if extracted = /\[[^\]]*?(0x[0-9a-f]+)[^\]]*?\]/i.match(mem1)
		offset = extracted.captures[0]				#parse disp	
	end
	if extracted = /\[[^\]]*?-\s*(0x[0-9a-f]+)/i.match(mem1) then negative = 1 end #parse negative value
	if $debug == 1 then puts "negative value?: %i" % negative end
	#Is there a scale
	if extracted = /\[[^\]]*?(e[acdbs][xip])\s*?\*\s*?([1248])[^\]]*?\]/i.match(mem1)
		mreg = extracted.captures[0] 				#parse scaled register
		multiplier = extracted.captures[1]			#parse scale
		if mem1 !~ /e[acdbs][xip].+e[acdbs][xip]/i	#parse possibility of no base register
			register = 'none'
		end
	end

	#Have to handle implicit * 1 with kid gloves, ie adc eax, [eax + ebp]
	#For the regex, if there's a register followed by adding another register that does not have a scale after it
	if extracted = /\[[^\]]*?(e[acdbs][xip])\s*?\+\s*?(e[acdbs][xip])(([^*]+)|(\s*\*\s*1.+))$/i.match(mem1) then
		reg_a = extracted.captures[0]	#parse first register
		reg_b = extracted.captures[1]	#parse second register
		tworegs = 1
	end	

	#POCESSING
	modrm_p, sib_p, offset, esp_areg_p, multiplier_p, register_p, mreg_p, ebp_areg = pointer2(negative, reg_a, reg_b, register, offset, multiplier, mreg, reg1, tworegs)
	if modrm_p == 'error' then return 1 end

	modrmmodrm_results(multiplier_p, esp_areg_p, m1, modrm_p, instruction, register_p, mreg_p, offset, sib_p, ebp_areg)	
	modrmmodrm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, reg1)

	return 1
end

def jcc(instruction, m1)
	#GateKeeper Parse
	if extracted = /\w+\s+-\s*([^\:]+)$/i.match(instruction) then
		negative = 1
		value = extracted.captures[0]
	elsif extracted = /\w+\s+([^\:]+)$/i.match(instruction) then
		negative = 0
		value = extracted.captures[0]		
	else return false end

	#Another GateKeeper; make sure not r/m
	if extracted = /\S+\s(e?[abcds][xhlpi])/i.match(instruction) or extracted = /\S+\s(\[[^\]]+?\])/i.match(instruction) then return false end

	#Convert to decimal if needed
	if /0x/i.match(value) then value = disp_to_dec(value) end
	value = value.to_i

	#Is it just out of bounds in general
	if value > 4294967301 or (value > 2147483642 and negative == 1) then
		puts "Value provided is out of bounds\n"
		return 1
	end

	#Process with rel32, regardless if the value can fit in a byte or word (because reasons)
	value_u = value
	m1_u = m1
	if negative == 0 then
		m1 = m1.gsub(/^7(.)/, '0F8\1')
		m1 = m1.gsub(/^EB/, 'E9')		
		value = value - 6
		if value > -1 then
			value = littleend(zeropad(value.to_s(16), 8))
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s\n\n", m1 + value, instruction_alt)
		else
			value = 4294967295 - (value.abs - 1)
			value = littleend(value.to_s(16)).upcase
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s\n\n", m1 + value, instruction_alt)
		end
	else
		m1 = m1.gsub(/^7(.)/, '0F8\1')
		m1 = m1.gsub(/^EB/, 'E9')		
		value = value + 5
		value = 4294967295
		value = littleend(value.to_s(16)).upcase
		instruction_alt = objdump(m1 + value)			
		printf("%-34s%-15s\n\n", m1 + value, instruction_alt)	
	end

	#Process with rel16 if possible
	value = value_u
	m1 = m1_u
	if negative == 0 and value < 65541 then
		m1 = m1.gsub(/C7F8/, '66C7F8')
		m1 = m1.gsub(/^E8/, '66E8')
		m1 = m1.gsub(/^7(.)/, '660F8\1')
		m1 = m1.gsub(/^EB/, '66E9')		
		value = value - 5
		if value > -1 then		
			value = littleend(zeropad(value.to_s(16), 4)).upcase
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s (WORD sized alternate)\n", m1 + value, instruction_alt)
		else
			value = 65535 - (value.abs - 1)
			value = littleend(value.to_s(16)).upcase
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s (WORD sized alternate)\n", m1 + value, instruction_alt)
		end	
	elsif negative == 1 and value < 32764 then
		m1 = m1.gsub(/C7F8/, '66C7F8')	
		m1 = m1.gsub(/^E8/, '66E8')			
		m1 = m1.gsub(/^7(.)/, '660F8\1')
		m1 = m1.gsub(/^EB/, '66E9')		
		value = value + 4
		value = 65535 - value
		value = littleend(value.to_s(16)).upcase
		instruction_alt = objdump(m1 + value)			
		printf("%-34s%-15s (WORD sized alternate)\n", m1 + value, instruction_alt)	
	end	

	#Process with rel8 if possible
	if not /^(xbegin|call)/i.match(instruction) then
		value = value_u
		m1 = m1_u
		if negative == 0 and value < 258 then
			value = value - 2
			if value > -1 then			
				value = littleend(zeropad(value.to_s(16), 2)).upcase
				instruction_alt = objdump(m1 + value)			
				printf("%-34s%-15s (BYTE sized alternate)\n", m1 + value, instruction_alt)
			else
				value = 255 - (value.abs - 1)
				value = littleend(value.to_s(16)).upcase
				instruction_alt = objdump(m1 + value)			
				printf("%-34s%-15s (BYTE sized alternate)\n", m1 + value, instruction_alt)	
			end	
		elsif negative == 1 and value < 127 then
			value = value + 1
			value = 255 - value
			value = littleend(value.to_s(16)).upcase
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s (BYTE sized alternate)\n", m1 + value, instruction_alt)	
		end	
	end
	puts "\n"
	return 1
end

def plusreg(instruction, m1)
	#GateKeeper Parse
	if extracted = /^\w+?\s+?(e?[abcds][xpi])$/i.match(instruction) then
		register = extracted.captures[0]
	elsif extracted = /xchg\s+?e?ax\s*,\s*(e?[abcds][xpi])$/i.match(instruction) then
		register = extracted.captures[0]	
	elsif extracted = /xchg\s+?(e?[abcds][xpi])\s*,\s*e?ax$/i.match(instruction) then
		register = extracted.captures[0]	
	else return false end

	#Add to base depending on register used
	if /e?cx/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\11')
		m1 = m1.gsub(/(.+)8$/i, '\19')
	elsif /e?dx/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\12')
		m1 = m1.gsub(/(.+)8$/i, '\1A')
	elsif /e?bx/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\13')
		m1 = m1.gsub(/(.+)8$/i, '\1B')
	elsif /e?sp/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\14')
		m1 = m1.gsub(/(.+)8$/i, '\1C')
	elsif /e?bp/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\15')
		m1 = m1.gsub(/(.+)8$/i, '\1D')
	elsif /e?si/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\16')
		m1 = m1.gsub(/(.+)8$/i, '\1E')
	elsif /e?di/.match(register) then
		m1 = m1.gsub(/(.+)0$/i, '\17')
		m1 = m1.gsub(/(.+)8$/i, '\1F')										
	end

	#Add 16bit prefix if 16bit
	if not /^e/.match(register) then m1 = m1.gsub(/(.+)/i, '66\1') end

	#Display instruction
	instruction_alt = objdump(m1)			
	if /^bswap\s[^e]/i.match(instruction) then
		printf("%-34s%-15s (Invalid tho)\n\n", m1, instruction_alt)
	else
		printf("%-34s%-15s\n\n", m1, instruction_alt)
	end
	sanity_check(m1, instruction)	#See if this output matches nasms	

	return 1
end

def rel8(instruction, m1)
	#GateKeeper Parse
	if extracted = /\w+\s+-\s*(.+)$/i.match(instruction) then
		negative = 1
		value = extracted.captures[0]
	elsif extracted = /\w+\s+(.+)$/i.match(instruction) then
		negative = 0
		value = extracted.captures[0]		
	else return false end

	#Convert to decimal if needed
	if /0x/i.match(value) then value = disp_to_dec(value) end
	value = value.to_i

	#Is it just out of bounds in general
	if value > 4294967301 or (value > 2147483642 and negative == 1) then
		puts "Value provided is out of bounds\n"
		return 1
	end

	#Process with rel8
	if negative == 0 and value < 258 then
		value = value - 2
		if value > -1 then			
			value = littleend(zeropad(value.to_s(16), 2)).upcase
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s\n", m1 + value, instruction_alt)
		else
			value = 255 - (value.abs - 1)
			value = littleend(value.to_s(16)).upcase
			instruction_alt = objdump(m1 + value)			
			printf("%-34s%-15s\n", m1 + value, instruction_alt)	
		end	
	elsif negative == 1 and value < 127 then
		value = value + 1
		value = 255 - value
		value = littleend(value.to_s(16)).upcase
		instruction_alt = objdump(m1 + value)			
		printf("%-34s%-15s\n", m1 + value, instruction_alt)	
	else
		puts "Value provided is out of bounds\n"
	end	
	puts "\n"
	return 1
end

def imm16imm8(instruction, m1)
	#GateKeeper Parse
	if extracted = /^\S+\s(\d+),\s*(\d+)$/i.match(instruction) then
		imm16 = littleend(imm16(extracted.captures[0]))
		imm8 = imm8(extracted.captures[1])
	elsif extracted = /^\S+\s(\d+),\s*0x([a-f0-9]+)$/i.match(instruction) then
		imm16 = littleend(imm16(extracted.captures[0]))
		imm8 = zeropad(extracted.captures[1], 2)
	elsif extracted = /^\S+\s0x([a-f0-9]+),\s*(\d+)$/i.match(instruction) then
		imm16 = littleend(zeropad(extracted.captures[0],4))
		imm8 = imm8(extracted.captures[1])
	elsif extracted = /^\S+\s0x([a-f0-9]+),\s*0x([a-f0-9]+)$/i.match(instruction) then
		imm16 = littleend(zeropad(extracted.captures[0],4))
		imm8 = zeropad(extracted.captures[1], 2)						
	else return false end

	instruction_alt = objdump(m1 + imm16 + imm8)
	printf("%-34s%-15s\n\n", m1 + imm16 + imm8, instruction_alt)	
	sanity_check(m1 + imm16 + imm8, instruction)	#See if this output matches nasms	
	return 1
end

def inaldx(instruction)
	#GateKeeper Parse
	if extracted = /^in\sal,\s*dx$/i.match(instruction) then
		instruction_alt = objdump('ec')
		printf("%-34s%-15s\n\n", 'EC', instruction_alt)
	elsif extracted = /^in\sax,\s*dx$/i.match(instruction) then
		instruction_alt = objdump('ec')
		printf("%-34s%-15s\n\n", '66ED', instruction_alt)
	elsif extracted = /^in\seax,\s*dx$/i.match(instruction) then
		instruction_alt = objdump('ec')
		printf("%-34s%-15s\n\n", 'ED', instruction_alt)
	else return false end
	return 1
end

def opimm8(instruction, m1)
	#GateKeeper Parse
	if extracted = /^int(3|\s*3|\s*0x0?3)$/i.match(instruction) then
		instruction_alt = objdump("CD03")
		printf("%-34s%-15s\n\n", "CC03", instruction_alt)	
		instruction_alt = objdump("CC")
		printf("%-34s%-15s (One Byte Version)\n\n", "CC", instruction_alt)	
		return 1	
	elsif extracted = /^\S+\s(\d+)$/i.match(instruction) then
		imm8 = imm8(extracted.captures[0])
	elsif extracted = /^\S+\s0x([0-9a-f]+)$/i.match(instruction) then
		imm8 = zeropad(extracted.captures[0], 2)
	else return false end

	instruction_alt = objdump(m1 + imm8)
	printf("%-34s%-15s\n\n", m1 + imm8, instruction_alt)	
	sanity_check(m1 + imm8, instruction)	#See if this output matches nasms
	return 1
end

def pushimm(instruction)
	#GateKeeper Parse
	if extracted = /^push\s(\d+)$/i.match(instruction) then
		ammount = (extracted.captures[0]).to_i
		if ammount > -1 and ammount < 256 then
			ammount = zeropad(ammount.to_s(16), 2)
			m1 = '6A' 
		elsif ammount > 255 and ammount < 65536 then
			ammount1 = littleend(zeropad(ammount.to_s(16), 8))
			m1 = '68'
			instruction_alt = objdump(m1 + ammount1)
			printf("%-34s%-15s\n\n", m1 + ammount1, instruction_alt)	
			sanity_check(m1 + ammount1, instruction)	#See if this output matches nasms
			ammount2 = littleend(zeropad(ammount.to_s(16), 4))
			m1 = '6668'
			instruction_alt = objdump(m1 + ammount2)
			printf("%-34s%-15s (WORD Sized Alternate)\n\n", m1 + ammount2, instruction_alt)	
			return 1
		elsif ammount > 65535 and ammount < 4294836226 then
			ammount = littleend(zeropad(ammount.to_s(16), 8))
			m1 = '68'
		end 
		instruction_alt = objdump(m1 + ammount)
		printf("%-34s%-15s\n\n", m1 + ammount, instruction_alt)	
		sanity_check(m1 + ammount, instruction)	#See if this output matches nasms
		return 1
	elsif extracted = /^push\s0x([a-f0-9]+)$/i.match(instruction) then
		ammount = (extracted.captures[0])
		if disp_to_dec(ammount) > -1 and disp_to_dec(ammount) < 256 then
			ammount = zeropad(ammount, 2)
			m1 = '6A' 
		elsif disp_to_dec(ammount) > 255 and disp_to_dec(ammount) < 65536 then
			ammount1 = littleend(zeropad(ammount, 8))
			m1 = '68'
			instruction_alt = objdump(m1 + ammount1)
			printf("%-34s%-15s\n\n", m1 + ammount1, instruction_alt)	
			sanity_check(m1 + ammount1, instruction)	#See if this output matches nasms
			ammount2 = littleend(zeropad(ammount, 4))
			m1 = '6668'
			instruction_alt = objdump(m1 + ammount2)
			printf("%-34s%-15s (WORD Sized Alternate)\n\n", m1 + ammount2, instruction_alt)	
			return 1
		elsif disp_to_dec(ammount) > 65535 and disp_to_dec(ammount) < 4294836226 then
			ammount = littleend(zeropad(ammount, 8))
			m1 = '68'
		end 
		instruction_alt = objdump(m1 + ammount)
		printf("%-34s%-15s\n\n", m1 + ammount, instruction_alt)	
		sanity_check(m1 + ammount, instruction)	#See if this output matches nasms
		return 1
	else return false end
end

def ptr(instruction, m1)
	#GateKeeper Parse
	if extracted = /^\S+\s(\d+|0x[0-9a-f]+):(\d+|0x[0-9a-f]+)$/i.match(instruction) then
		num1 = extracted.captures[0]
		num2 = extracted.captures[1]
	else return false end

	#Convert to real (non hex)
	if /^0x/i.match(num1) then num1 = disp_to_dec(num1) end
	if /^0x/i.match(num2) then num2 = disp_to_dec(num2) end

	num1 = num1.to_i
	num2 = num2.to_i

	#Range Check1
	if num1 < 0 or num1 > 65535 then
		printf("First pointer is out of range\n\n")
		return false
	end
	#Range Check2
	if num2 < 0 or num2 > 4294836225 then
		printf("Second pointer is out of range\n\n")
		return false
	end

	#Convert first pointer into machine code
	num1 = littleend(zeropad(num1.to_s(16), 4))

	if num2 > 65535 then
		num2 = littleend(zeropad(num2.to_s(16), 8))
	else
		num2a = littleend(zeropad(num2.to_s(16), 8))
		instruction_alt = objdump(m1 + num2a + num1)
		printf("%-34s%-15s\n\n", m1 + num2a + num1, instruction_alt)	
		sanity_check(m1 + num2a + num1, instruction)	#See if this output matches nasms

		num2b = littleend(zeropad(num2.to_s(16), 4))
		m1 = m1.gsub(/^(.+)$/i, '66\1')
		instruction_alt = objdump(m1 + num2b + num1)
		printf("%-34s%-15s (WORD Size Alternate)\n\n", m1 + num2b + num1, instruction_alt)	
		return 1		
	end

	instruction_alt = objdump(m1 + num2 + num1)
	printf("%-34s%-15s\n\n", m1 + num2 + num1, instruction_alt)	
	sanity_check(m1 + num2 + num1, instruction)	#See if this output matches nasms
	return 1
end

def opmodrm(instruction, m1, num)
	#instruction - full unparsed instruction
	#op - instruction name
	#m1 - machine code for it
	#num - the encoded instruction within the modr/m (i.e CALL r/m16 is/2)
	#GateKeeper Parse
	if extracted = /^\S+\s(e?[abcds][xhlpi])/i.match(instruction)
		form = 'register'
		reg = extracted.captures[0]
		#Remove gratuitus byte/word/dword declaration, it is implied by operand
		instruction = instruction.gsub(/\s*(byte|word|dword)\s*/,' ')
	elsif extracted = /^\S+\s*(byte|word|dword)?\s*(\[[^\]]+?\])/i.match(instruction)
		form = 'pointer'
		mem = extracted.captures[1]	
		#Parse wordsize and make sure it exists	
		if extracted = /(byte|word|dword)/i.match(instruction)
			datasize = extracted.captures[0]
		else
			puts "Must specify datasize for this kind of instruction (i.e.: dec byte [eax + ebx])\n\n"
			return 1
		end
	else return false end

	#Kick 8-bit instructions out
	if /^(call|jmp|nop|pop|push)/i.match(instruction) and (datasize == 'byte' or /(al|cl|dl|bl|ah|ch|dh|bh)/i.match(reg)) then
		puts "This instruction doesn't support 8-bit OP r/m instructions\n\n"
		return 1
	end

	#Only keep if 16-bit
	if /^(lldt|lmsw|ltr|str|verr|verw)/i.match(instruction) and (datasize != 'word' and not /^(ax|cx|dx|bx|sp|bp|si|di)$/i.match(reg)) then
		puts "This instruction only supports 16-bit OP r/m instructions\n\n"
		return 1
	end

	#Only keep if 16-bit
	if /^(smsw)/i.match(instruction) and (datasize != 'word' and not /^(eax|ecx|edx|ebx|esp|ebp|esi|edi)$/i.match(reg)) then
		puts "This instruction only supports 16-bit OP r/m instructions\n\n"
		return 1
	end

	#Only keep if 8-bit pointer
	if /^(cflush|invlpg|prefetch0|prefetch1|prefetch2|prefetchnta|prefetchw|prefetchwt1|sgdt|sidt)/i.match(instruction) and (datasize != 'byte' or form != "pointer") then
		puts "This instruction only supports 8-bit pointers\n\n"
		return 1
	end

	#Process/Convert machinecode for opcode (8/16/32 bit conversion)
	if form == 'pointer' then
		#Kick out instructions

		#if 16-bit	
		if datasize == 'word' then
			m1 = m1.gsub(/^FE/i, '66FF')		#DEC/INC/PUSH
			m1 = m1.gsub(/^F6/i, '66F7')		#DIV/IDIV/IMUL
			m1 = m1.gsub(/^0F1F/i, '660F1F')	#NOP	
			m1 = m1.gsub(/^8F/i, '668F')		#POP					
		end
		#if 32-bit
		if datasize == 'dword' then
			m1 = m1.gsub(/^FE/i, 'FF')			#DEC/INC/PUSH
			m1 = m1.gsub(/^F6/i, 'F7')			#DIV/IDIV/IMUL						
		end
	elsif form == 'register' then
		#Kick out instructions
	
		#if 16-bit
		if /^[abcds][xpi]/i.match(reg) then
			m1 = m1.gsub(/^FE/i, '66FF')		#DEC/INC/PUSH
			m1 = m1.gsub(/^F6/i, '66F7')		#DIV/IDIV/IMUL
			m1 = m1.gsub(/^0F1F/i, '660F1F')	#NOP
			m1 = m1.gsub(/^8F/i, '668F')		#POP								
		end
		#if 32-bit						
		if /^e[abcds][xpi]/i.match(reg) then
			m1 = m1.gsub(/^FE/i, 'FF')			#DEC/INC/PUSH
			m1 = m1.gsub(/^F6/i, 'F7')			#DIV/IDIV/IMUL										
		end

		#mod = 2 (11xxxxxx) / 192
		#op = num (xxoooxxx) / num * 8
		#register = (xxxxxrrr)
		modrm = 192 + (num.to_i * 8)
		if /e?c[lx]/i.match(reg) then modrm = modrm + 1
		elsif /e?d[lx]/i.match(reg) then modrm = modrm + 2
		elsif /e?b[lx]/i.match(reg) then modrm = modrm + 3
		elsif /e?[as][hp]/i.match(reg) then modrm = modrm + 4
		elsif /e?(ch|bp)/i.match(reg) then modrm = modrm + 5
		elsif /e?[sd][hi]/i.match(reg) then modrm = modrm + 6
		elsif /e?[bd][hi]/i.match(reg) then modrm = modrm + 7	
		end									
		modrm = (modrm.to_s(16)).upcase	

		if /^dec/i.match(instruction) and /FF$/i.match(m1) then
			plusreg(instruction, "48")
			instruction_alt = objdump(m1 + modrm)
			printf("%-34s%-15s (ModRM Alternate)\n\n", m1 + modrm, instruction_alt)
		elsif /^inc/i.match(instruction) and /FF$/i.match(m1) then
			plusreg(instruction, "40")
			instruction_alt = objdump(m1 + modrm)
			printf("%-34s%-15s (ModRM Alternate)\n\n", m1 + modrm, instruction_alt)
		elsif /^pop/i.match(instruction) and /8F$/i.match(m1) then
			plusreg(instruction, "58")
			instruction_alt = objdump(m1 + modrm)
			printf("%-34s%-15s (ModRM Alternate)\n\n", m1 + modrm, instruction_alt)		
		elsif /^push/i.match(instruction) and /FF$/i.match(m1) then
			plusreg(instruction, "50")
			instruction_alt = objdump(m1 + modrm)
			printf("%-34s%-15s (ModRM Alternate)\n\n", m1 + modrm, instruction_alt)					
		else
			instruction_alt = objdump(m1 + modrm)
			printf("%-34s%-15s\n\n", m1 + modrm, instruction_alt)
		end
		return 1	
	end

	###############################
	#           PARSING           #
	###############################	

	#Parse register with no offset or scaled register
	if extracted = /\[[^\]]*?(e[acdbs][xip])[^\]]*?\]/i.match(mem)
		register = extracted.captures[0]
		offset = '0'
		multiplier = '0'
		mreg = ''
	end

	#Parse offset
	#Is there a decimal formatted offset
	if extracted = /\[[^\]]*?(?<![x*\s]{2})(\d+)[^\]]*?\]/i.match(mem)
		offset = extracted.captures[0]				#parse disp
	end		
	if extracted = /\[[^\]]*?-\s*?\d+/i.match(mem) then negative = 1 end		#parse negative value
	#Is there a hex formatted offset
	if extracted = /\[[^\]]*?(0x[0-9a-f]+)[^\]]*?\]/i.match(mem)
		offset = extracted.captures[0]				#parse disp	
	end
	negative = 0
	if extracted = /\[[^\]]*?-\s*(0x[0-9a-f]+)/i.match(mem) then negative = 1 end #parse negative value
	if $debug == 1 then puts "negative value?: %i" % negative end
	#Is there a scale
	if extracted = /\[[^\]]*?(e[acdbs][xip])\s*?\*\s*?([1248])[^\]]*?\]/i.match(mem)
		mreg = extracted.captures[0] 				#parse scaled register
		multiplier = extracted.captures[1]			#parse scale
		if mem !~ /e[acdbs][xip].+e[acdbs][xip]/i	#parse possibility of no base register
			register = 'none'
		end
	end

	#Have to handle implicit * 1 with kid gloves, ie adc eax, [eax + ebp]
	#For the regex, if there's a register followed by adding another register that does not have a scale after it
	if extracted = /\[[^\]]*?(e[acdbs][xip])\s*?\+\s*?(e[acdbs][xip])(([^*]+)|(\s*\*\s*1.+))$/i.match(mem) then
		reg_a = extracted.captures[0]	#parse first register
		reg_b = extracted.captures[1]	#parse second register
		tworegs = 1
	end	

	#POCESSING
	modrm_p, sib_p, offset, esp_areg_p, multiplier_p, register_p, mreg_p, ebp_areg = pointer3(negative, reg_a, reg_b, register, offset, multiplier, mreg, num)
	if modrm_p == 'error' then return 1 end

	opmodrm_results(multiplier_p, esp_areg_p, m1, modrm_p, instruction, register_p, mreg_p, offset, sib_p, ebp_areg)	
	opmodrm_pointer_alternates(reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, num)

	return 1
end

#--------------------------------
# 	Other Helper Routines		#
#--------------------------------

def zeropad (data, bytes)
	#A function that adds leading zeros for the specified amount
	#of bytes. Maybe this could be a sprintf equiv...
	len = data.length	
	zeros = bytes - len
	data = ('0' * zeros + data).upcase
	return data
end

def fpad (data, bytes)
	#A function that adds leading zeros for the specified amount
	len = data.length
	ffff = bytes - len
	data = ('F' * ffff + data).upcase
	return data
end

def signed_pad (data, negative)
	#Takes a signed byte and pads it to 32 bits (signed)
	data = imm8(data)	#remove 0x prefix
	if negative == 1 
		data = (fpad((256 - (data.to_i(16).to_s(10)).to_i).to_s(16), 8)).upcase
	else
		data = (zeropad(data, 8)).upcase
	end
	return data
end

def littleend (data)
	#This function reverses bytes to be little-endian
	returndata = ''
	while extracted = /.+(..)$/i.match(data) do
		returndata = (returndata + extracted.captures[0]).upcase
		data = data.gsub(/(.+)..$/i, '\1')
	end
	returndata = "%s%s" % [returndata, data]
	return returndata
end

def disp_to_dec (disp)
	#This routine takes a decimal OR hexidecimal string value and returns the integer
	if /^0x/i.match(disp)
		disp = disp.gsub(/0x(.+)/, '\1')
		disp = disp.to_i(16)
	else
		disp = disp.to_i
	end
	return disp
end

def modrmimm_results (multiplier_p, esp_areg_p, m1, modrm_p, s_operand_p, instruction, register_p, mreg_p, offset, sib_p)		
	if multiplier_p == '0' and !esp_areg_p then
		instruction_alt = objdump(m1 + modrm_p + s_operand_p)			
		printf("%-34s%-15s\n\n", m1 + modrm_p + s_operand_p, instruction_alt)
		sanity_check(m1 + modrm_p + s_operand_p, instruction)	#See if this output matches nasms
	elsif !register_p and !multiplier_p and !mreg_p and offset then
		instruction_alt = objdump(m1 + modrm_p + s_operand_p)			
		printf("%-34s%-15s\n\n", m1 + modrm_p + s_operand_p, instruction_alt)
		sanity_check(m1 + modrm_p + s_operand_p, instruction)	#See if this output matches nasms
	else 
		instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)			
		printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)		
		sanity_check(m1 + modrm_p + sib_p + s_operand_p, instruction)	#See if this output matches nasms
	end
end

def modrmimm_results_so1 (multiplier_p, esp_areg_p, m1, modrm_p, instruction, register_p, mreg_p, offset, sib_p)		
	#Source operand is 1, and is built into instruction opcode
	if multiplier_p == '0' and !esp_areg_p then
		instruction_alt = objdump(m1 + modrm_p)		
		printf("%-34s%-15s\n\n", m1 + modrm_p, instruction_alt)
		sanity_check(m1 + modrm_p, instruction)	#See if this output matches nasms
	elsif !register_p and !multiplier_p and !mreg_p and offset then
		instruction_alt = objdump(m1 + modrm_p)		
		printf("%-34s%-15s\n\n", m1 + modrm_p, instruction_alt)
		sanity_check(m1 + modrm_p, instruction)	#See if this output matches nasms
	else 
		instruction_alt = objdump(m1 + modrm_p + sib_p)		
		printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p, instruction_alt)
		sanity_check(m1 + modrm_p + sib_p, instruction)	#See if this output matches nasms
	end
end

def modrmmodrm_results (multiplier_p, esp_areg_p, m1, modrm_p, instruction, register_p, mreg_p, offset, sib_p, ebp_areg)		
	if ebp_areg and offset == '0' then
		if multiplier_p == '0' and !esp_areg_p then
			instruction_alt = objdump(m1 + modrm_p + '00')				
			printf("%-34s%-15s\n\n", m1 + modrm_p + '00', instruction_alt)
			sanity_check(m1 + modrm_p + '00', instruction)	#See if this output matches nasms
		else 
			instruction_alt = objdump(m1 + modrm_p + sib_p + '00')				
			printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p + '00', instruction_alt)
			sanity_check(m1 + modrm_p + sib_p + '00', instruction)	#See if this output matches nasms
		end
	else
		if offset != '0'		#if there's a displacment
			if multiplier_p == '0' and !esp_areg_p then
				instruction_alt = objdump(m1 + modrm_p + offset)			
				printf("%-34s%-15s\n\n", m1 + modrm_p + offset, instruction_alt)
				sanity_check(m1 + modrm_p + offset, instruction)	#See if this output matches nasms
			elsif !register_p and !multiplier_p and !mreg_p and offset then
				instruction_alt = objdump(m1 + modrm_p + offset)				
				printf("%-34s%-15s\n\n", m1 + modrm_p + offset, instruction_alt)
				sanity_check(m1 + modrm_p + offset, instruction)	#See if this output matches nasms
			else 
				instruction_alt = objdump(m1 + modrm_p + sib_p + offset)			
				printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p + offset, instruction_alt)				
				sanity_check(m1 + modrm_p + sib_p + offset, instruction)	#See if this output matches nasms
			end
		else
			if multiplier_p == '0' and !esp_areg_p then
				instruction_alt = objdump(m1 + modrm_p)				
				printf("%-34s%-15s\n\n", m1 + modrm_p, instruction_alt)
				sanity_check(m1 + modrm_p, instruction)	#See if this output matches nasms
			else 
				instruction_alt = objdump(m1 + modrm_p + sib_p)				
				printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p, instruction_alt)
				sanity_check(m1 + modrm_p + sib_p, instruction)	#See if this output matches nasms
			end
		end
	end
end

def modrmimm_pointer_alternates (reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
	extra_space = 0
	#Try to force commutative property
	if fcpmodrmimm(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num) then extra_space = 1 end
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	if disp8to32modrmimm(offset, negative, s_operand_p, s_operand, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p) then extra_space = 1 end
	#If there is no displacement, make a displacement of 0x00...
	if addnullmodrmimm(offset, modrm_p, m1, sib_p, s_operand_p, register_p, multiplier_p, esp_areg_p) then extra_space = 1 end
	#Force communative property with added null disp8 (if possible)
	if addnullfcpmodrmimm(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num) then extra_space = 1 end
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if sibdoublemodrmimm(tworegs, reg_a, reg_b, modrm_p, sib_p, offset, s_operand_p, m1, negative, s_operand) then extra_space = 1 end
	if extra_space == 1 then puts "\n" end
end

def modrmmodrm_pointer_alternates (reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, reg1)
	extra_space = 0
	#Try to force commutative property
	if fcpmodrmmodrm(reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, reg1) then extra_space = 1 end
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	if disp8to32modrmmodrm(offset, negative, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p) then extra_space = 1 end
	#If there is no displacement, make a displacement of 0x00...
	if addnullmodrmmodrm(offset, modrm_p, m1, sib_p, register_p, multiplier_p, esp_areg_p) then extra_space = 1 end
	#Force communative property with added null disp8 (if possible)
	if addnullfcpmodrmmodrm(reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, reg1) then extra_space = 1 end
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if sibdoublemodrmmodrm(tworegs, reg_a, reg_b, modrm_p, sib_p, offset, m1, negative, reg1) then extra_space = 1 end
	if extra_space == 1 then puts "\n" end
end




def opmodrm_results (multiplier_p, esp_areg_p, m1, modrm_p, instruction, register_p, mreg_p, offset, sib_p, ebp_areg)		
	if ebp_areg and offset == '0' then
		if multiplier_p == '0' and !esp_areg_p then
			instruction_alt = objdump(m1 + modrm_p + '00')				
			printf("%-34s%-15s\n\n", m1 + modrm_p + '00', instruction_alt)
			sanity_check(m1 + modrm_p + '00', instruction)	#See if this output matches nasms
		else 
			instruction_alt = objdump(m1 + modrm_p + sib_p + '00')				
			printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p + '00', instruction_alt)
			sanity_check(m1 + modrm_p + sib_p + '00', instruction)	#See if this output matches nasms
		end
	else
		if offset != '0'		#if there's a displacment
			if multiplier_p == '0' and !esp_areg_p then
				instruction_alt = objdump(m1 + modrm_p + offset)			
				printf("%-34s%-15s\n\n", m1 + modrm_p + offset, instruction_alt)
				sanity_check(m1 + modrm_p + offset, instruction)	#See if this output matches nasms
			elsif !register_p and !multiplier_p and !mreg_p and offset then
				instruction_alt = objdump(m1 + modrm_p + offset)				
				printf("%-34s%-15s\n\n", m1 + modrm_p + offset, instruction_alt)
				sanity_check(m1 + modrm_p + offset, instruction)	#See if this output matches nasms
			else 
				instruction_alt = objdump(m1 + modrm_p + sib_p + offset)			
				printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p + offset, instruction_alt)				
				sanity_check(m1 + modrm_p + sib_p + offset, instruction)	#See if this output matches nasms
			end
		else
			if multiplier_p == '0' and !esp_areg_p then
				instruction_alt = objdump(m1 + modrm_p)				
				printf("%-34s%-15s\n\n", m1 + modrm_p, instruction_alt)
				sanity_check(m1 + modrm_p, instruction)	#See if this output matches nasms
			else 
				instruction_alt = objdump(m1 + modrm_p + sib_p)				
				printf("%-34s%-15s\n\n", m1 + modrm_p + sib_p, instruction_alt)
				sanity_check(m1 + modrm_p + sib_p, instruction)	#See if this output matches nasms
			end
		end
	end
end

def opmodrm_pointer_alternates (reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, num)
	extra_space = 0
	#Try to force commutative property
	if fcpopmodrm(reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, num) then extra_space = 1 end
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	if disp8to32opmodrm(offset, negative, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p) then extra_space = 1 end
	#If there is no displacement, make a displacement of 0x00...
	if addnullopmodrm(offset, modrm_p, m1, sib_p, register_p, multiplier_p, esp_areg_p) then extra_space = 1 end
	#Force communative property with added null disp8 (if possible)
	if addnullfcpopmodrm(reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, num) then extra_space = 1 end
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if sibdoubleopmodrm(tworegs, reg_a, reg_b, modrm_p, sib_p, offset, m1, negative) then extra_space = 1 end
	if extra_space == 1 then puts "\n" end
end




def pointer (negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, num)
	#If multiplied register is scaled by 1, and there is no base register, then just use register as base
	if mreg != '' and  multiplier == '1' and register == 'none' then 
		register = mreg 	#base register is now the scaled register
		mreg = ''			#there is no longer a scaled register
		multiplier = '0'	#there is no longer a scale
	end
	#Handle ESP scale exception, unless it's * 1, and make it base and make the base scaled by * 1
	if mreg == 'esp' then
		if multiplier == '1' and register != 'esp' then
			mreg = register
			register = 'esp'
		else 
			printf("esp is an invalid Scaled Index\n\n") 
			return ["error", '0', '0', '0', '0', '0', '0']
		end
	end	

	#Have to handle implicit * 1 with kid gloves, ie adc byte [eax + ebp], 88
	if reg_a != '' and reg_b != '' then
		if $debug == 1 then puts "reg1 is %s" % reg_a end
		if $debug == 1 then puts "reg2 is %s" % reg_b end
		if reg_a == 'esp' and reg_b == 'esp' then
			printf("esp is an invalid Scaled Index\n\n") 
			return ["error", '0', '0', '0', '0', '0', '0']
		end
		if reg_b == 'esp' then			#esp can't be scaled / can't be 2nd register
			mreg = reg_a				#make first register the scaled one
			register = reg_b			#make second register the base one
		else
			mreg = reg_b				#first is fine as base
			register = reg_a			#second is fine as scaled
		end
		multiplier = '1'				#scale will always be '1' here; as it's implied by not have a scale for second reg
	end

	#All Values parsed:
	if $debug == 1 then puts "Register: %s" % register end
	if $debug == 1 then puts "Offset: %s" % offset end
	if $debug == 1 then puts "Multiplier %s" % multiplier end
	if $debug == 1 then puts "Multiplied Register %s" % mreg end

	#if ebp *2, base reg is ebp, scaled reg is ebp * 1
	if register == 'none' and mreg == 'ebp' and multiplier == '2' then
		register = 'ebp'
		multiplier = '1'
	end 

	# Set Flags
	if register == 'esp' then esp_areg = 1 end
	if register == 'ebp' then ebp_areg = 1 end

	if $debug == 1 then puts "esp areg is %s" % esp_areg end
	if $debug == 1 then puts "ebp areg is %s" % ebp_areg end

	#if all we have is the displacement, the we are ready to output the machine code for it
	if !register and !multiplier and !mreg and offset then
		if negative == 1 then
			offset = (256 - disp_to_dec(offset).to_i).to_s			#2's compliment	8bit	
			s_operand = littleend(fpad(imm8(offset),8)) + s_operand #the 0xff pad it to disp32
			sib = 0
			return ['15', sib, s_operand, esp_areg, multiplier, register, mreg]
		else
			s_operand = littleend(zeropad(imm32(offset),8)) + s_operand
			sib = 0
			return ['15', sib, s_operand, esp_areg, multiplier, register, mreg]
		end
	end

	sib = 0 #default
	#Process Mod (ModR/M)
	if disp_to_dec(offset) > 4294967040 then modrm = 64
		elsif disp_to_dec(offset) > 2147483647 and negative == 1 then modrm = 128
		elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1 then modrm = 128 
		elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then modrm = 64
		elsif disp_to_dec(offset) > 0 and disp_to_dec(offset) < 128 and negative == 0 then modrm = 64
		elsif disp_to_dec(offset) > 127 and negative == 0 then modrm = 128
		else modrm = 0
	end

	#Process Instruction (ModR/M)
	modrm = modrm + (num.to_i * 8)
	if multiplier == '0' and !esp_areg then
		#Process Register (ModR/M)
		if register == 'ecx' then modrm = modrm + 1
			elsif register == 'edx' then modrm = modrm + 2
			elsif register == 'ebx' then modrm = modrm + 3
			elsif register == 'ebp' and disp_to_dec(offset) > 0 then modrm = modrm + 5
			elsif register == 'esi' then modrm = modrm + 6
			elsif register == 'edi' then modrm = modrm + 7
		end
	else
		#Proccess Scale (SIB)
		modrm = modrm + 4	#Activate SIB byte in ModR/M
		if multiplier == '2' then sib = 64
			elsif multiplier == '4' then sib = 128
			elsif multiplier == '8' then sib = 192
		end
		#Process The Index/Register (SIB)
		if mreg == 'ecx' then sib = sib + 8
			elsif mreg == 'edx' then sib = sib + 16
			elsif mreg == 'ebx' then sib = sib + 24
			elsif mreg == 'ebp' then sib = sib + 40
			elsif mreg == 'esi' then sib = sib + 48
			elsif mreg == 'edi' then sib = sib + 56
		end
		if register == 'ecx' then sib = sib + 1
			elsif register == 'edx' then sib = sib + 2
			elsif register == 'ebx' then sib = sib + 3
			elsif register == 'esp' then sib = sib + 4
			elsif register == 'esi' then sib = sib + 6
			elsif register == 'edi' then sib = sib + 7
		end
		if register == 'none' and multiplier == '2' then 
			if mreg == 'eax' then sib = 0
				elsif mreg == 'ecx' then sib = 9
				elsif mreg == 'edx' then sib = 18
				elsif mreg == 'ebx' then sib = 27
				elsif mreg == 'ebp' then sib = 45	
				elsif mreg == 'esi' then sib = 54
				elsif mreg == 'edi' then sib = 63
			end
		end	
		if ebp_areg then sib = sib + 5 end 
		if esp_areg and multiplier == '0' then sib = sib + 32 end
	end
	#if there's no base register, and not scaled esp, then add 5 to SIB (for the [*] no base register)
	#	32-bit displacement also needed (handled in displacement processing later)
	if register == 'none' and (multiplier == '4' or multiplier == '8') then sib = sib + 5 end

	if $debug == 1 then puts "offset is %i" % disp_to_dec(offset) end
	#if there's no base register, and not scaled esp, then 32-bit displacemnet needed
	if disp_to_dec(offset) > 4294967040 and not negative == 1 then
		#32bit conversion to 8bit 2's compliment	
		offset = (256 - disp_to_dec((4294967296 - disp_to_dec(offset).to_i).to_s).to_i).to_s #Get absolute number and 2's compliment 8bit	
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			s_operand = littleend(zeropad(imm32(offset),8)) + s_operand
			modrm = modrm - 64
		else s_operand = littleend(zeropad(imm8(offset),2)) + s_operand	end	
	elsif disp_to_dec(offset) > 2147483647 and negative == 1 then
		puts "Invalid negative displacement\n\n"
		return ["error", '0', '0', '0', '0', '0', '0']
	elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1	then
		#32bit 2's compliment
		offset = (4294967296 - disp_to_dec(offset).to_i).to_s	#2's compliment
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		s_operand = littleend(zeropad(imm32(offset),8)) + s_operand	
	elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then
		#8bit 2's compliment
		offset = (256 - disp_to_dec(offset).to_i).to_s			#2's compliment
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			s_operand = littleend(zeropad(imm32(offset),8)) + s_operand
			modrm = modrm - 64
		else s_operand = littleend(zeropad(imm8(offset),2)) + s_operand	end		
	elsif disp_to_dec(offset) > 0 and disp_to_dec(offset) < 128 and negative == 0 then
		#8bit
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			s_operand = littleend(zeropad(imm32(offset),8)) + s_operand
			modrm = modrm - 64
		else s_operand = littleend(zeropad(imm8(offset),2)) + s_operand	end	
	elsif disp_to_dec(offset) > 127 and negative == 0 then
		#32bit
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		s_operand = littleend(zeropad(imm32(offset),8)) + s_operand			
	elsif disp_to_dec(offset) == 0 then
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			s_operand = littleend(zeropad(imm32(offset),8)) + s_operand
		end			
		if ebp_areg then 
			modrm = modrm + 64
			if multiplier == '0' then modrm = modrm + 5 end
			s_operand = '00' + s_operand
		end	
	end

	sib = zeropad(sib.to_s(16), 2)
	modrm = zeropad(modrm.to_s(16), 2)
	return [modrm, sib, s_operand, esp_areg, multiplier, register, mreg]
end

def pointer2 (negative, reg_a, reg_b, register, offset, multiplier, mreg, reg1, tworegs)
	#If multiplied register is scaled by 1, and there is no base register, then just use register as base
	if mreg != '' and  multiplier == '1' and register == 'none' then 
		register = mreg 	#base register is now the scaled register
		mreg = ''			#there is no longer a scaled register
		multiplier = '0'	#there is no longer a scale
	end
	#Handle ESP scale exception, unless it's * 1, and make it base and make the base scaled by * 1
	if mreg == 'esp' then
		if multiplier == '1' and register != 'esp' then
			mreg = register
			register = 'esp'
		else 
			printf("esp is an invalid Scaled Index\n\n") 
			return ["error", '0', '0', '0', '0', '0', '0', '0']
		end
	end	

	#Have to handle implicit * 1 with kid gloves, ie adc byte [eax + ebp], 88
	if reg_a != '' and reg_b != '' and tworegs == 1 then
		if $debug == 1 then puts "reg1 is %s" % reg_a end
		if $debug == 1 then puts "reg2 is %s" % reg_b end
		if reg_a == 'esp' and reg_b == 'esp' then
			printf("esp is an invalid Scaled Index\n\n") 
			return ["error", '0', '0', '0', '0', '0', '0', '0']
		end
		if reg_b == 'esp' then			#esp can't be scaled / can't be 2nd register
			mreg = reg_a				#make first register the scaled one
			register = reg_b			#make second register the base one
		else
			mreg = reg_b				#first is fine as base
			register = reg_a			#second is fine as scaled
		end
		multiplier = '1'				#scale will always be '1' here; as it's implied by not have a scale for second reg
	end

	#All Values parsed:
	if $debug == 1 then puts "Register: %s" % register end
	if $debug == 1 then puts "Offset: %s" % offset end
	if $debug == 1 then puts "Multiplier %s" % multiplier end
	if $debug == 1 then puts "Multiplied Register %s" % mreg end

	#if ebp *2, base reg is ebp, scaled reg is ebp * 1
	if register == 'none' and mreg == 'ebp' and multiplier == '2' then
		register = 'ebp'
		multiplier = '1'
	end 

	# Set Flags
	if register == 'esp' then esp_areg = 1 end
	if register == 'ebp' then ebp_areg = 1 end

	if $debug == 1 then puts "esp areg is %s" % esp_areg end
	if $debug == 1 then puts "ebp areg is %s" % ebp_areg end

	#Stage ModR/M with value supplied by source register
	if extracted = /e?a[xl]/i.match(reg1) then modrm = 0
	elsif extracted = /e?c[xl]/i.match(reg1) then modrm = 8
	elsif extracted = /e?d[xl]/i.match(reg1) then modrm = 16
	elsif extracted = /e?b[xl]/i.match(reg1) then modrm = 24
	elsif extracted = /e?sp|ah/i.match(reg1) then modrm = 32
	elsif extracted = /e?bp|ch/i.match(reg1) then modrm = 40
	elsif extracted = /e?si|dh/i.match(reg1) then modrm = 48
	elsif extracted = /e?di|bh/i.match(reg1) then modrm = 56
	end

	#if all we have is the displacement, the we are ready to output the machine code for it
	if !register and !multiplier and !mreg and offset then
		modrm = modrm + 5
		modrm = zeropad(modrm.to_s(16), 2)
		if negative == 1 then
			offset = (256 - disp_to_dec(offset).to_i).to_s			#2's compliment	8bit	
			offset = littleend(fpad(imm8(offset),8)) #the 0xff pad it to disp32
			sib = 0
			return [modrm, sib, offset, esp_areg, multiplier, register, mreg, ebp_areg]
		else
			offset = littleend(zeropad(imm32(offset),8))
			sib = 0
			return [modrm, sib, offset, esp_areg, multiplier, register, mreg, ebp_areg]
		end
	end

	sib = 0 #default
	#Process Mod (ModR/M)
	if disp_to_dec(offset) > 4294967040 then modrm = modrm + 64
		elsif disp_to_dec(offset) > 2147483647 and negative == 1 then modrm = modrm + 128
		elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1 then modrm = modrm + 128 
		elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then modrm = modrm + 64
		elsif disp_to_dec(offset) > 0 and disp_to_dec(offset) < 128 and negative == 0 then modrm = modrm + 64
		elsif disp_to_dec(offset) > 127 and negative == 0 then modrm = modrm + 128
	end

	#Process Instruction (ModR/M)ss
	if multiplier == '0' and !esp_areg then
		#Process Register (ModR/M)
		if register == 'ecx' then modrm = modrm + 1
			elsif register == 'edx' then modrm = modrm + 2
			elsif register == 'ebx' then modrm = modrm + 3
			elsif register == 'ebp' and disp_to_dec(offset) > 0 then modrm = modrm + 5
			elsif register == 'esi' then modrm = modrm + 6
			elsif register == 'edi' then modrm = modrm + 7
		end
	else
		#Proccess Scale (SIB)
		modrm = modrm + 4	#Activate SIB byte in ModR/M
		if multiplier == '2' then sib = 64
			elsif multiplier == '4' then sib = 128
			elsif multiplier == '8' then sib = 192
		end
		#Process The Index/Register (SIB)
		if mreg == 'ecx' then sib = sib + 8
			elsif mreg == 'edx' then sib = sib + 16
			elsif mreg == 'ebx' then sib = sib + 24
			elsif mreg == 'ebp' then sib = sib + 40
			elsif mreg == 'esi' then sib = sib + 48
			elsif mreg == 'edi' then sib = sib + 56
		end
		if register == 'ecx' then sib = sib + 1
			elsif register == 'edx' then sib = sib + 2
			elsif register == 'ebx' then sib = sib + 3
			elsif register == 'esp' then sib = sib + 4
			elsif register == 'esi' then sib = sib + 6
			elsif register == 'edi' then sib = sib + 7
		end
		if register == 'none' and multiplier == '2' then 
			if mreg == 'eax' then sib = 0
				elsif mreg == 'ecx' then sib = 9
				elsif mreg == 'edx' then sib = 18
				elsif mreg == 'ebx' then sib = 27
				elsif mreg == 'ebp' then sib = 45	
				elsif mreg == 'esi' then sib = 54
				elsif mreg == 'edi' then sib = 63
			end
		end	
		if ebp_areg then sib = sib + 5 end 
		if esp_areg and multiplier == '0' then sib = sib + 32 end
	end
	#if there's no base register, and not scaled esp, then add 5 to SIB (for the [*] no base register)
	#	32-bit displacement also needed (handled in displacement processing later)
	if register == 'none' and (multiplier == '4' or multiplier == '8') then sib = sib + 5 end

	if $debug == 1 then puts "offset is %i" % disp_to_dec(offset) end
	#if there's no base register, and not scaled esp, then 32-bit displacemnet needed
	if disp_to_dec(offset) > 4294967040 and not negative == 1 then
		#32bit conversion to 8bit 2's compliment	
		offset = (256 - disp_to_dec((4294967296 - disp_to_dec(offset).to_i).to_s).to_i).to_s #Get absolute number and 2's compliment 8bit	
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))
			modrm = modrm - 64
		else offset = littleend(zeropad(imm8(offset),2)) end	
	elsif disp_to_dec(offset) > 2147483647 and negative == 1 then
		puts "Invalid negative displacement\n\n"
		return ["error", '0', '0', '0', '0', '0', '0', '0']
	elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1	then
		#32bit 2's compliment
		offset = (4294967296 - disp_to_dec(offset).to_i).to_s	#2's compliment
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		offset = littleend(zeropad(imm32(offset),8))	
	elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then
		#8bit 2's compliment
		offset = (256 - disp_to_dec(offset).to_i).to_s			#2's compliment
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))
			modrm = modrm - 64
		else offset = littleend(zeropad(imm8(offset),2)) end		
	elsif disp_to_dec(offset) > 0 and disp_to_dec(offset) < 128 and negative == 0 then
		#8bit
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))
			modrm = modrm - 64
		else offset = littleend(zeropad(imm8(offset),2)) end	
	elsif disp_to_dec(offset) > 127 and negative == 0 then
		#32bit
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		offset = littleend(zeropad(imm32(offset),8))			
	elsif disp_to_dec(offset) == 0 then
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))	
		end			
		if ebp_areg then 
			modrm = modrm + 64
			if multiplier == '0' then modrm = modrm + 5 end
		end	
	end

	sib = zeropad(sib.to_s(16), 2)
	modrm = zeropad(modrm.to_s(16), 2)
	return [modrm, sib, offset, esp_areg, multiplier, register, mreg, ebp_areg]
end

def pointer3 (negative, reg_a, reg_b, register, offset, multiplier, mreg, num)
	#If multiplied register is scaled by 1, and there is no base register, then just use register as base
	if mreg != '' and  multiplier == '1' and register == 'none' then 
		register = mreg 	#base register is now the scaled register
		mreg = ''			#there is no longer a scaled register
		multiplier = '0'	#there is no longer a scale
	end
	
	#Handle ESP scale exception, unless it's * 1, and make it base and make the base scaled by * 1
	if mreg == 'esp' then
		if multiplier == '1' and register != 'esp' then
			mreg = register
			register = 'esp'
		else 
			printf("esp is an invalid Scaled Index\n\n") 
			return ["error", '0', '0', '0', '0', '0', '0']
		end
	end	

	#Have to handle implicit * 1 with kid gloves, ie adc byte [eax + ebp], 88
	if (reg_a.to_s).length > 0 and (reg_b.to_s).length > 0 then
		if $debug == 1 then puts "reg1 is %s" % reg_a end
		if $debug == 1 then puts "reg2 is %s" % reg_b end
		if reg_a == 'esp' and reg_b == 'esp' then
			printf("esp is an invalid Scaled Index\n\n") 
			return ["error", '0', '0', '0', '0', '0', '0']
		end
		if reg_b == 'esp' then			#esp can't be scaled / can't be 2nd register
			mreg = reg_a				#make first register the scaled one
			register = reg_b			#make second register the base one
		else
			mreg = reg_b				#first is fine as base
			register = reg_a			#second is fine as scaled
		end
		multiplier = '1'				#scale will always be '1' here; as it's implied by not have a scale for second reg
	end

	#All Values parsed:
	if $debug == 1 then puts "Register: %s" % register end
	if $debug == 1 then puts "Offset: %s" % offset end
	if $debug == 1 then puts "Multiplier %s" % multiplier end
	if $debug == 1 then puts "Multiplied Register %s" % mreg end

	#if ebp *2, base reg is ebp, scaled reg is ebp * 1
	if register == 'none' and mreg == 'ebp' and multiplier == '2' then
		register = 'ebp'
		multiplier = '1'
	end 

	# Set Flags
	if register == 'esp' then esp_areg = 1 end
	if register == 'ebp' then ebp_areg = 1 end

	if $debug == 1 then puts "esp areg is %s" % esp_areg end
	if $debug == 1 then puts "ebp areg is %s" % ebp_areg end

	#if all we have is the displacement, the we are ready to output the machine code for it
	if !register and !multiplier and !mreg and offset then
		if negative == 1 then
			offset = (256 - disp_to_dec(offset).to_i).to_s			#2's compliment	8bit	
			sib = 0
			return ['15', sib, esp_areg, multiplier, register, mreg]
		else
			sib = 0
			return ['15', sib, esp_areg, multiplier, register, mreg]
		end
	end

	sib = 0 #default
	#Process Mod (ModR/M)
	if disp_to_dec(offset) > 4294967040 then modrm = 64
		elsif disp_to_dec(offset) > 2147483647 and negative == 1 then modrm = 128
		elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1 then modrm = 128 
		elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then modrm = 64
		elsif disp_to_dec(offset) > 0 and disp_to_dec(offset) < 128 and negative == 0 then modrm = 64
		elsif disp_to_dec(offset) > 127 and negative == 0 then modrm = 128
		else modrm = 0
	end

	#Process Instruction (ModR/M)
	modrm = modrm + (num.to_i * 8)
	if multiplier == '0' and !esp_areg then
		#Process Register (ModR/M)
		if register == 'ecx' then modrm = modrm + 1
			elsif register == 'edx' then modrm = modrm + 2
			elsif register == 'ebx' then modrm = modrm + 3
			elsif register == 'ebp' and disp_to_dec(offset) > 0 then modrm = modrm + 5
			elsif register == 'esi' then modrm = modrm + 6
			elsif register == 'edi' then modrm = modrm + 7
		end
	else
		#Proccess Scale (SIB)
		modrm = modrm + 4	#Activate SIB byte in ModR/M
		if multiplier == '2' then sib = 64
			elsif multiplier == '4' then sib = 128
			elsif multiplier == '8' then sib = 192
		end
		#Process The Index/Register (SIB)
		if mreg == 'ecx' then sib = sib + 8
			elsif mreg == 'edx' then sib = sib + 16
			elsif mreg == 'ebx' then sib = sib + 24
			elsif mreg == 'ebp' then sib = sib + 40
			elsif mreg == 'esi' then sib = sib + 48
			elsif mreg == 'edi' then sib = sib + 56
		end
		if register == 'ecx' then sib = sib + 1
			elsif register == 'edx' then sib = sib + 2
			elsif register == 'ebx' then sib = sib + 3
			elsif register == 'esp' then sib = sib + 4
			elsif register == 'esi' then sib = sib + 6
			elsif register == 'edi' then sib = sib + 7
		end
		if register == 'none' and multiplier == '2' then 
			if mreg == 'eax' then sib = 0
				elsif mreg == 'ecx' then sib = 9
				elsif mreg == 'edx' then sib = 18
				elsif mreg == 'ebx' then sib = 27
				elsif mreg == 'ebp' then sib = 45	
				elsif mreg == 'esi' then sib = 54
				elsif mreg == 'edi' then sib = 63
			end
		end	
		if ebp_areg then sib = sib + 5 end 
		if esp_areg and multiplier == '0' then sib = sib + 32 end
	end
	#if there's no base register, and not scaled esp, then add 5 to SIB (for the [*] no base register)
	#	32-bit displacement also needed (handled in displacement processing later)
	if register == 'none' and (multiplier == '4' or multiplier == '8') then sib = sib + 5 end

	if $debug == 1 then puts "offset is %i" % disp_to_dec(offset) end
	#if there's no base register, and not scaled esp, then 32-bit displacemnet needed
	if disp_to_dec(offset) > 4294967040 and not negative == 1 then
		#32bit conversion to 8bit 2's compliment	
		offset = (256 - disp_to_dec((4294967296 - disp_to_dec(offset).to_i).to_s).to_i).to_s #Get absolute number and 2's compliment 8bit	
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))
			modrm = modrm - 64
		else offset = littleend(zeropad(imm8(offset),2)) end	
	elsif disp_to_dec(offset) > 2147483647 and negative == 1 then
		puts "Invalid negative displacement\n\n"
		return ["error", '0', '0', '0', '0', '0', '0', '0']
	elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1	then
		#32bit 2's compliment
		offset = (4294967296 - disp_to_dec(offset).to_i).to_s	#2's compliment
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		offset = littleend(zeropad(imm32(offset),8))	
	elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then
		#8bit 2's compliment
		offset = (256 - disp_to_dec(offset).to_i).to_s			#2's compliment
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))
			modrm = modrm - 64
		else offset = littleend(zeropad(imm8(offset),2)) end		
	elsif disp_to_dec(offset) > 0 and disp_to_dec(offset) < 128 and negative == 0 then
		#8bit
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))
			modrm = modrm - 64
		else offset = littleend(zeropad(imm8(offset),2)) end	
	elsif disp_to_dec(offset) > 127 and negative == 0 then
		#32bit
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		offset = littleend(zeropad(imm32(offset),8))			
	elsif disp_to_dec(offset) == 0 then
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			offset = littleend(zeropad(imm32(offset),8))	
		end			
		if ebp_areg then 
			modrm = modrm + 64
			if multiplier == '0' then modrm = modrm + 5 end
		end	
	end

	sib = zeropad(sib.to_s(16), 2)
	modrm = zeropad(modrm.to_s(16), 2)
	return [modrm, sib, offset, esp_areg, multiplier, register, mreg, ebp_areg]
end

def fcpmodrmimm (reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
	#Force commutative property
	if reg_a != 'esp' and reg_b != 'esp' and tworegs == 1 and reg_a != reg_b then		#If it's machine possible to swap registers
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, num)
		instruction_alt = objdump(m1+modrm_p+sib_p + s_operand_p)
		printf("%-34s%-15s (Forced commutative property)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		return 1
	end
	return false
end

def disp8to32modrmimm (offset, negative, s_operand_p, s_operand, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p)
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	#This routine requires disp to be in 0xhex format
	if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1') and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then
		if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
			offset = "0x%s" % imm8(offset)						#change it to hex format
		end
		if extracted = /.+([0-9a-f]{2})/i.match(offset) then
			s_operand_p = littleend(signed_pad(offset, negative)) + s_operand		#sign extend the disp		
			if disp_to_dec(offset) == 0 then
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 128).to_s(16), 2)	#modify modrm to be disp32 instead of no disp
			else
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify modrm to be disp32 instead of disp8
			end
			if !register_p and !multiplier_p and !mreg_p and offset then			#if it's just the offset
				#Don't do anything, it's actually already supposed to be encoded as disp32
				return false
			elsif multiplier_p == '0' and !esp_areg_p then			
				instruction_alt = objdump(m1 + modrm_p + s_operand_p)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + s_operand_p, instruction_alt)
			elsif 
				instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt) 
			else
				return false
			end
		end
		return 1			
	end
end

def addnullmodrmimm (offset, modrm_p, m1, sib_p, s_operand_p, register_p, multiplier_p, esp_areg_p)
	#If there is no displacement, make a displacement of 0x00...
	if disp_to_dec(offset) == 0 and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then	#If there's no offset and this isn't ebp register (becuase it already requires disp8)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		if multiplier_p == '0' and !esp_areg_p then
			instruction_alt = objdump(m1+modrm_p + '00' + s_operand_p)
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + '00' + s_operand_p, instruction_alt)
		else
			instruction_alt = objdump(m1+modrm_p + sib_p + '00' + s_operand_p)
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + sib_p + '00' + s_operand_p, instruction_alt)
		end
		return 1
	end	
	return false
end

def addnullfcpmodrmimm (reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
	#Force communative property with added null disp8 (if possible)
	if reg_a != 'esp' and reg_b != 'esp' and reg_b != 'ebp' and tworegs == 1 and reg_a != reg_b and disp_to_dec(offset) == 0 then	#If it's machine possible to swap registers and there's no offset
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, num)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		instruction_alt = objdump(m1+modrm_p + sib_p + '00' + s_operand_p)
		printf("%-34s%-15s (Forced commutative property, Additional null disp8)\n", m1 + modrm_p + sib_p + '00' + s_operand_p, instruction_alt)
		return 1
	end	
	return false
end

def sibdoublemodrmimm (tworegs, reg_a, reg_b, modrm_p, sib_p, offset, s_operand_p, m1, negative, s_operand)
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if tworegs == 1 and reg_a == reg_b then
		modrm_p = '14'
		if reg_a == 'eax' then sib_p = '45'
		elsif reg_a == 'ecx' then sib_p = '4D'
		elsif reg_a == 'edx' then sib_p = '55'
		elsif reg_a == 'ebx' then sib_p = '5D'
		elsif reg_a == 'ebp' then sib_p = '6D'
		elsif reg_a == 'esi' then sib_p = '75'
		elsif reg_a == 'edi' then sib_p = '7D'
		end

		if disp_to_dec(offset) == 0 then
			if reg_a == 'ebp' then s_operand_p = '000000' + s_operand_p	#Effectively removes the extra null for ebp
			else s_operand_p = '00000000' + s_operand_p end
			instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
			printf("%-34s%-15s (SIB Double)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		else
			if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1')
				if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
					offset = "0x%s" % imm8(offset)						#change it to hex format
				end
				if extracted = /^0?x?([0-9a-f]{2}$)/i.match(offset) then
					s_operand_p = littleend(signed_pad(offset, negative)) + s_operand		#sign extend the disp
				end
			end
			#Make s_operand_p disp32
			instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
			printf("%-34s%-15s (SIB Double)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		end
		return 1
	end	
	return false
end

def modrmimm_pointer_alternates_so1 (reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
	extra_space = 0
	#Try to force commutative property
	if fcpmodrm8imm_so1(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num) then extra_space = 1 end
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	if disp8to32modrm8imm_so1(offset, negative, s_operand_p, s_operand, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p) then extra_space = 1 end
	#If there is no displacement, make a displacement of 0x00...
	if addnullmodrm8imm_so1(offset, modrm_p, m1, sib_p, s_operand_p, register_p, multiplier_p, esp_areg_p) then extra_space = 1 end
	#Force communative property with added null disp8 (if possible)
	if addnullfcpmodrm8imm_so1(reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num) then extra_space = 1 end
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if sibdoublemodrm8imm_so1(tworegs, reg_a, reg_b, modrm_p, sib_p, offset, s_operand_p, m1, negative, s_operand) then extra_space = 1 end
	if extra_space == 1 then puts "\n" end
end

def fcpmodrm8imm_so1 (reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
	#Force commutative property
	if reg_a != 'esp' and reg_b != 'esp' and tworegs == 1 and reg_a != reg_b then		#If it's machine possible to swap registers
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, num)
		s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01
		instruction_alt = objdump(m1+modrm_p+sib_p + s_operand_p)
		printf("%-34s%-15s (Forced commutative property)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		return 1
	end
	return false
end

def disp8to32modrm8imm_so1 (offset, negative, s_operand_p, s_operand, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p)
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	#This routine requires disp to be in 0xhex format
	if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1') and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then
		if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
			offset = "0x%s" % imm8(offset)						#change it to hex format
		end
		if extracted = /.+([0-9a-f]{2})/i.match(offset) then
			s_operand_p = littleend(signed_pad(offset, negative)) + s_operand		#sign extend the disp		
			if disp_to_dec(offset) == 0 then
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 128).to_s(16), 2)	#modify modrm to be disp32 instead of no disp
			else
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify modrm to be disp32 instead of disp8
			end
			if !register_p and !multiplier_p and !mreg_p and offset then			#if it's just the offset
				#Don't do anything, it's actually already supposed to be encoded as disp32
				return false
			elsif multiplier_p == '0' and !esp_areg_p then			
				s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01				
				instruction_alt = objdump(m1 + modrm_p + s_operand_p)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + s_operand_p, instruction_alt)
			elsif 
				s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01	
				instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt) 
			else
				return false
			end
		end			
		return 1
	end
end

def addnullmodrm8imm_so1 (offset, modrm_p, m1, sib_p, s_operand_p, register_p, multiplier_p, esp_areg_p)
	#If there is no displacement, make a displacement of 0x00...
	if disp_to_dec(offset) == 0 and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then	#If there's no offset and this isn't ebp register (becuase it already requires disp8)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		if multiplier_p == '0' and !esp_areg_p then
			s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01	
			instruction_alt = objdump(m1+modrm_p + '00' + s_operand_p)
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + '00' + s_operand_p, instruction_alt)
		else
			s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01		
			instruction_alt = objdump(m1+modrm_p + sib_p + '00' + s_operand_p)
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + sib_p + '00' + s_operand_p, instruction_alt)
		end
		return 1
	end
	return false
end

def addnullfcpmodrm8imm_so1 (reg_a, reg_b, tworegs, modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
	#Force communative property with added null disp8 (if possible)
	if reg_a != 'esp' and reg_b != 'esp' and reg_b != 'ebp' and tworegs == 1 and reg_a != reg_b and disp_to_dec(offset) == 0 then	#If it's machine possible to swap registers and there's no offset
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, num)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01
		instruction_alt = objdump(m1+modrm_p + sib_p + '00' + s_operand_p)
		printf("%-34s%-15s (Forced commutative property, Additional null disp8)\n", m1 + modrm_p + sib_p + '00' + s_operand_p, instruction_alt)
		return 1
	end
	return false
end

def sibdoublemodrm8imm_so1 (tworegs, reg_a, reg_b, modrm_p, sib_p, offset, s_operand_p, m1, negative, s_operand)
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if tworegs == 1 and reg_a == reg_b then
		modrm_p = '14'
		if reg_a == 'eax' then sib_p = '45'
		elsif reg_a == 'ecx' then sib_p = '4D'
		elsif reg_a == 'edx' then sib_p = '55'
		elsif reg_a == 'ebx' then sib_p = '5D'
		elsif reg_a == 'ebp' then sib_p = '6D'
		elsif reg_a == 'esi' then sib_p = '75'
		elsif reg_a == 'edi' then sib_p = '7D'
		end

		if disp_to_dec(offset) == 0 then
			if reg_a == 'ebp' then s_operand_p = '000000' + s_operand_p	#Effectively removes the extra null for ebp
			else s_operand_p = '00000000' + s_operand_p end
			s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01
			instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
			printf("%-34s%-15s (SIB Double and Explicit imm8)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		else
			if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1')
				if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
					offset = "0x%s" % imm8(offset)						#change it to hex format
				end
				if extracted = /^0?x?([0-9a-f]{2}$)/i.match(offset) then
					s_operand_p = littleend(signed_pad(offset, negative)) + s_operand		#sign extend the disp
				end
			end
			#Make s_operand_p disp32
			s_operand_p = s_operand_p.gsub(/01$/i, '') #remove the ending 0x01
			instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
			printf("%-34s%-15s (SIB Double and Explicit imm8)\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		end
		return 1
	end
	return false
end

def fcpmodrmmodrm (reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, reg1)
	#Force commutative property
	if disp_to_dec(offset) != 0 then offset = '0x' + offset end
	if reg_a != 'esp' and reg_b != 'esp' and tworegs == 1 and reg_a != reg_b then		#If it's machine possible to swap registers
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, offset, esp_areg_p, multiplier_p, register_p, mreg_p = pointer2(negative, reg_a, reg_b, register, offset, multiplier, mreg, reg1, tworegs)
		if offset.length > 2 then offset = littleend(offset) end #make little endian if more than 1 byte
		if reg_a == 'ebp' and disp_to_dec(offset) == 0 then
			instruction_alt = objdump(m1+modrm_p+sib_p + '00')
			printf("%-34s%-15s (Forced commutative property)\n", m1 + modrm_p + sib_p + '00', instruction_alt)
		elsif disp_to_dec(offset) != 0 then
			instruction_alt = objdump(m1+modrm_p+sib_p + offset)
			printf("%-34s%-15s (Forced commutative property)\n", m1 + modrm_p + sib_p + offset, instruction_alt)
		else
			instruction_alt = objdump(m1+modrm_p+sib_p)
			printf("%-34s%-15s (Forced commutative property)\n", m1 + modrm_p + sib_p, instruction_alt)			
		end
		return 1
	end
	return false
end

def disp8to32modrmmodrm (offset, negative, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p)
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	#This routine requires disp to be in 0xhex format
	offset = '0x' + offset	#offset is received in hex format but without 0x
	if (disp_to_dec(offset) < 256) and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then
		offset_u = offset
		if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
			offset = "0x%s" % imm8(offset)						#change it to hex format
		end
		if extracted = /.+([0-9a-f]{2})/i.match(offset) then

			if /^0x[89abcdf]/i.match(offset) then
				offset = offset.gsub(/0x(.+)/, '\1FFFFFF')					
			else
				offset = offset.gsub(/0x(.+)/, '\1000000')
			end
			#offset = littleend(signed_pad(offset, negative))		#sign extend the disp


			if disp_to_dec(offset_u) == 0 then
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 128).to_s(16), 2)	#modify modrm to be disp32 instead of no disp
			else
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify modrm to be disp32 instead of disp8
			end
			if !register_p and !multiplier_p and !mreg_p and offset then			#if it's just the offset
				#Don't do anything, it's actually already supposed to be encoded as disp32
				return false
			elsif multiplier_p == '0' and !esp_areg_p then			
				instruction_alt = objdump(m1 + modrm_p + offset)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + offset, instruction_alt)
			elsif 
				instruction_alt = objdump(m1 + modrm_p + sib_p + offset)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + sib_p + offset, instruction_alt) 
			else
				return false
			end
		end			
		return 1
	end
end

def addnullmodrmmodrm (offset, modrm_p, m1, sib_p, register_p, multiplier_p, esp_areg_p)
	offset = '0x' + offset	#offset is received in hex format but without 0x
	#If there is no displacement, make a displacement of 0x00...
	if disp_to_dec(offset) == 0 and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then	#If there's no offset and this isn't ebp register (becuase it already requires disp8)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		if multiplier_p == '0' and !esp_areg_p then
			instruction_alt = objdump(m1+modrm_p + '00')
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + '00', instruction_alt)
		else
			instruction_alt = objdump(m1+modrm_p + sib_p + '00')
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + sib_p + '00', instruction_alt)
		end
		return 1
	end
	return false
end

def addnullfcpmodrmmodrm (reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, reg1)
	#Force communative property with added null disp8 (if possible)
	if reg_a != 'esp' and reg_b != 'esp' and reg_b != 'ebp' and tworegs == 1 and reg_a != reg_b and disp_to_dec(offset) == 0 then	#If it's machine possible to swap registers and there's no offset
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, offset, esp_areg_p, multiplier_p, register_p, mreg_p = pointer2(negative, reg_a, reg_b, register, offset, multiplier, mreg, reg1, tworegs)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		instruction_alt = objdump(m1+modrm_p + sib_p + '00')
		printf("%-34s%-15s (Forced commutative property, Additional null disp8)\n", m1 + modrm_p + sib_p + '00', instruction_alt)
		return 1
	end
	return false
end

def sibdoublemodrmmodrm (tworegs, reg_a, reg_b, modrm_p, sib_p, offset, m1, negative, reg1)
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)
	if tworegs == 1 and reg_a == reg_b then
		offset = '0x' + offset
		modrm_p = modrm_p.gsub(/[4-9ab](.)/, '0\1')	
		modrm_p = disp_to_dec(modrm_p)
		if extracted = /e?c[xl]/i.match(reg1) then modrm_p = modrm_p + 8
		elsif extracted = /e?d[xl]/i.match(reg1) then modrm_p = modrm_p + 16
		elsif extracted = /e?b[xl]/i.match(reg1) then modrm_p = modrm_p + 24
		elsif extracted = /e?sp|ah/i.match(reg1) then modrm_p = modrm_p + 32
		elsif extracted = /e?bp|ch/i.match(reg1) then modrm_p = modrm_p + 40
		elsif extracted = /e?si|dh/i.match(reg1) then modrm_p = modrm_p + 48
		elsif extracted = /e?di|bh/i.match(reg1) then modrm_p = modrm_p + 56
		end
		modrm_p = zeropad(modrm_p.to_s(16), 2)
		if reg_a == 'eax' then sib_p = '45'
		elsif reg_a == 'ecx' then sib_p = '4D'
		elsif reg_a == 'edx' then sib_p = '55'
		elsif reg_a == 'ebx' then sib_p = '5D'
		elsif reg_a == 'ebp' then sib_p = '6D'
		elsif reg_a == 'esi' then sib_p = '75'
		elsif reg_a == 'edi' then sib_p = '7D'
		end

		if disp_to_dec(offset) == 0 then
			offset = '00000000'
			instruction_alt = objdump(m1 + modrm_p + sib_p + offset)
			printf("%-34s%-15s (SIB Double)\n", m1 + modrm_p + sib_p + offset, instruction_alt)
		else
			if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1')
				if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
					offset = "0x%s" % imm8(offset)						#change it to hex format
				end
				if extracted = /^0?x?([0-9a-f]{2}$)/i.match(offset) then
					offset = littleend(signed_pad(offset, negative))		#sign extend the disp
				end
			end
			#Make s_operand_p disp32
			if extracted = /^0?x?([0-9a-f]{8}$)/i.match(offset) then	#remove the 0x convention
				offset = offset.gsub(/0x(.+)/, '\1')
			end			
			instruction_alt = objdump(m1 + modrm_p + sib_p + offset)
			printf("%-34s%-15s (SIB Double)\n", m1 + modrm_p + sib_p + offset, instruction_alt)
		end
		return 1
	end
	return false
end

def fcpopmodrm (reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, num)
	#Force commutative property
	if reg_a != 'esp' and reg_b != 'esp' and tworegs == 1 and reg_a != reg_b then		#If it's machine possible to swap registers
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, offset, esp_areg_p, multiplier_p, register_p, mreg_p = pointer3(negative, reg_a, reg_b, register, offset, multiplier, mreg, num)
		instruction_alt = objdump(m1+modrm_p+sib_p)
		printf("%-34s%-15s (Forced commutative property)\n", m1 + modrm_p + sib_p, instruction_alt)
		return 1
	end
	return false
end

def disp8to32opmodrm (offset, negative, modrm_p, register_p, multiplier_p, mreg_p, esp_areg_p, m1, sib_p)
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	#This routine requires disp to be in 0xhex format
	offset = "0x%s" % offset #change it to hex format
	if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1') and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then		
		if extracted = /.+([0-9a-f]{2})/i.match(offset) then		
			if disp_to_dec(offset) == 0 then
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 128).to_s(16), 2)	#modify modrm to be disp32 instead of no disp
			else
				modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify modrm to be disp32 instead of disp8
			end

			#Extend the offset
			if /^0x[89abcdf]/i.match(offset) then
				offset = offset.gsub(/0x(.+)/, '\1FFFFFF')					
			else
				offset = offset.gsub(/0x(.+)/, '\1000000')
			end

			if !register_p and !multiplier_p and !mreg_p and offset then			#if it's just the offset
				#Don't do anything, it's actually already supposed to be encoded as disp32
				return false
			elsif multiplier_p == '0' and !esp_areg_p then			
				instruction_alt = objdump(m1 + modrm_p)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + offset, instruction_alt)
			elsif 
				instruction_alt = objdump(m1 + modrm_p + sib_p)
				printf("%-34s%-15s (disp8 -> disp32 extended)\n", m1 + modrm_p + sib_p + offset, instruction_alt) 
			else
				return false
			end
		end
		return 1			
	end
end

def addnullopmodrm (offset, modrm_p, m1, sib_p, register_p, multiplier_p, esp_areg_p)
	#If there is no displacement, make a displacement of 0x00...
	if disp_to_dec(offset) == 0 and register_p != 'ebp' and multiplier_p != '4' and multiplier_p != '8' then	#If there's no offset and this isn't ebp register (becuase it already requires disp8)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		if multiplier_p == '0' and !esp_areg_p then
			instruction_alt = objdump(m1+modrm_p + '00')
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + '00', instruction_alt)
		else
			instruction_alt = objdump(m1+modrm_p + sib_p + '00')
			printf("%-34s%-15s (Additional null disp8)\n", m1 + modrm_p + sib_p + '00', instruction_alt)
		end
		return 1
	end	
	return false
end

def addnullfcpopmodrm (reg_a, reg_b, tworegs, modrm_p, sib_p, esp_areg_p, multiplier_p, register_p, mreg_p, negative, register, offset, multiplier, mreg, m1, instruction, num)
	#Force communative property with added null disp8 (if possible)
	if reg_a != 'esp' and reg_b != 'esp' and reg_b != 'ebp' and tworegs == 1 and reg_a != reg_b and disp_to_dec(offset) == 0 then	#If it's machine possible to swap registers and there's no offset
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer3(negative, reg_a, reg_b, register, offset, multiplier, mreg, num)
		modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify to be disp8
		instruction_alt = objdump(m1+modrm_p + sib_p + '00' + s_operand_p)
		printf("%-34s%-15s (Forced commutative property, Additional null disp8)\n", m1 + modrm_p + sib_p + '00' + s_operand_p, instruction_alt)
		return 1
	end	
	return false
end

def sibdoubleopmodrm (tworegs, reg_a, reg_b, modrm_p, sib_p, offset, m1, negative)
	#SIB Doubles (Base register must be same as scaled register at scale of 1, disp required even if zero)

	if tworegs == 1 and reg_a == reg_b then
		if reg_a == 'eax' then sib_p = '45'
		elsif reg_a == 'ecx' then sib_p = '4D'
		elsif reg_a == 'edx' then sib_p = '55'
		elsif reg_a == 'ebx' then sib_p = '5D'
		elsif reg_a == 'ebp' then sib_p = '6D'
		elsif reg_a == 'esi' then sib_p = '75'
		elsif reg_a == 'edi' then sib_p = '7D'
		end

		if disp_to_dec(offset) == 0 then
			if reg_a == 'ebp' then 
				modrm_p = zeropad((((zeropad(modrm_p.to_i(16).to_s(2), 8)).gsub(/^.{2}(.{6})/, '00\1')).to_i(2)).to_s(16),2)
			end
			padding = '00000000'
			instruction_alt = objdump(m1 + modrm_p + sib_p + padding)
			printf("%-34s%-15s (SIB Double)\n", m1 + modrm_p + sib_p + padding, instruction_alt)
		else

			#zeros out 2 most significant bits
			modrm_p = zeropad((((zeropad(modrm_p.to_i(16).to_s(2), 8)).gsub(/^.{2}(.{6})/, '00\1')).to_i(2)).to_s(16),2)

			if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1')
				offset = "0x%s" % offset				#change it to 0xhex format
				if extracted = /^0?x?([0-9a-f]{2}$)/i.match(offset) then
					offset = littleend(signed_pad(offset, negative))		#sign extend the disp
				end
			end
			#Make s_operand_p disp32
			instruction_alt = objdump(m1 + modrm_p + sib_p + offset)
			printf("%-34s%-15s (SIB Double)\n", m1 + modrm_p + sib_p + offset, instruction_alt)
		end
		return 1
	end	
	return false
end

def nasm (data)
	cmd = `nasm -v 2> /dev/null`
	if /nasm\s+version/i.match(cmd) then
		file = File.open("tmp.asm", "w")
		file.write("[BITS 32]\n" + data + "\n")
		file.close
		cmd = 'nasm -f bin tmp.asm 2>/dev/null'
		system(cmd)	
		machine_code = `xxd -ps -g 16 tmp 2>/dev/null`
		machine_code = (machine_code.chomp).upcase
		if machine_code.length > 0 then
			printf("%-34s%-15s(Provided by Nasm)\n\n", machine_code, objdump(machine_code))
			system('rm tmp tmp.asm')
		else
			puts "There was an error with your Assembly (or I couldn't parse it)\n\n"
		end
	else
		puts "I don't know this instruction, NASM might, but it's not installed\n\n"
	end
end

def sanity_check (code, data)
	cmd = `nasm -v 2> /dev/null`
	if /nasm\s+version/i.match(cmd) then
		file = File.open("tmp.asm", "w")
		file.write("[BITS 32]\n" + data + "\n")
		file.close
		cmd = 'nasm -f bin tmp.asm 2>/dev/null'
		system(cmd)
		machine_code = `xxd -ps -g 16 tmp 2>/dev/null`
		machine_code = machine_code.chomp
		if machine_code.length > 0 then
			if machine_code.upcase != code.upcase then
				puts "My output ( #{machine_code.upcase} ) doesn't match that of nasm, something may be wrong here\n\n"
			end
			system('rm tmp tmp.asm 2>/dev/null')
		end
	end
end

def objdump (data)
	cmd = `objdump -v 2> /dev/null`
	cmd2 = `gobjdump -v 2> /dev/null`
	if /objdump/i.match(cmd) or /objdump/i.match(cmd2) then
		file = File.open("tmp.m", "w")
		file.write(data)
		file.close
		cmd3 = 'cat tmp.m | xxd -r -p > tmp'
		system(cmd3)
		if /objdump/i.match(cmd)
			cmd = `objdump -M intel -D -b binary -mi386 tmp`
		else
			cmd = `gobjdump -M intel -D -b binary -mi386 tmp`	
		end
		if extracted = /^.+?<\.data>:\n\s+\S+\s+([0-9a-f]{2}\s)+\s+(.+)$/s.match(cmd) then
			return extracted[2]
		end
	system('rm tmp tmp.m')
	else
		return "[need objdump for asm output]"
	end
end

main
