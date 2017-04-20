#!/usr/bin/ruby

$debug = 0
#--------------------------------------------
# 	              TODO          			#
#--------------------------------------------
#Handle spacing/tabbing in output better (will involve printf)
# http://www.evc-cit.info/cit020/beginning-programming/chp_04/file_printf.html
#Get consistent with case-sensitivity

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
		print 'irasm > '
		asm = gets.chomp
		if /(quit|(?<!s)exit)/i.match(asm)
			exit
		end

		if /^aaa/i.match(asm) then aaa (asm)
		elsif /^aad/i.match(asm) then aad (asm)
		elsif /^aam/i.match(asm) then aam (asm)
		elsif /^aas/i.match(asm) then aas (asm)
		elsif /^adc[^x]/i.match(asm) then adc (asm)
		elsif /^adcx/i.match(asm) then adcx (asm)			
		elsif /^add/i.match(asm) then add (asm)	
		elsif /^adox/i.match(asm) then adox (asm)
		elsif /^and/i.match(asm) then andi (asm)
		elsif /^arpl/i.match(asm) then arpl (asm)
		elsif /^bsf/i.match(asm) then bsf (asm)	
		elsif /^bsr/i.match(asm) then bsr (asm)
		elsif /^bswap/i.match(asm) then bswap (asm)			
		elsif /^call\s/i.match(asm) then call (asm)
		elsif /^cbw/i.match(asm) then cbw (asm)			
		elsif /^cwde/i.match(asm) then cwde (asm)
		elsif /^clac/i.match(asm) then clac (asm)	
		elsif /^clc/i.match(asm) then clc (asm)		
		elsif /^cld/i.match(asm) then cld (asm)
		elsif /^cli/i.match(asm) then cli (asm)	
		elsif /^clts/i.match(asm) then clts (asm)
		elsif /^cmc/i.match(asm) then cmc (asm)	
		elsif /^cmova\s/i.match(asm) then cmova (asm)	
		elsif /^cmovae\s/i.match(asm) then cmovae (asm)
		elsif /^cmovb\s/i.match(asm) then cmovb (asm)
		elsif /^cmovbe\s/i.match(asm) then cmovbe (asm)
		elsif /^cmovc\s/i.match(asm) then cmovc (asm)
		elsif /^cmove\s/i.match(asm) then cmove (asm)
		elsif /^cmovg\s/i.match(asm) then cmovg (asm)
		elsif /^cmovge\s/i.match(asm) then cmovge (asm)
		elsif /^cmovl\s/i.match(asm) then cmovl (asm)
		elsif /^cmovle\s/i.match(asm) then cmovle (asm)
		elsif /^cmovna\s/i.match(asm) then cmovna (asm)
		elsif /^cmovnae\s/i.match(asm) then cmovnae (asm)
		elsif /^cmovnb\s/i.match(asm) then cmovnb (asm)
		elsif /^cmovnbe\s/i.match(asm) then cmovnbe (asm)
		elsif /^cmovnc\s/i.match(asm) then cmovnc (asm)
		elsif /^cmovne\s/i.match(asm) then cmovne (asm)
		elsif /^cmovng\s/i.match(asm) then cmovng (asm)
		elsif /^cmovnl\s/i.match(asm) then cmovnl (asm)
		elsif /^cmovnle\s/i.match(asm) then cmovnle (asm)
		elsif /^cmovno\s/i.match(asm) then cmovno (asm)
		elsif /^cmovnp\s/i.match(asm) then cmovnp (asm)
		elsif /^cmovns\s/i.match(asm) then cmovns (asm)
		elsif /^cmovnz\s/i.match(asm) then cmovnz (asm)
		elsif /^cmovo\s/i.match(asm) then cmovo (asm)
		elsif /^cmovp\s/i.match(asm) then cmovp (asm)
		elsif /^cmovpe\s/i.match(asm) then cmovpe (asm)
		elsif /^cmovpo\s/i.match(asm) then cmovpo (asm)
		elsif /^cmovs\s/i.match(asm) then cmovs (asm)		
		elsif /^cmovz\s/i.match(asm) then cmovz (asm)	
		elsif /^cmp[^sx]/i.match(asm) then cmp (asm)	
		elsif /^cmpsb/i.match(asm) then cmpsb (asm)	
		elsif /^cmpsw/i.match(asm) then cmpsw (asm)	
		elsif /^cmpsd/i.match(asm) then cmpsd (asm)	
		elsif /^cmpxchg/i.match(asm) then cmpxchg (asm)					
		elsif /^cpuid/i.match(asm) then cpuid (asm)	
		elsif /^cwd/i.match(asm) then cwd (asm)
		elsif /^cdq/i.match(asm) then cdq (asm)			
		elsif /^daa/i.match(asm) then daa (asm)	
		elsif /^das/i.match(asm) then das (asm)	
		elsif /^dec/i.match(asm) then dec (asm)				
		elsif /^emms/i.match(asm) then emms (asm)
		elsif /^f2xm1/i.match(asm) then f2xm1 (asm)	
		elsif /^fabs/i.match(asm) then fabs (asm)	
		elsif /^faddp/i.match(asm) then faddp (asm)	
		elsif /^fchs/i.match(asm) then fchs (asm)
		elsif /^fclex/i.match(asm) then fclex (asm)
		elsif /^fnclex/i.match(asm) then fnclex (asm)		
		elsif /^fcom$/i.match(asm) then fcom (asm)
		elsif /^fcomp$/i.match(asm) then fcomp (asm)
		elsif /^fcompp/i.match(asm) then fcompp (asm)
		elsif /^fcos/i.match(asm) then fcos (asm)
		elsif /^fdecstp/i.match(asm) then fdecstp (asm)	
		elsif /^fdivp/i.match(asm) then fdivp (asm)		
		elsif /^fdivrp/i.match(asm) then fdivrp (asm)
		elsif /^fincstp/i.match(asm) then fincstp (asm)	
		elsif /^finit/i.match(asm) then finit (asm)	
		elsif /^fninit/i.match(asm) then fninit (asm)
		elsif /^fld1$/i.match(asm) then fld1 (asm)
		elsif /^fldl2t$/i.match(asm) then fldl2t (asm)
		elsif /^fldl2e$/i.match(asm) then fldl2e (asm)
		elsif /^fldpi$/i.match(asm) then fldpi (asm)
		elsif /^fldlg2$/i.match(asm) then fldlg2 (asm)
		elsif /^fldln2$/i.match(asm) then fldln2 (asm)
		elsif /^fldz$/i.match(asm) then fldz (asm)
		elsif /^fmulp/i.match(asm) then fmulp (asm)
		elsif /^fnop$/i.match(asm) then fnop (asm)
		elsif /^fpatan$/i.match(asm) then fpatan (asm)
		elsif /^fprem$/i.match(asm) then fprem (asm)
		elsif /^fprem1$/i.match(asm) then fprem1 (asm)	
		elsif /^fptan$/i.match(asm) then fptan (asm)	
		elsif /^frndint$/i.match(asm) then frndint (asm)
		elsif /^fscale$/i.match(asm) then fscale (asm)
		elsif /^fsin$/i.match(asm) then fsin (asm)	
		elsif /^fsincos$/i.match(asm) then fsincos (asm)		
		elsif /^fsqrt$/i.match(asm) then fsqrt (asm)
		elsif /^fstsw ax$/i.match(asm) then fstswax (asm)
		elsif /^fnstsw ax$/i.match(asm) then fnstswax (asm)		
		elsif /^fsubp$/i.match(asm) then fsubp (asm)	
		elsif /^fsubrp$/i.match(asm) then fsubrp (asm)		
		elsif /^ftst$/i.match(asm) then ftst (asm)	
		elsif /^fucom$/i.match(asm) then fucom (asm)	
		elsif /^fucomp$/i.match(asm) then fucomp (asm)	
		elsif /^fucompp$/i.match(asm) then fucompp (asm)
		elsif /^fxam$/i.match(asm) then fxam (asm)	
		elsif /^fxch$/i.match(asm) then fxch (asm)
		elsif /^fxtract$/i.match(asm) then fxtract (asm)	
		elsif /^fyl2x$/i.match(asm) then fyl2x (asm)
		elsif /^fyl2xp1$/i.match(asm) then fyl2xp1 (asm)
		elsif /^hlt$/i.match(asm) then hlt (asm)	
		elsif /^in\s/i.match(asm) then IN (asm)
		elsif /^inc\s/i.match(asm) then inc (asm)			
		elsif /^insb$/i.match(asm) then insb (asm)
		elsif /^insw$/i.match(asm) then insw (asm)
		elsif /^insd$/i.match(asm) then insd (asm)
		elsif /^into$/i.match(asm) then into (asm)	
		elsif /^invd$/i.match(asm) then invd (asm)
		elsif /^iretw$/i.match(asm) then iretw (asm)
		elsif /^iretd?$/i.match(asm) then iret (asm)	
		elsif /^ja\s/i.match(asm) then ja (asm)	
		elsif /^jae\s/i.match(asm) then jae (asm)
		elsif /^jb\s/i.match(asm) then jb (asm)
		elsif /^jbe\s/i.match(asm) then jbe (asm)
		elsif /^jc\s/i.match(asm) then jc (asm)
		elsif /^je\s/i.match(asm) then je (asm)
		elsif /^jg\s/i.match(asm) then jg (asm)
		elsif /^jge\s/i.match(asm) then jge (asm)
		elsif /^jl\s/i.match(asm) then jl (asm)
		elsif /^jle\s/i.match(asm) then jle (asm)
		elsif /^jna\s/i.match(asm) then jna (asm)
		elsif /^jnae\s/i.match(asm) then jnae (asm)
		elsif /^jnb\s/i.match(asm) then jnb (asm)
		elsif /^jnbe\s/i.match(asm) then jnbe (asm)
		elsif /^jnc\s/i.match(asm) then jnc (asm)
		elsif /^jne\s/i.match(asm) then jne (asm)
		elsif /^jng\s/i.match(asm) then jng (asm)
		elsif /^jnl\s/i.match(asm) then jnl (asm)
		elsif /^jnle\s/i.match(asm) then jnle (asm)
		elsif /^jno\s/i.match(asm) then jno (asm)
		elsif /^jnp\s/i.match(asm) then jnp (asm)
		elsif /^jns\s/i.match(asm) then jns (asm)
		elsif /^jnz\s/i.match(asm) then jnz (asm)
		elsif /^jo\s/i.match(asm) then jo (asm)
		elsif /^jp\s/i.match(asm) then jp (asm)
		elsif /^jpe\s/i.match(asm) then jpe (asm)
		elsif /^jpo\s/i.match(asm) then jpo (asm)
		elsif /^js\s/i.match(asm) then js (asm)		
		elsif /^jmp\s/i.match(asm) then jmp (asm)
		elsif /^jz\s/i.match(asm) then jz (asm)				
		elsif /^lahf$/i.match(asm) then lahf (asm)	
		elsif /^lea\s/i.match(asm) then lea (asm)
		elsif /^leave$/i.match(asm) then leave (asm)
		elsif /^leavew$/i.match(asm) then leavew (asm)	
		elsif /^lfence$/i.match(asm) then lfence (asm)
		elsif /^lock$/i.match(asm) then lock (asm)
		elsif /^lodsb$/i.match(asm) then lodsb (asm)
		elsif /^lodsw$/i.match(asm) then lodsw (asm)
		elsif /^lodsd$/i.match(asm) then lodsd (asm)
		elsif /^loop\s/i.match(asm) then loopx (asm)
		elsif /^loope\s/i.match(asm) then loope (asm)
		elsif /^loopne\s/i.match(asm) then loopne (asm)
		elsif /^mov\s/i.match(asm) then mov (asm)			
		elsif /^mfence$/i.match(asm) then mfence (asm)							
		elsif /^monitor$/i.match(asm) then monitor (asm)
		elsif /^movsb$/i.match(asm) then movsb (asm)		#m,m forms are bullshit
		elsif /^movsw$/i.match(asm) then movsw (asm)		#...
		elsif /^movsd$/i.match(asm) then movsd (asm)		#...	
		elsif /^mwait$/i.match(asm) then mwait (asm)						
		elsif /^nop$/i.match(asm) then nop (asm)
		elsif /^or\s/i.match(asm) then OR (asm)
		elsif /^outsb$/i.match(asm) then outsb (asm)			#m,m forms are bullshit
		elsif /^outsw$/i.match(asm) then outsw (asm)			#...
		elsif /^outsd$/i.match(asm) then outsd (asm)			#...
		elsif /^pause$/i.match(asm) then pause (asm)		
		elsif /^pop\s/i.match(asm) then pop (asm)
		elsif /^popaw$/i.match(asm) then popaw (asm)
		elsif /^popad?$/i.match(asm) then popa (asm)
		elsif /^popcnt/i.match(asm) then popcnt (asm)			
		elsif /^popfw$/i.match(asm) then popfw (asm)
		elsif /^popfd?$/i.match(asm) then popf (asm)
		elsif /^popfd?$/i.match(asm) then popf (asm)
		elsif /^push\s/i.match(asm) then push (asm)			
		elsif /^pushaw$/i.match(asm) then pushaw (asm)
		elsif /^pushad?$/i.match(asm) then pusha (asm)			
		elsif /^pushfw$/i.match(asm) then pushfw (asm)
		elsif /^pushfd?$/i.match(asm) then pushf (asm)
		elsif /^rcl/i.match(asm) then rcl (asm)
		elsif /^rcr/i.match(asm) then rcr (asm)					
		elsif /^rdmsr$/i.match(asm) then rdmsr (asm)
		elsif /^rdpmc$/i.match(asm) then rdpmc (asm)
		elsif /^rdrand\s/i.match(asm) then rdrand (asm)
		elsif /^rdseed\s/i.match(asm) then rdseed (asm)
		elsif /^rdtsc$/i.match(asm) then rdtsc (asm)
		elsif /^rdtscp$/i.match(asm) then rdtscp (asm)
		elsif /^ret$/i.match(asm) then ret (asm)
		elsif /^retf$/i.match(asm) then retf (asm)
		elsif /^rol/i.match(asm) then rol (asm)	
		elsif /^ror/i.match(asm) then ror (asm)						
		elsif /^rsm$/i.match(asm) then rsm (asm)
		elsif /^sahf$/i.match(asm) then sahf (asm)
		elsif /^sal/i.match(asm) then sal (asm)	
		elsif /^sar/i.match(asm) then sar (asm)						
		elsif /^sbb/i.match(asm) then sbb (asm)			
		elsif /^scasb$/i.match(asm) then scasb (asm)			#m,m forms are bullshit
		elsif /^scasw$/i.match(asm) then scasw (asm)			#...
		elsif /^scasd$/i.match(asm) then scasd (asm)			#...
		elsif /^sfence$/i.match(asm) then sfence (asm)
		elsif /^shl/i.match(asm) then shl (asm)	
		elsif /^shr/i.match(asm) then shr (asm)						
		elsif /^stac$/i.match(asm) then stac (asm)	
		elsif /^stc$/i.match(asm) then stc (asm)
		elsif /^std$/i.match(asm) then std (asm)
		elsif /^sti$/i.match(asm) then sti (asm)
		elsif /^stosb$/i.match(asm) then stosb (asm)			#m,m forms are bullshit
		elsif /^stosw$/i.match(asm) then stosw (asm)			#...
		elsif /^stosd$/i.match(asm) then stosd (asm)			#...
		elsif /^sub/i.match(asm) then sub (asm)	
		elsif /^swapgs/i.match(asm) then swapgs (asm)	
		elsif /^syscall/i.match(asm) then syscall (asm)	
		elsif /^sysenter/i.match(asm) then sysenter (asm)
		elsif /^sysexit/i.match(asm) then sysexit (asm)	
		elsif /^sysret/i.match(asm) then sysret (asm)	
		elsif /^test/i.match(asm) then test (asm)
		elsif /^tzcnt/i.match(asm) then tzcnt (asm)
		elsif /^ud2$/i.match(asm) then ud2 (asm)	
		elsif /^vmwrite/i.match(asm) then vmwrite (asm)
		elsif /^vmread/i.match(asm) then vmread (asm)			
		elsif /^f?wait$/i.match(asm) then wait (asm)
		elsif /^wbinvd$/i.match(asm) then wbinvd (asm)		
		elsif /^wrmsr$/i.match(asm) then wrmsr (asm)
		elsif /^xbegin/i.match(asm) then xbegin (asm)
		elsif /^xchg/i.match(asm) then xchg (asm)
		elsif /^xgetbv$/i.match(asm) then xgetbv (asm)
		elsif /^xlat$/i.match(asm) then xlat (asm)
		elsif /^xor/i.match(asm) then xor (asm)
		elsif /^xsetbv/i.match(asm) then xsetbv (asm)
		elsif /^xtest/i.match(asm) then xtest (asm)																																																																																																																																																																							
		else nasm(asm) end
	end
end

#--------------------------------------------
# 	Routines for Each Instruction			#
#--------------------------------------------

def aaa instruction
	#ASCII Adjust After Addition
	printf("%-34s%-15s\n\n", '37', 'aaa')	end
def aad instruction
	#ASCII Adjust AX Before Division
	printf("%-34s%-15s\n\n", 'D50A', 'aad')
	printf("%-34s%-15s\n\n", 'D5XX', 'aad imm8 (Machine Code Only, XX is base)')	end		
def aam instruction
	#ASCII Adjust AX After Multiply
	printf("%-34s%-15s\n\n", 'D40A', 'aam')
	printf("%-34s%-15s\n\n", 'D4XX', 'aam imm8 (Machine Code Only, XX is base)')	end	
def aas instruction
	#ASCII Adjust AL After Subtraction
	printf("%-34s%-15s\n\n", '3F', 'aas')	end	
def adc instruction
	#Add with Carry
	if alimm8(instruction, '14', '80D0')	
	elsif aximm16(instruction, '6615', '6681D0', '6683D0')
	elsif eaximm32(instruction, '15', '81D0', '83D0')		
	elsif modrmimm(instruction, 'adc', '80', '2')
	elsif modrmmodrm(instruction, '10')		
	else nasm(instruction) end end
def adcx instruction
	#Unsigned Integer Addition of Two Operands with Cary Flag
	if modrmmodrm(instruction, '660F38F6')		
	else nasm(instruction) end end
def add instruction
	#Add
	if alimm8(instruction, '04', '80C0')
	elsif aximm16(instruction, '6605', '6681C0', '6683C0')
	elsif eaximm32(instruction, '05', '81C0', '83C0')
	elsif modrmimm(instruction, 'add', '80', '0')	
	elsif modrmmodrm(instruction, '00')			
	else nasm(instruction) end end
def adox instruction
	#Unsigned Integer Addition of Two Operands with Overflow Flag
	if modrmmodrm(instruction, 'F30F38F6')		
	else nasm(instruction) end end
def andi instruction
	#Logical AND
	if alimm8_b(instruction, '25', '81E0', '6625', '6681E0', '24', '80E0', '6683E0')
	elsif aximm16_b(instruction, '25', '81E0', '6625', '6681E0', '24', '80E0', '6683E0')
	elsif eaximm32_b(instruction, '25', '81E0', '6625', '6681E0', '24', '80E0', '6683E0')
	elsif modrmimm(instruction, 'and', '80', '4')	
	elsif modrmmodrm(instruction, '20')			
	else nasm(instruction) end end
def arpl instruction
	#Unsigned Integer Addition of Two Operands with Overflow Flag
	if modrmmodrm(instruction, '63')		
	else nasm(instruction) end end
def bsf instruction
	#Bit Scan Forward
	if modrmmodrm(instruction, '0FBC')		
	else nasm(instruction) end end
def bsr instruction
	#Bit Scan Reverse
	if modrmmodrm(instruction, '0FBD')		
	else nasm(instruction) end end		
def bswap instruction
	#Compare Two Operands
	if plusreg(instruction, '0FC8')		
	else nasm(instruction) end end
def call instruction
	#Transactional Begin
	if jcc(instruction, 'E8')		
	else nasm(instruction) end end
def cbw instruction
	#Convert Byte to Word
	printf("%-34s%-15s\n\n", '6698', 'cbw')	end		
def cwde instruction
	#Convert Word to Doubleword
	printf("%-34s%-15s\n\n", '98', 'cwde')	end		
def clac instruction
	#Clear AC Flag in EFLAGS Register
	printf("%-34s%-15s\n\n", '0F01CA', 'clac')	end		
def clc instruction
	#Clear Carry Flag
	printf("%-34s%-15s\n\n", 'F8', 'clc')	end		
def cld instruction
	#Clear Direction Flag
	printf("%-34s%-15s\n\n", 'FC', 'cld')	end		
def cli instruction
	#Clear Interupt Flag
	printf("%-34s%-15s\n\n", 'FA', 'cli')	end		
def clts instruction
	#Clear Task-Switched Flag in CR0
	printf("%-34s%-15s\n\n", '0F06', 'clts')	end		
def cmc instruction
	#Complement Carry Flag
	printf("%-34s%-15s\n\n", 'F5', 'cmc')	end		
def cmova instruction
	#Move if Above
	if modrmmodrm(instruction, '0F47')		
	else nasm(instruction) end end
def cmovae instruction
	#Move if Above or Equal
	if modrmmodrm(instruction, '0F43')		
	else nasm(instruction) end end	
def cmovb instruction
	#Move if Below
	if modrmmodrm(instruction, '0F42')		
	else nasm(instruction) end end	
def cmovbe instruction
	#Move if Below or Equal
	if modrmmodrm(instruction, '0F46')		
	else nasm(instruction) end end	
def cmovc instruction
	#Move if Carry
	if modrmmodrm(instruction, '0F42')		
	else nasm(instruction) end end
def cmove instruction
	#Move if Equal
	if modrmmodrm(instruction, '0F44')		
	else nasm(instruction) end end	
def cmovg instruction
	#Move if Greater Than
	if modrmmodrm(instruction, '0F4F')		
	else nasm(instruction) end end
def cmovge instruction
	#Move if Greater Than or Equal
	if modrmmodrm(instruction, '0F4D')		
	else nasm(instruction) end end	
def cmovl instruction
	#Move if Lesser Than
	if modrmmodrm(instruction, '0F4C')		
	else nasm(instruction) end end	
def cmovle instruction
	#Move if Lesser Than or Equal
	if modrmmodrm(instruction, '0F4E')		
	else nasm(instruction) end end		
def cmovna instruction
	#Move if Not Above
	if modrmmodrm(instruction, '0F46')		
	else nasm(instruction) end end	
def cmovnae instruction
	#Move if Not Above or Equal
	if modrmmodrm(instruction, '0F42')		
	else nasm(instruction) end end	
def cmovnb instruction
	#Move if Not Below
	if modrmmodrm(instruction, '0F43')		
	else nasm(instruction) end end	
def cmovnbe instruction
	#Move if Not Below or Equal
	if modrmmodrm(instruction, '0F47')		
	else nasm(instruction) end end		
def cmovnc instruction
	#Move if Not Carry
	if modrmmodrm(instruction, '0F43')		
	else nasm(instruction) end end	
def cmovne instruction
	#Move if Not Equal
	if modrmmodrm(instruction, '0F45')		
	else nasm(instruction) end end	
def cmovng instruction
	#Move if Not Greater Than
	if modrmmodrm(instruction, '0F4E')		
	else nasm(instruction) end end	
def cmovnl instruction
	#Move if Not Lesser Than
	if modrmmodrm(instruction, '0F4D')		
	else nasm(instruction) end end	
def cmovnle instruction
	#Move if Not Lesser Than or Equal
	if modrmmodrm(instruction, '0F4F')		
	else nasm(instruction) end end
def cmovno instruction
	#Move if Not Over
	if modrmmodrm(instruction, '0F41')		
	else nasm(instruction) end end	
def cmovnp instruction
	#Move if Not Parity
	if modrmmodrm(instruction, '0F4B')		
	else nasm(instruction) end end	
def cmovns instruction
	#Move if Not Sign Flag
	if modrmmodrm(instruction, '0F49')		
	else nasm(instruction) end end		
def cmovnz instruction
	#Move if Not Zero
	if modrmmodrm(instruction, '0F45')		
	else nasm(instruction) end end	
def cmovo instruction
	#Move if Over
	if modrmmodrm(instruction, '0F40')		
	else nasm(instruction) end end	
def cmovp instruction
	#Move if Parity
	if modrmmodrm(instruction, '0F4A')		
	else nasm(instruction) end end	
def cmovpe instruction
	#Move if Parity Even
	if modrmmodrm(instruction, '0F4A')		
	else nasm(instruction) end end	
def cmovpo instruction
	#Move if Parity Odd
	if modrmmodrm(instruction, '0F4B')		
	else nasm(instruction) end end	
def cmovs instruction
	#Move if Sign Flag
	if modrmmodrm(instruction, '0F48')		
	else nasm(instruction) end end	
def cmovz instruction
	#Move if Zero
	if modrmmodrm(instruction, '0F44')		
	else nasm(instruction) end end															
def cmp instruction
	#Compare Two Operands
	if alimm8_c(instruction, '3C', '80F8')
	elsif aximm16_c(instruction, '663D', '6681F8', '6683F8')
	elsif eaximm32_c(instruction, '3D', '81F8', '83F8')
	elsif modrmimm(instruction, 'cmp', '80', '7')	
	elsif modrmmodrm(instruction, '38')			
	else nasm(instruction) end end
def cmpsb instruction
	#Compare String Operands (Byte)
	printf("%-34s%-15s\n\n", 'A6', 'cmpsb')	end		
def cmpsw instruction
	#Compare String Operands (Word)
	printf("%-34s%-15s\n\n", '66A7', 'cmpsw (WORD PTR ds:[esi],WORD PTR es:[edi])')	end
def cmpsd instruction
	#Compare String Operands (Doubleword)
	printf("%-34s%-15s\n\n", 'A7', 'cmpsd (DWORD PTR ds:[esi],DWORD PTR es:[edi])')	end	
def cmpxchg instruction
	#Compare Two Operands
	if modrmmodrm(instruction, '0FB0')			
	else nasm(instruction) end end
def cpuid instruction
	#CPU Identification
	printf("%-34s%-15s\n\n", '0FA2', 'cpuid')	end		
def cwd instruction
	#Convert Word to Doubleword
	printf("%-34s%-15s\n\n", '6699', 'cwd')	end
def cdq instruction
	#Convert Doubleword to Quadword
	printf("%-34s%-15s\n\n", '99', 'cdq')	end
def daa instruction
	#Decimal Adjust AL after Addition
	printf("%-34s%-15s\n\n", '27', 'daa')	end
def das instruction
	#Decimal Adjust AL after Subtraction
	printf("%-34s%-15s\n\n", '2F', 'das')	end
def dec instruction
	#Compare Two Operands
	if plusreg(instruction, '48')		
	else nasm(instruction) end end
def emms instruction
	#Empty MMX Technology State
	printf("%-34s%-15s\n\n", '0F77', 'emms')	end
def f2xm1 instruction
	#Compute 2^x-1
	printf("%-34s%-15s\n\n", 'D9F0', 'f2xm1')	end	
def fabs instruction
	#Absolute Value
	printf("%-34s%-15s\n\n", 'D9E1', 'fabs')	end	
def faddp instruction
	#Floating Point Add
	printf("%-34s%-15s\n\n", 'DEC1', 'faddp (faddp  st(1),st)')	end	
def fchs instruction
	#Change Sign
	printf("%-34s%-15s\n\n", 'D9E0', 'fchs')	end	
def fclex instruction
	#Clear Exceptions
	printf("%-34s%-15s\n\n", '9BDBE2', 'fclex')	end
def fnclex instruction
	#Clear Exceptions
	printf("%-34s%-15s\n\n", 'DBE2', 'fnclex')	end	
def fcom instruction
	#Compare Floating Point Values
	printf("%-34s%-15s\n\n", 'D8D1', 'fcom (st(1))')	end
def fcomp instruction
	#Compare Floating Point Values and Pop
	printf("%-34s%-15s\n\n", 'D8D9', 'fcomp (st(1))')	end	
def fcompp instruction
	#Compare Floating Point Values and Pop Twice
	printf("%-34s%-15s\n\n", 'DED9', 'fcompp')	end	
def fcos instruction
	#Cosine
	printf("%-34s%-15s\n\n", 'D9FF', 'fcos')	end	
def fdecstp instruction
	#Decrement Stack-Top Pointer
	printf("%-34s%-15s\n\n", 'D9F6', 'fdecstp')	end	
def fdivp instruction
	#Divide
	printf("%-34s%-15s\n\n", 'DEF9', 'fdivp (st(1),st)')	end		
def fdivrp instruction
	#Reverese Divide
	printf("%-34s%-15s\n\n", 'DEF1', 'fdivrp (st(1),st)')	end	
def fincstp instruction
	#Increment Stack-Top Pointer
	printf("%-34s%-15s\n\n", 'D9F7', 'fincstp')	end	
def finit instruction
	#Initialize Floating-Point Unit
	printf("%-34s%-15s\n\n", '9BDBE3', 'finit')	end	
def fninit instruction
	#Initialize Floating-Point Unit
	printf("%-34s%-15s\n\n", 'DBE3', 'fninit')	end	
def fld1 instruction
	#Load Constant (Push +1.0 onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9E8', 'fld1')	end	
def fldl2t instruction
	#Load Constant (Push log2,10 onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9E9', 'fldl2t')	end	
def fldl2e instruction
	#Load Constant (Push log2,e onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9EA', 'fldl2e')	end	
def fldpi instruction
	#Load Constant (Push pi onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9EB', 'fldpi')	end	
def fldlg2 instruction
	#Load Constant (Push log10,2 onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9EC', 'fldlg2')	end	
def fldln2 instruction
	#Load Constant (Push log e,2 onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9ED', 'fldln2')	end	
def fldz instruction
	#Load Constant (Push +0.0 onto the FPU register stack)
	printf("%-34s%-15s\n\n", 'D9EE', 'fldz')	end	
def fmulp instruction
	#Multiply
	printf("%-34s%-15s\n\n", 'DEC9', 'fmulp (st(1),st)') end	
def fnop instruction
	#Floating Point NOP
	printf("%-34s%-15s\n\n", 'D9D0', 'fnop') end	
def fpatan instruction
	#Partial Arctangent
	printf("%-34s%-15s\n\n", 'D9F3', 'fpatan') end	
def fprem instruction
	#Partial Remainder
	printf("%-34s%-15s\n\n", 'D9F8', 'fprem') end	
def fprem1 instruction
	#Partial Remainder
	printf("%-34s%-15s\n\n", 'D9F5', 'fprem1') end	
def fptan instruction
	#Partial Tangent
	printf("%-34s%-15s\n\n", 'D9F2', 'fptan') end	
def frndint instruction
	#Round to Integer
	printf("%-34s%-15s\n\n", 'D9FC', 'frndint') end	
def fscale instruction
	#Scale
	printf("%-34s%-15s\n\n", 'D9FD', 'fscale') end	
def fsin instruction
	#Sine
	printf("%-34s%-15s\n\n", 'D9FE', 'fsin') end	
def fsincos instruction
	#Sine and Cosine
	printf("%-34s%-15s\n\n", 'D9FB', 'fsincos') end	
def fsqrt instruction
	#Square Root
	printf("%-34s%-15s\n\n", 'D9FA', 'fsqrt') end	
def fstswax instruction
	#Store x87 FPU Status Word
	printf("%-34s%-15s\n\n", '9BDFE0', 'fstsw ax') end	
def fnstswax instruction
	#Store x87 FPU Status Word (without checking for pending unmasked floating-point exceptions)
	printf("%-34s%-15s\n\n", 'DFE0', 'fnstsw ax') end	
def fsubp instruction
	#Subtract
	printf("%-34s%-15s\n\n", 'DEE9', 'fsubp') end	
def fsubrp instruction
	#Reverse Subtract
	printf("%-34s%-15s\n\n", 'DEE1', 'fsubrp') end	
def ftst instruction
	#Test
	printf("%-34s%-15s\n\n", 'D9E4', 'ftst') end	
def fucom instruction
	#Unordered Compare Floating Point Values
	printf("%-34s%-15s\n\n", 'DDE1', 'fucom (st(1))') end	
def fucomp instruction
	#Unordered Compare Floating Point Values and pop register stack
	printf("%-34s%-15s\n\n", 'DDE9', 'fucomp (st(1))') end	
def fucompp instruction
	#Unordered Compare Floating Point Values and pop register stack twice
	printf("%-34s%-15s\n\n", 'DAE9', 'fucompp') end	
def fxam instruction
	#Examine ModR/M
	printf("%-34s%-15s\n\n", 'D9E5', 'fxam') end	
def fxch instruction
	#Exchange Register Contents
	printf("%-34s%-15s\n\n", 'D9C9', 'fxch (st(1))') end	
def fxtract instruction
	#Extract Exponent and Significand
	printf("%-34s%-15s\n\n", 'D9F4', 'fxtract') end	
def fyl2x instruction
	#Compute y * log2, x
	printf("%-34s%-15s\n\n", 'D9F1', 'fyl2x') end	
def fyl2xp1 instruction
	#Compute y * log2(x+1)
	printf("%-34s%-15s\n\n", 'D9F9', 'fyl2xp1') end	
def hlt instruction
	#Halt
	printf("%-34s%-15s\n\n", 'F4', 'hlt') end	
def IN instruction
	#Input from Port
	if alimm8_d(instruction, 'E4', 'E5')		
	else nasm(instruction) end end
def inc instruction
	#Compare Two Operands
	if plusreg(instruction, '40')		
	else nasm(instruction) end end
def insb instruction
	#Input from Port to String (Byte)
	printf("%-34s%-15s\n\n", '6C', 'insb (BYTE PTR es:[edi],dx)') end	
def insw instruction
	#Input from Port to String (Word)
	printf("%-34s%-15s\n\n", '666D', 'insw (WORD PTR es:[edi],dx)') end	
def insd instruction
	#Input from Port to String (DWword)
	printf("%-34s%-15s\n\n", '6D', 'insd (DWORD PTR es:[edi],dx)') end	
def into instruction
	#Call to Interrupt Procedure
	printf("%-34s%-15s\n\n", 'CE', 'into') end	
def invd instruction
	#Invalidate Internal Caches
	printf("%-34s%-15s\n\n", '0F08', 'invd') end	
def iret instruction
	#Interrupt Return, this applies for IRET and IRTED
	printf("%-34s%-15s\n\n", 'CF', instruction) end	
def iretw instruction
	#Interrupt Return (Word)
	printf("%-34s%-15s\n\n", '66CF', 'iretw') end	
def ja instruction
	#Jump if Above
	if jcc(instruction, '77')		
	else nasm(instruction) end end
def jae instruction
	#Jump if Above or Equal
	if jcc(instruction, '73')		
	else nasm(instruction) end end	
def jb instruction
	#Jump if Below
	if jcc(instruction, '72')		
	else nasm(instruction) end end	
def jbe instruction
	#Jump if Below or Equal
	if jcc(instruction, '76')		
	else nasm(instruction) end end	
def jc instruction
	#Jump if Carry
	if jcc(instruction, '72')		
	else nasm(instruction) end end
def je instruction
	#Jump if Equal
	if jcc(instruction, '74')		
	else nasm(instruction) end end	
def jg instruction
	#Jump if Greater Than
	if jcc(instruction, '7F')		
	else nasm(instruction) end end
def jge instruction
	#Jump if Greater Than or Equal
	if jcc(instruction, '7D')		
	else nasm(instruction) end end	
def jl instruction
	#Jump if Lesser Than
	if jcc(instruction, '7C')		
	else nasm(instruction) end end	
def jle instruction
	#Jump if Lesser Than or Equal
	if jcc(instruction, '7E')		
	else nasm(instruction) end end		
def jna instruction
	#Jump if Not Above
	if jcc(instruction, '76')		
	else nasm(instruction) end end	
def jnae instruction
	#Jump if Not Above or Equal
	if jcc(instruction, '72')		
	else nasm(instruction) end end	
def jnb instruction
	#Jump if Not Below
	if jcc(instruction, '73')		
	else nasm(instruction) end end	
def jnbe instruction
	#Jump if Not Below or Equal
	if jcc(instruction, '77')		
	else nasm(instruction) end end		
def jnc instruction
	#Jump if Not Carry
	if jcc(instruction, '73')		
	else nasm(instruction) end end	
def jne instruction
	#Jump if Not Equal
	if jcc(instruction, '75')		
	else nasm(instruction) end end	
def jng instruction
	#Jump if Not Greater Than
	if jcc(instruction, '7E')		
	else nasm(instruction) end end	
def jnl instruction
	#Jump if Not Lesser Than
	if jcc(instruction, '7D')		
	else nasm(instruction) end end	
def jnle instruction
	#Jump if Not Lesser Than or Equal
	if jcc(instruction, '7F')		
	else nasm(instruction) end end
def jno instruction
	#Jump if Not Over
	if jcc(instruction, '71')		
	else nasm(instruction) end end	
def jnp instruction
	#Jump if Not Parity
	if jcc(instruction, '7B')		
	else nasm(instruction) end end	
def jns instruction
	#Jump if Not Sign Flag
	if jcc(instruction, '79')		
	else nasm(instruction) end end		
def jnz instruction
	#Jump if Not Zero
	if jcc(instruction, '75')		
	else nasm(instruction) end end	
def jo instruction
	#Jump if Over
	if jcc(instruction, '70')		
	else nasm(instruction) end end	
def jp instruction
	#Jump if Parity
	if jcc(instruction, '7A')		
	else nasm(instruction) end end	
def jpe instruction
	#Jump if Parity Even
	if jcc(instruction, '7A')		
	else nasm(instruction) end end	
def jpo instruction
	#Jump if Parity Odd
	if jcc(instruction, '7B')		
	else nasm(instruction) end end	
def js instruction
	#Jump if Sign Flag
	if jcc(instruction, '78')		
	else nasm(instruction) end end	
def jmp instruction
	#Jump if Zero
	if jcc(instruction, 'EB')		
	else nasm(instruction) end end	
def jz instruction
	#Jump if Zero
	if jcc(instruction, '74')		
	else nasm(instruction) end end															
def lahf instruction
	#Load Status Flags into AH Register
	printf("%-34s%-15s\n\n", '9F', 'lahf') end	
def lea instruction
	#lea
	if modrmmodrm(instruction, '8D')		
	else nasm(instruction) end end	
def leave instruction
	#High Level Procedure Exit
	printf("%-34s%-15s\n\n", 'C9', 'leave') end	
def leavew instruction
	#High Level Procedure Exit (Word)
	printf("%-34s%-15s\n\n", '66C9', 'leavew') end	
def lfence instruction
	#Load Fence
	fence('lfence', '0FAE', 'E8') end
def lodsb instruction
	#Load String (Byte)
	printf("%-34s%-15s\n\n", 'AC', 'lodsb') end	
def lodsw instruction
	#Load String (Word)
	printf("%-34s%-15s\n\n", '66AD', 'lodsw') end	
def lodsd instruction
	#Load String (Doubleword)
	printf("%-34s%-15s\n\n", 'AD', 'lodsd') end	
def loopx instruction
	#Loop
	if rel8(instruction, 'E2')		
	else nasm(instruction) end end	
def loope instruction
	#Loop if Equal
	if rel8(instruction, 'E1')		
	else nasm(instruction) end end	
def loopne instruction
	#Loop if Not Equal
	if rel8(instruction, 'E0')		
	else nasm(instruction) end end			
def mfence instruction
	#Memory Fence
	fence('mfence', '0FAE', 'F0') end
def monitor instruction
	#Set Up Monitor Address
	printf("%-34s%-15s\n\n", '0F01C8', 'monitor') end	
def mov instruction
	if modrmimm(instruction, 'mov', 'C6', '0')
	elsif modrmmodrm(instruction, '88')			
	else nasm(instruction) end end		
def movsb instruction
	#Move Data from String to String (Byte)
	printf("%-34s%-15s\n\n", 'A4', 'movsb') end	
def movsw instruction
	#Move Data from String to String (Word)
	printf("%-34s%-15s\n\n", '66A5', 'movsw') end	
def movsd instruction
	#Move Data from String to String (Doubleword)
	printf("%-34s%-15s\n\n", 'A5', 'movsd') end	
def mwait instruction
	#Monitor Wait
	printf("%-34s%-15s\n\n", '0F01C9', 'mwait') end	
def nop instruction
	#No Operation
	printf("%-34s%-15s\n\n", '90', 'nop') end		
def OR instruction
	#Logical Inclusive OR
	if alimm8_e(instruction, '0D', '81C8', '660D', '6681C8', '0C', '80C8')
	elsif aximm16_e(instruction, '0D', '81C8', '660D', '6681C8', '0C', '80C8', '6683C8')
	elsif eaximm32_e(instruction, '0D', '81C8', '660D', '6681C8', '0C', '80C8', '83C8')
	elsif modrmimm(instruction, 'or', '80', '1')		
	elsif modrmmodrm(instruction, '08')			
	else nasm(instruction) end end
def outsb instruction
	#Output String to Port (Byte)
	printf("%-34s%-15s\n\n", '6E', 'outsb') end		
def outsw instruction
	#Output String to Port (Word)
	printf("%-34s%-15s\n\n", '666F', 'outsw') end		
def outsd instruction
	#Output String to Port (Doubleword)
	printf("%-34s%-15s\n\n", '6F', 'outsd') end	
def pause instruction
	#Spin Loop Hint
	printf("%-34s%-15s\n\n", 'F390', 'pause') end		
def pop instruction
	#Compare Two Operands
	if plusreg(instruction, '58')		
	else nasm(instruction) end end
def popaw instruction
	#Pop All General-Purpose Registers (Word)
	printf("%-34s%-15s\n\n", '6661', 'popaw') end	
def popa instruction
	#Pop All General-Purpose Registers
	printf("%-34s%-15s\n\n", '61', instruction) end	
def popcnt instruction
	#Return the Count of Number of Bits set to 1
	if modrmmodrm(instruction, 'F30FB8')		
	else nasm(instruction) end end
def popfw instruction
	#Pop Stack into EFLAGS Registers (Word)
	printf("%-34s%-15s\n\n", '669D', 'popfw') end	
def popf instruction
	#Pop Stack into EFLAGS Registers
	printf("%-34s%-15s\n\n", '9D', instruction) end	
def push instruction
	#Compare Two Operands
	if plusreg(instruction, '50')		
	else nasm(instruction) end end
def pushaw instruction
	#Push All General-Purpose Registers (Word)
	printf("%-34s%-15s\n\n", '6660', 'pushaw') end	
def pusha instruction
	#Push All General-Purpose Registers
	printf("%-34s%-15s\n\n", '60', instruction) end	
def pushfw instruction
	#Push EFLAGS Register onto the Stack (Word)
	printf("%-34s%-15s\n\n", '669C', 'pushfw') end	
def pushf instruction
	#Push EFLAGS Register onto the Stack
	printf("%-34s%-15s\n\n", '9C', instruction) end	
def rcl instruction
	if modrmimm(instruction, 'rcl', 'C0', '2')		
	else nasm(instruction) end end		
def rcr instruction
	if modrmimm(instruction, 'rcr', 'C0', '3')
	else nasm(instruction) end end			
def rol instruction
	if modrmimm(instruction, 'rol', 'C0', '0')
	else nasm(instruction) end end		
def ror instruction
	if modrmimm(instruction, 'ror', 'C0', '1')
	else nasm(instruction) end end				
def rdmsr instruction
	#Read from Model Specific Register
	printf("%-34s%-15s\n\n", '0F32', 'rdmsr') end	
def rdpmc instruction
	#Read Performance-Monitoring Counters
	printf("%-34s%-15s\n\n", '0F33', 'rdpmc') end	
def rdrand instruction
	#Compare Two Operands
	if plusreg(instruction, '0FC7F0')		
	else nasm(instruction) end end
def rdseed instruction
	#Compare Two Operands
	if plusreg(instruction, '0FC7F8')		
	else nasm(instruction) end end		
def rdtsc instruction
	#Read Time-Stamp Counter
	printf("%-34s%-15s\n\n", '0F31', 'rdtsc') end	
def rdtscp instruction
	#Read Time-Stamp Counter and Processor ID
	printf("%-34s%-15s\n\n", '0F01F9', 'rdtscp') end	
def ret instruction
	#Return from Procedure
	printf("%-34s%-15s\n\n", 'C3', 'ret') end	
def retf instruction
	#Return from Procedure (Far)
	printf("%-34s%-15s\n\n", 'CB', 'retf') end	
def rsm instruction
	#Resume from System Management Mode
	printf("%-34s%-15s\n\n", '0FAA', 'rsm') end	
def sahf instruction
	#Store AH into Flags
	printf("%-34s%-15s\n\n", '9E', 'sahf') end	
def sal instruction
	if modrmimm(instruction, 'sal', 'C0', '6')
	else nasm(instruction) end end		
def sar instruction
	if modrmimm(instruction, 'sar', 'C0', '7')
	else nasm(instruction) end end
def sbb instruction
	#Integer Subtraction with Borrow
	if alimm8(instruction, '1C', '80D8')
	elsif aximm16(instruction, '661D', '6681D8', '6683D8')
	elsif eaximm32(instruction, '1D', '81D8', '83D8')	
	elsif modrmimm(instruction, 'sbb', '80', '3')	
	elsif modrmmodrm(instruction, '18')			
	else nasm(instruction) end end
def scasb instruction
	#Scan String (Byte)
	printf("%-34s%-15s\n\n", 'AE', 'scasb') end	
def scasw instruction
	#Scan String (Word)
	printf("%-34s%-15s\n\n", '66AF', 'scasw') end	
def scasd instruction
	#Scan String (Doubleword)
	printf("%-34s%-15s\n\n", 'AF', 'scasd') end	
def sfence instruction
	#Store Fence
	fence('sfence', '0FAE', 'F8') end
def shl instruction
	if modrmimm(instruction, 'shl', 'C0', '4')
	else nasm(instruction) end end		
def shr instruction
	if modrmimm(instruction, 'shr', 'C0', '5')
	else nasm(instruction) end end
def stac instruction
	#Set AC Flag in EFLAGS Register
	printf("%-34s%-15s\n\n", '0F01CB', 'stac') end	
def stc instruction
	#Set Carry Flag
	printf("%-34s%-15s\n\n", 'F9', 'stc') end	
def std instruction
	#Set Direction Flag
	printf("%-34s%-15s\n\n", 'FD', 'std') end	
def sti instruction
	#Set Interrupt Flag
	printf("%-34s%-15s\n\n", 'FB', 'sti') end	
def stosb instruction
	#Store String (Byte)
	printf("%-34s%-15s\n\n", 'AA', 'stosb') end	
def stosw instruction
	#Store String (Word)
	printf("%-34s%-15s\n\n", '66AB', 'stosw') end	
def stosd instruction
	#Store String (Doubleword)
	printf("%-34s%-15s\n\n", 'AB', 'stosd') end	
def sub instruction
	#Subtract
	if alimm8(instruction, '2C', '80E8')
	elsif aximm16(instruction, '662D', '6681E8', '6683E8')
	elsif eaximm32(instruction, '2D', '81E8', '83E8')
	elsif modrmimm(instruction, 'sub', '80', '5')	
	elsif modrmmodrm(instruction, '28')			
	else nasm(instruction) end end
def swapgs instruction
	#Swap GS Base Register
	printf("%-34s%-15s\n\n", '0F01F8', 'swapgs') end	
def syscall instruction
	#Fast System Call
	printf("%-34s%-15s\n\n", '0F05', 'syscall') end	
def sysenter instruction
	#Fast System Call
	printf("%-34s%-15s\n\n", '0F34', 'sysenter') end	
def sysexit instruction
	#Fast Return from Fast System Call
	printf("%-34s%-15s\n\n", '0F35', 'sysexit') end	
def sysret instruction
	#Return From Fast System Call
	printf("%-34s%-15s\n\n", '0F07', 'sysret') end	
def test instruction
	#Logical Compare
	if alimm8_c(instruction, 'A8', 'F6C0')
	elsif aximm16_c(instruction, '66A9', '66F7C0', 'invalid')
	elsif eaximm32_c(instruction, 'A9', 'F7C0', 'invalid')		
	elsif modrmimm(instruction, 'test', 'F6', '0')	
	elsif modrmmodrm(instruction, '84')			
	else nasm(instruction) end end
def tzcnt instruction
	#Count the number of trailing zero bits
	if modrmmodrm(instruction, 'F30FBC')		
	else nasm(instruction) end end
def ud2 instruction
	#Undefined Instruction
	printf("%-34s%-15s\n\n", '0F0B', 'ud2') end	
def vmwrite instruction
	#VMWrite
	if modrmmodrm(instruction, '0F79')		
	else nasm(instruction) end end
def vmread instruction
	#VMRead
	if modrmmodrm(instruction, '0F78')		
	else nasm(instruction) end end
def wait instruction
	#Wait
	printf("%-34s%-15s\n\n", '9B', 'wait') end	
def wbinvd instruction
	#Write Back and Invalidate Cache
	printf("%-34s%-15s\n\n", '0F09', 'wbinvd') end	
def wrmsr instruction
	#Write to Model Specific Register
	printf("%-34s%-15s\n\n", '0F30', 'wrmsr') end	
def xbegin instruction
	#Transactional Begin
	if jcc(instruction, 'C7F8')		
	else nasm(instruction) end end
def xchg instruction
	#Exchange two registers
	if plusreg(instruction, '90')	
	elsif modrmmodrm(instruction, '86')
	else nasm(instruction) end end
def xgetbv instruction
	#Get Value of Extended Control Register
	printf("%-34s%-15s\n\n", '0F01D0', 'xgetbv') end	
def xlat instruction
	#Table Look-up Translation
	printf("%-34s%-15s\n\n", 'D7', 'xlat (BYTE PTR ds:[ebx])') end	
def xor instruction
	#Logical Exlusive OR
	if alimm8_c(instruction, '34', '80F0')
	elsif aximm16_c(instruction, '6635', '6681F0', '6683F0')
	elsif eaximm32_c(instruction, '35', '81F0', '83F0')	
	elsif modrmimm(instruction, 'xor', '80', '6')	
	elsif modrmmodrm(instruction, '30')		
	else nasm(instruction) end end
def xsetbv instruction
	#Set Extended Control Register
	printf("%-34s%-15s\n\n", '0F01D1', 'xsetbv') end	
def xtest instruction
	#Test If in Transactional Execution
	printf("%-34s%-15s\n\n", '0F01D6', 'xtest') end	

#------------------------------------
# 	Format Operand Data Subs  		#
#------------------------------------

def imm8 data
	if not /^0x/i.match(data)
		data = data.to_i(10).to_s(16) 
	else
		data = data.gsub(/0x(.+)/, '\1')
	end
	if data.to_s.length > 2
		puts "Error, likely source operand is too large for destination\n\n"
		main
	end
	data = zeropad(data, 2).upcase
	return data
end

def imm16 data
	if not /^0x/i.match(data)
		data = data.to_i(10).to_s(16) 
	else
		data = data.gsub(/0x(.+)/, '\1')
	end
	if data.to_s.length > 4
		puts "Source operand too large for destination\n\n"
		main
	end
	data = zeropad(data, 4).upcase
	return data
end

def imm32 data
	if not /^0x/i.match(data)
		data = data.to_i(10).to_s(16) 
	else
		data = data.gsub(/0x(.+)/, '\1')
	end
	if data.to_s.length > 8
		puts "Source operand too large for destination\n\n"
		main
	end
	data = zeropad(data, 8).upcase
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
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		instruction_alt = objdump(m1 + s_operand)
		printf("%-34s%-15s\n\n", m1 + s_operand, instruction_alt)
		instruction_alt = objdump(m2 + s_operand)
		printf("%-34s%-15s (r/m8, imm8)\n\n", m2 + s_operand, instruction_alt)	
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
		s_operand = imm16(extracted.captures[0])	
		if extracted_i = /00(..)/i.match(s_operand)
			instruction_alt = objdump(m3 + littleend(s_operand))
			printf("%-34s%-15s\n\n", m3 + extracted_i.captures[0], instruction_alt)		
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
	if /(\]|[abcd][hl])\s*,\s*(\d+|0x[0-9a-f]+$)/i.match(instruction) then
		#We are good to parse and process
	else return false end

	###############################
	#           PARSING           #
	###############################	
	#Parse if dest operand is byte, word, or dword
	if extracted = /(byte|word|dword)/i.match(instruction)
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
	if extracted = /([abcd][hl])\s*,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		#mod = 2 (11xxxxxx) / 192
		#op = num (xxoooxxx) / num * 8
		#register = (xxxxxrrr)
		modrm = 192 + (num.to_i * 8)
		register = extracted.captures[0]
		s_operand = imm8(extracted.captures[1])	
		if register == 'cl' then modrm = modrm + 1
		elsif register == 'dl' then modrm = modrm + 2
		elsif register == 'bl' then modrm = modrm + 3
		elsif register == 'ah' then modrm = modrm + 4
		elsif register == 'ch' then modrm = modrm + 5
		elsif register == 'dh' then modrm = modrm + 6
		elsif register == 'bh' then modrm = modrm + 7	
		end									
		modrm = modrm.to_s(16)	
		instruction_alt = objdump(m1 + modrm + s_operand)
		printf("%-34s%-15s\n\n", m1 + modrm + s_operand, instruction_alt)
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
	#num - the encoded instruction within the modr/m (i.e ADC r/m8,imm8 is /2)

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

	#Kick the ADCX, ADOX, and VMWRITE and VMREAD instructions out if it's not 32-bit
	if m1 == '660F38F6' or m1 == 'F30F38F6' or m1 == '0F79' or m1 == '0F78' and not /^e[abcds][xpi]/i.match(reg1) then
		puts "This instruction only supports 32bit operands\n\n"
		return 1
	end

	#Kick the ARPL instruction out if it's not 16-bit
	if m1 == '63' and not /^[abcds][xpi]/i.match(reg1) then
		puts "This instruction only supports 16bit operands\n\n"
		return 1
	end

	#Kick the BSF, BSR, POPCNT, and TZCNT out if it is 8-bit
	if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == 'F30FBC' or /^cmov/i.match(instruction) and not /^e?[abcds][xpi]/i.match(reg1) then
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
		if m1 == '0FBC' or m1 == '0FBD' or m1 == 'F30FB8' or m1 == 'F30FBC' or /^cmov/i.match(instruction) then
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
				puts "LEA is not 8-bit\n"
				return 1
			end				
			m1 = m1.gsub(/^(.)0/i, '\12')
			m1 = m1.gsub(/^(.)8/i, '\1A')				
		end
	else	#It's 2 registers
		#Kick out the LEA instructions
		if m1 == '8D' then 
			puts "LEA can only be LEA Register, Memory Location\n\n"
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
				puts "My output doesn't match that of nasm, something may be wrong here\n\n"
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

#Added LOOP, LOOPE, LOOPNE, XBEGIN, and CMOVs
#Added OP, rel forms of CALL and JMP
