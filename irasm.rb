#!/usr/bin/ruby

def main
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
		elsif /^adc/i.match(asm) then adc (asm)
		elsif /^add/i.match(asm) then add (asm)	
		elsif /^and/i.match(asm) then andi (asm)
		elsif /^cbw/i.match(asm) then cbw (asm)			
		elsif /^cwde/i.match(asm) then cwde (asm)
		elsif /^clac/i.match(asm) then clac (asm)	
		elsif /^clc/i.match(asm) then clc (asm)		
		elsif /^cld/i.match(asm) then cld (asm)
		elsif /^cli/i.match(asm) then cli (asm)	
		elsif /^clts/i.match(asm) then clts (asm)
		elsif /^cmc/i.match(asm) then cmc (asm)	
		elsif /^cmp[^s]/i.match(asm) then cmp (asm)	
		elsif /^cmpsb/i.match(asm) then cmpsb (asm)	
		elsif /^cmpsw/i.match(asm) then cmpsw (asm)	
		elsif /^cmpsd/i.match(asm) then cmpsd (asm)			
		elsif /^cpuid/i.match(asm) then cpuid (asm)	
		elsif /^cwd/i.match(asm) then cwd (asm)
		elsif /^cdq/i.match(asm) then cdq (asm)			
		elsif /^daa/i.match(asm) then daa (asm)	
		elsif /^das/i.match(asm) then das (asm)	
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
		elsif /^insb$/i.match(asm) then insb (asm)
		elsif /^insw$/i.match(asm) then insw (asm)
		elsif /^insd$/i.match(asm) then insd (asm)
		elsif /^into$/i.match(asm) then into (asm)	
		elsif /^invd$/i.match(asm) then invd (asm)
		elsif /^iretw$/i.match(asm) then iretw (asm)
		elsif /^iretd?$/i.match(asm) then iret (asm)
		elsif /^lahf$/i.match(asm) then lahf (asm)	
		elsif /^leave$/i.match(asm) then leave (asm)
		elsif /^leavew$/i.match(asm) then leavew (asm)	
		elsif /^lfence$/i.match(asm) then lfence (asm)
		elsif /^lock$/i.match(asm) then lock (asm)
		elsif /^lodsb$/i.match(asm) then lodsb (asm)
		elsif /^lodsw$/i.match(asm) then lodsw (asm)
		elsif /^lodsd$/i.match(asm) then lodsd (asm)
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
		elsif /^popaw$/i.match(asm) then popaw (asm)
		elsif /^popad?$/i.match(asm) then popa (asm)			
		elsif /^popfw$/i.match(asm) then popfw (asm)
		elsif /^popfd?$/i.match(asm) then popf (asm)
		elsif /^pushaw$/i.match(asm) then pushaw (asm)
		elsif /^pushad?$/i.match(asm) then pusha (asm)			
		elsif /^pushfw$/i.match(asm) then pushfw (asm)
		elsif /^pushfd?$/i.match(asm) then pushf (asm)
		elsif /^rdmsr$/i.match(asm) then rdmsr (asm)
		elsif /^rdpmc$/i.match(asm) then rdpmc (asm)
		elsif /^rdtsc$/i.match(asm) then rdtsc (asm)
		elsif /^rdtscp$/i.match(asm) then rdtscp (asm)
		elsif /^ret$/i.match(asm) then ret (asm)
		elsif /^retf$/i.match(asm) then retf (asm)
		elsif /^rsm$/i.match(asm) then rsm (asm)
		elsif /^sahf$/i.match(asm) then sahf (asm)
		elsif /^sbb/i.match(asm) then sbb (asm)			
		elsif /^scasb$/i.match(asm) then scasb (asm)			#m,m forms are bullshit
		elsif /^scasw$/i.match(asm) then scasw (asm)			#...
		elsif /^scasd$/i.match(asm) then scasd (asm)			#...
		elsif /^sfence$/i.match(asm) then sfence (asm)	
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
		elsif /^ud2$/i.match(asm) then ud2 (asm)	
		elsif /^f?wait$/i.match(asm) then wait (asm)
		elsif /^wbinvd$/i.match(asm) then wbinvd (asm)		
		elsif /^wrmsr$/i.match(asm) then wrmsr (asm)
		elsif /^xgetbv$/i.match(asm) then xgetbv (asm)
		elsif /^xlat$/i.match(asm) then xlat (asm)
		elsif /^xor/i.match(asm) then xor (asm)
		elsif /^xsetbv/i.match(asm) then xsetbv (asm)
		elsif /^xtest/i.match(asm) then xtest (asm)	
		elsif /^\[/.match(asm) then modrm8(asm)																																																																																																																																																																							
		else nasm(asm) end
	end
end

#--------------------------------------------
# 	Routines for Each Instruction			#
#--------------------------------------------

def aaa instruction
	#ASCII Adjust After Addition
	puts "37                                       aaa\n\n" end
def aad instruction
	#ASCII Adjust AX Before Division
	puts "D50A                                     aad                 (Default Base 10)\n\n"
	puts "Alternatives (Machine Code Only):"
	puts "D5XX                                     aad imm8            (Where XX is the base)\n\n" end
def aam instruction
	#ASCII Adjust AX After Multiply
	puts "D40A                                     aam                 (Default Base 10)\n\n"
	puts "Alternative Machine Code:"
	puts "D4XX                                     aam imm8            (Where XX is the base)\n\n" end
def aas instruction
	#ASCII Adjust AL After Subtraction
	puts "3f                                       aas\n\n" end
def adc instruction
	#Add with Carry
	if alimm8(instruction, 'adc', '14', '80D0')
	elsif aximm16(instruction, 'adc', '6615', '6681D0', '14', '80D0')
	elsif eaximm32(instruction, 'adc', '15', '81D0', '6615', '6681D0', '14', '80D0')		
	else nasm(instruction) end end
def add instruction
	#Add
	if alimm8(instruction, 'add', '04', '80C0')
	elsif aximm16(instruction, 'add', '6605', '6681C0', '04', '80C0')
	elsif eaximm32(instruction, 'add', '05', '81C0', '6605', '6681C0', '04', '80C0')		
	else nasm(instruction) end end
def andi instruction
	#Logical AND
	if alimm8_b(instruction, 'and', '25', '81E0', '6625', '6681E0', '24', '80E0')
	elsif aximm16_b(instruction, 'and', '25', '81E0', '6625', '6681E0', '24', '80E0')
	elsif eaximm32_b(instruction, 'and', '25', '81E0', '6625', '6681E0', '24', '80E0')		
	else nasm(instruction) end end
def cbw instruction
	#Convert Byte to Word
	puts "6698                                     cbw\n\n" end
def cwde instruction
	#Convert Word to Doubleword
	puts "98                                       cwde\n\n" end
def clac instruction
	#Clear AC Flag in EFLAGS Register
	puts "0F01CA                                   clac\n\n" end
def clc instruction
	#Clear Carry Flag
	puts "F8                                       clc\n\n" end
def cld instruction
	#Clear Direction Flag
	puts "FC                                       cld\n\n" end
def cli instruction
	#Clear Interupt Flag
	puts "FA                                       cli\n\n" end
def clts instruction
	#Clear Task-Switched Flag in CR0
	puts "0F06                                     clts\n\n" end
def cmc instruction
	#Complement Carry Flag
	puts "F5                                       cmc\n\n" end
def cmp instruction
	#Compare Two Operands
	if alimm8_c(instruction, 'adc', '3C', '80F8')
	elsif aximm16_c(instruction, 'adc', '663D', '6681F8')
	elsif eaximm32_c(instruction, 'adc', '3D', '81F8')		
	else nasm(instruction) end end
def cmpsb instruction
	#Compare String Operands (Byte)
	puts "A6                                       cmpsb\n\n" end
def cmpsw instruction
	#Compare String Operands (Word)
	puts "66A7                                     cmpsw           (WORD PTR ds:[esi],WORD PTR es:[edi])\n\n" end
def cmpsd instruction
	#Compare String Operands (Doubleword)
	puts "A7                                       cmpsd           (DWORD PTR ds:[esi],DWORD PTR es:[edi])\n\n" end
def cpuid instruction
	#CPU Identification
	puts "0FA2                                     CPUID\n\n" end
def cwd instruction
	#Convert Word to Doubleword
	puts "6699                                     cwd\n\n" end
def cdq instruction
	#Convert Doubleword to Quadword
	puts "99                                       cdq\n\n" end
def daa instruction
	#Decimal Adjust AL after Addition
	puts "27                                       daa\n\n" end
def das instruction
	#Decimal Adjust AL after Subtraction
	puts "2F                                       das\n\n" end
def emms instruction
	#Empty MMX Technology State
	puts "0F77                                     emms\n\n" end
def f2xm1 instruction
	#Compute 2^x-1
	puts "D9F0                                     f2xm1\n\n" end
def fabs instruction
	#Absolute Value
	puts "D9E1                                     fabs\n\n" end
def faddp instruction
	#Floating Point Add
	puts "DEC1                                     faddp           (faddp  st(1),st)\n\n" end
def fchs instruction
	#Change Sign
	puts "D9E0                                     fchs\n\n" end
def fclex instruction
	#Clear Exceptions
	puts "9BDBE2                                   fclex\n\n" end
def fnclex instruction
	#Clear Exceptions
	puts "DBE2                                     fnclex\n\n" end
def fcom instruction
	#Compare Floating Point Values
	puts "D8D1                                     fcom            (st(1))\n\n" end
def fcomp instruction
	#Compare Floating Point Values and Pop
	puts "D8D9                                     fcomp           (st(1))\n\n" end
def fcompp instruction
	#Compare Floating Point Values and Pop Twice
	puts "DED9                                     fcompp\n\n" end
def fcos instruction
	#Cosine
	puts "D9FF                                     fcos\n\n" end
def fdecstp instruction
	#Decrement Stack-Top Pointer
	puts "D9F6                                     fdecstp\n\n" end
def fdivp instruction
	#Divide
	puts "DEF9                                     fdivp           (st(1),st)\n\n" end
def fdivrp instruction
	#Reverese Divide
	puts "DEF1                                     fdivrp          (st(1),st)\n\n" end
def fincstp instruction
	#Increment Stack-Top Pointer
	puts "D9F7                                     fincstp\n\n" end
def finit instruction
	#Initialize Floating-Point Unit
	puts "9BDBE3                                   finit\n\n" end
def fninit instruction
	#Initialize Floating-Point Unit
	puts "DBE3                                     fninit\n\n" end
def fld1 instruction
	#Load Constant (Push +1.0 onto the FPU register stack)
	puts "D9E8                                     fld1\n\n" end
def fldl2t instruction
	#Load Constant (Push log2,10 onto the FPU register stack)
	puts "D9E9                                     fldl2t\n\n" end
def fldl2e instruction
	#Load Constant (Push log2,e onto the FPU register stack)
	puts "D9EA                                     fldl2e\n\n" end
def fldpi instruction
	#Load Constant (Push pi onto the FPU register stack)
	puts "D9EB                                     fldpi\n\n" end
def fldlg2 instruction
	#Load Constant (Push log10,2 onto the FPU register stack)
	puts "D9EC                                     fldlg2\n\n" end
def fldln2 instruction
	#Load Constant (Push log e,2 onto the FPU register stack)
	puts "D9ED                                     fldln2\n\n" end
def fldz instruction
	#Load Constant (Push +0.0 onto the FPU register stack)
	puts "D9EE                                     fldz\n\n" end
def fmulp instruction
	#Multiply
	puts "DEC9                                     fmulp           (st(1),st)\n\n" end
def fnop instruction
	#Floating Point NOP
	puts "D9D0                                     fnop\n\n" end
def fpatan instruction
	#Partial Arctangent
	puts "D9F3                                     fpatan\n\n" end
def fprem instruction
	#Partial Remainder
	puts "D9F8                                     fprem\n\n" end
def fprem1 instruction
	#Partial Remainder
	puts "D9F5                                     fprem1\n\n" end
def fptan instruction
	#Partial Tangent
	puts "D9F2                                     fptan\n\n" end
def frndint instruction
	#Round to Integer
	puts "D9FC                                     frndint\n\n" end
def fscale instruction
	#Scale
	puts "D9FD                                     fscale\n\n" end
def fsin instruction
	#Sine
	puts "D9FE                                     fsin\n\n" end
def fsincos instruction
	#Sine and Cosine
	puts "D9FB                                     fsincos\n\n" end
def fsqrt instruction
	#Square Root
	puts "D9FA                                     fsqrt\n\n" end
def fstswax instruction
	#Store x87 FPU Status Word
	puts "9BDFE0                                   fstsw ax\n\n" end
def fnstswax instruction
	#Store x87 FPU Status Word (without checking for pending unmasked floating-point exceptions)
	puts "DFE0                                     fnstsw ax\n\n" end
def fsubp instruction
	#Subtract
	puts "DEE9                                     fsubp\n\n" end
def fsubrp instruction
	#Reverse Subtract
	puts "DEE1                                     fsubrp\n\n" end
def ftst instruction
	#Test
	puts "D9E4                                     ftst\n\n" end
def fucom instruction
	#Unordered Compare Floating Point Values
	puts "DDE1                                     fucom           (st(1))\n\n" end
def fucomp instruction
	#Unordered Compare Floating Point Values and pop register stack
	puts "DDE9                                     fucomp          (st(1))\n\n" end
def fucompp instruction
	#Unordered Compare Floating Point Values and pop register stack twice
	puts "DAE9                                     fucompp\n\n" end
def fxam instruction
	#Examine ModR/M
	puts "D9E5                                     fxam\n\n" end
def fxch instruction
	#Exchange Register Contents
	puts "D9C9                                     fxch            (st(1))\n\n" end
def fxtract instruction
	#Extract Exponent and Significand
	puts "D9F4                                     fxtract\n\n" end
def fyl2x instruction
	#Compute y * log2, x
	puts "D9F1                                     fyl2x\n\n" end
def fyl2xp1 instruction
	#Compute y * log2(x+1)
	puts "D9F9                                     fyl2xp1\n\n" end
def hlt instruction
	#Halt
	puts "F4                                       hlt\n\n" end
def IN instruction
	#Input from Port
	if alimm8_d(instruction, 'adc', 'E4', 'E5')		
	else nasm(instruction) end end
def insb instruction
	#Input from Port to String (Byte)
	puts "6C                                       insb            (BYTE PTR es:[edi],dx)\n\n"  end
def insw instruction
	#Input from Port to String (Word)
	puts "666D                                     insw            (WORD PTR es:[edi],dx)\n\n" end
def insd instruction
	#Input from Port to String (DWword)
	puts "6D                                       insd            (DWORD PTR es:[edi],dx)\n\n" end
def into instruction
	#Call to Interrupt Procedure
	puts "CE                                       into\n\n" end
def invd instruction
	#Invalidate Internal Caches
	puts "0F08                                     invd\n\n" end
def iret instruction
	#Interrupt Return
	puts "CF                                       %s\n\n" % instruction end
def iretw instruction
	#Interrupt Return (Word)
	puts "66CF                                     iretw\n\n" end
def lahf instruction
	#Load Status Flags into AH Register
	puts "9F                                       lahf\n\n" end
def leave instruction
	#High Level Procedure Exit
	puts "C9                                       leave\n\n" end
def leavew instruction
	#High Level Procedure Exit (Word)
	puts "66C9                                     leavew\n\n" end
def lfence instruction
	#Load Fence
	fence('lfence', '0FAE', 'E8') end
def lodsb instruction
	#Load String (Byte)
	puts "AC                                       lodsb\n\n" end
def lodsw instruction
	#Load String (Word)
	puts "66AD                                     lodsw\n\n" end
def lodsd instruction
	#Load String (Doubleword)
	puts "AD                                       lodsd\n\n" end
def mfence instruction
	#Memory Fence
	fence('mfence', '0FAE', 'F0') end
def monitor instruction
	#Set Up Monitor Address
	puts "0F01C8                                   monitor\n\n" end
def movsb instruction
	#Move Data from String to String (Byte)
	puts "A4                                       movsb\n\n" end
def movsw instruction
	#Move Data from String to String (Word)
	puts "66A5                                     movsw\n\n" end
def movsd instruction
	#Move Data from String to String (Doubleword)
	puts "A5                                       movsd\n\n" end
def mwait instruction
	#Monitor Wait
	puts "0F01C9                                   mwait\n\n" end
def nop instruction
	#No Operation
	puts "90                                       nop\n\n" end
def OR instruction
	#Logical Inclusive OR
	if alimm8_e(instruction, 'or', '0D', '81C8', '660D', '6681C8', '0C', '80C8')
	elsif aximm16_e(instruction, 'or', '0D', '81C8', '660D', '6681C8', '0C', '80C8')
	elsif eaximm32_e(instruction, 'or', '0D', '81C8', '660D', '6681C8', '0C', '80C8')		
	else nasm(instruction) end end
def outsb instruction
	#Output String to Port (Byte)
	puts "6E                                       outsb\n\n" end
def outsw instruction
	#Output String to Port (Word)
	puts "666F                                     outsw\n\n" end
def outsd instruction
	#Output String to Port (Doubleword)
	puts "6F                                       outsd\n\n" end
def pause instruction
	#Spin Loop Hint
	puts "F390                                     pause\n\n" end
def popaw instruction
	#Pop All General-Purpose Registers (Word)
	puts "6661                                     popaw\n\n" end
def popa instruction
	#Pop All General-Purpose Registers
	puts "61                                       %s\n\n" % instruction end
def popfw instruction
	#Pop Stack into EFLAGS Registers (Word)
	puts "669D                                     popfw\n\n" end
def popf instruction
	#Pop Stack into EFLAGS Registers
	puts "9D                                       %s\n\n" % instruction end
def pushaw instruction
	#Push All General-Purpose Registers (Word)
	puts "6660                                     pushaw\n\n" end
def pusha instruction
	#Push All General-Purpose Registers
	puts "60                                       %s\n\n" % instruction end
def pushfw instruction
	#Push EFLAGS Register onto the Stack (Word)
	puts "669C                                     pushfw\n\n" end
def pushf instruction
	#Push EFLAGS Register onto the Stack
	puts "9C                                       %s\n\n" % instruction end
def rdmsr instruction
	#Read from Model Specific Register
	puts "0F32                                     rdmsr\n\n" end
def rdpmc instruction
	#Read Performance-Monitoring Counters
	puts "0F33                                     rdpmc\n\n" end
def rdtsc instruction
	#Read Time-Stamp Counter
	puts "0F31                                     rdtsc\n\n" end
def rdtscp instruction
	#Read Time-Stamp Counter and Processor ID
	puts "0F01F9                                   rdtscp\n\n" end
def ret instruction
	#Return from Procedure
	puts "C3                                       ret\n\n" end
def retf instruction
	#Return from Procedure (Far)
	puts "CB                                       retf\n\n" end
def rsm instruction
	#Resume from System Management Mode
	puts "0FAA                                     rsm\n\n" end
def sahf instruction
	#Store AH into Flags
	puts "9E                                       sahf\n\n" end
def sbb instruction
	#Integer Subtraction with Borrow
	if alimm8_e(instruction, 'sbb', '1D', '81D8', '661D', '6681D8', '1C', '80D8')
	elsif aximm16_e(instruction, 'sbb', '1D', '81D8', '661D', '6681D8', '1C', '80D8')
	elsif eaximm32_e(instruction, 'sbb', '1D', '81D8', '661D', '6681D8', '1C', '80D8')		
	else nasm(instruction) end end
def scasb instruction
	#Scan String (Byte)
	puts "AE                                       scasb\n\n" end
def scasw instruction
	#Scan String (Word)
	puts "66AF                                     scasw\n\n" end
def scasd instruction
	#Scan String (Doubleword)
	puts "AF                                       scasd\n\n" end
def sfence instruction
	#Store Fence
	fence('sfence', '0FAE', 'F8') end
def stac instruction
	#Set AC Flag in EFLAGS Register
	puts "0F01CB                                   stac\n\n" end
def stc instruction
	#Set Carry Flag
	puts "F9                                       stc\n\n" end
def std instruction
	#Set Direction Flag
	puts "FD                                       std\n\n" end
def sti instruction
	#Set Interrupt Flag
	puts "FB                                       sti\n\n" end
def stosb instruction
	#Store String (Byte)
	puts "AA                                       stosb\n\n" end
def stosw instruction
	#Store String (Word)
	puts "66AB                                     stosw\n\n" end
def stosd instruction
	#Store String (Doubleword)
	puts "AB                                       stosd\n\n" end
def sub instruction
	#Subtract
	if alimm8_e(instruction, 'sub', '2D', '81E8', '662D', '6681E8', '2C', '80E8')
	elsif aximm16_e(instruction, 'sub', '2D', '81E8', '662D', '6681E8', '2C', '80E8')
	elsif eaximm32_e(instruction, 'sub', '2D', '81E8', '662D', '6681E8', '2C', '80E8')		
	else nasm(instruction) end end
def swapgs instruction
	#Swap GS Base Register
	puts "0F01F8                                   swapgs\n\n" end
def syscall instruction
	#Fast System Call
	puts "0F05                                     syscall\n\n" end
def sysenter instruction
	#Fast System Call
	puts "0F34                                     sysenter\n\n" end
def sysexit instruction
	#Fast Return from Fast System Call
	puts "0F35                                     sysexit\n\n" end
def sysret instruction
	#Return From Fast System Call
	puts "0F07                                     sysret\n\n" end
def test instruction
	#Logical Compare
	if alimm8_c(instruction, 'test', 'A8', 'F6C0')
	elsif aximm16_c(instruction, 'test', '66A9', '66F7C0')
	elsif eaximm32_c(instruction, 'test', 'A9', 'F7C0')		
	else nasm(instruction) end end
def ud2 instruction
	#Undefined Instruction
	puts "0F0B                                     ud2\n\n" end
def wait instruction
	#Wait
	puts "9B                                       wait\n\n" end
def wbinvd instruction
	#Write Back and Invalidate Cache
	puts "0F09                                     wbinvd\n\n" end
def wrmsr instruction
	#Write to Model Specific Register
	puts "0F30                                     wrmsr\n\n" end
def xgetbv instruction
	#Get Value of Extended Control Register
	puts "0F01D0                                   xgetbv\n\n" end
def xlat instruction
	#Table Look-up Translation
	puts "D7                                       xlat            (BYTE PTR ds:[ebx])\n\n" end
def xor instruction
	#Logical Exlusive OR
	if alimm8_c(instruction, 'test', '34', '80F0')
	elsif aximm16_c(instruction, 'test', '6635', '6681F0')
	elsif eaximm32_c(instruction, 'test', '35', '81F0')		
	else nasm(instruction) end end
def xsetbv instruction
	#Set Extended Control Register
	puts "0F01D1                                       xsetbv\n\n" end
def xtest instruction
	#Test If in Transactional Execution
	puts "0F01D6                                       xtest\n\n" end

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
		puts "Source operand to large for destination register"
		exit
	end
	data = zeropad(data, 2)
	return data
end

def imm16 data
	if not /^0x/i.match(data)
		data = data.to_i(10).to_s(16) 
	else
		data = data.gsub(/0x(.+)/, '\1')
	end
	if data.to_s.length > 4
		puts "Source operand to large for destination register"
		exit
	end
	data = zeropad(data, 4)
	return data
end

def imm32 data
	if not /^0x/i.match(data)
		data = data.to_i(10).to_s(16) 
	else
		data = data.gsub(/0x(.+)/, '\1')
	end
	if data.to_s.length > 8
		puts "Source operand to large for destination register"
		exit
	end
	data = zeropad(data, 8)
	return data
end

#--------------------------------------------
# 	Instruction Format Subroutines			#
#--------------------------------------------
#null reducable [adc, aad]
def alimm8 (instruction, op, m1, m2)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, etc...)
	#	m1 is the explicit machine code
	#	m2 is the r/m8, imm8 version of the machine code
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		printf("%-32s %20s", m1 + s_operand, instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + s_operand, instruction, "(r/m8, imm8)\n")		
		return 1
	end
end

def aximm16 (instruction, op, m1, m2, m3, m4)	#OP AX, imm16
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the al, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm16(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction, "(r/m16, imm16)\n")
		if extracted_i = /00(..)/i.match(s_operand)
			instruction = instruction.gsub(/ax/i, 'al')
			printf("%-32s %20s %20s", m3 + extracted_i.captures[0], instruction, "(al, imm8)\n")		
		end
		puts "\n"
		return 1
	end
end

def eaximm32 (instruction, op, m1, m2, m3, m4, m5, m6)	#OP EAX, imm32
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the al, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction, "(r/m32, imm32)\n")
		if extracted_i = /0000(....)/i.match(s_operand)
			instruction = instruction.gsub(/eax/i, 'ax')
		    printf("%-32s %20s %20s", m3 + littleend(extracted_i.captures[0]), instruction, "(r/m16, imm16)\n")			
			printf("%-32s %20s %20s", m4 + littleend(extracted_i.captures[0]), instruction, "(ax, imm16)\n")		
		end		
		if extracted_i = /000000(..)/i.match(s_operand)
			instruction = instruction.gsub(/ax/i, 'al')
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction, "(al, imm8)\n")
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction, "(r/m8, imm8)\n")		
		end
		puts "\n"
		return 1
	end
end

#0xff extendable and 0xff reducable [and]
def alimm8_b (instruction, op, m1, m2, m3, m4, m5, m6)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, etc...)
	#	m1 is the explicit machine code
	#	m2 is the r/m8, imm8 version of the machine code
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		printf("%-32s %20s", m5 + s_operand, instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m6 + s_operand, instruction, "(r/m8, imm8)\n")
		printf("%-32s %20s %20s", m3 + littleend('ff' + s_operand), instruction, "(ax, imm16)\n")
		printf("%-32s %20s %20s", m4 + littleend('ff' + s_operand), instruction, "(r/m16, imm16)\n")
		printf("%-32s %20s %20s", m1 + littleend('ffffff' + s_operand), instruction, "(eax, imm32)\n")
		printf("%-32s %20s %20s", m2 + littleend('ffffff' + s_operand), instruction, "(r/m32, imm32)\n")

		return 1
	end
end

def aximm16_b (instruction, op, m1, m2, m3, m4, m5, m6)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the al, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm16(extracted.captures[0])
		printf("%-32s %20s", m3 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m4 + littleend(s_operand), instruction, "(r/m16, imm16)\n")
		printf("%-32s %20s %20s", m1 + littleend('ffff' + s_operand), instruction, "(eax, imm32)\n")
		printf("%-32s %20s %20s", m2 + littleend('ffff' + s_operand), instruction, "(r/m32, imm32)\n")
		if extracted_i = /ff(..)/i.match(s_operand)
			instruction = instruction.gsub(/ax/i, 'al')
			instruction = instruction.gsub(/xff/i, 'x')
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction, "(al, imm8)\n")
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction, "(r/m8, imm8)\n")		
		end
		puts "\n"
		return 1
	end
end

def eaximm32_b (instruction, op, m1, m2, m3, m4, m5, m6)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the al, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction, "(r/m32, imm32)\n")
		if extracted_i = /ffff(....)/i.match(s_operand)		
			printf("%-32s %20s %20s", m3 + littleend(extracted_i.captures[0]), instruction, "(ax, imm16)\n")
		    printf("%-32s %20s %20s", m4 + littleend(extracted_i.captures[0]), instruction, "(r/m16, imm16)\n")			
		end		
		if extracted_i = /ffffff(..)/i.match(s_operand)		
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction, "(al, imm8)\n")
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction, "(r/m8, imm8)\n")		
		end
		puts "\n"
		return 1
	end
end

#not extendable nor reducable [cmp, test, xor]
def alimm8_c (instruction, op, m1, m2)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, etc...)
	#	m1 is the explicit machine code
	#	m2 is the r/m8, imm8 version of the machine code
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		printf("%-32s %20s", m1 + s_operand, instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + s_operand, instruction, "(r/m8, imm8)\n")		
		return 1
	end
end

def aximm16_c (instruction, op, m1, m2)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm16(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction, "(r/m16, imm16)\n")
		return 1
	end
end

def eaximm32_c (instruction, op, m1, m2)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction, "(r/m32, imm32)\n")
		return 1
	end
end

#not extendable nor reducable and no r/m,imm redundancy and imm is always imm8 [IN]
def alimm8_d (instruction, op, m1, m2)	#OP AL, imm8
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
		printf("%-32s %20s\n\n", m1 + s_operand, instruction)	
		return 1
	end
end

#null extendable and null reducable [or, sbb, sub]
def alimm8_e (instruction, op, m1, m2, m3, m4, m5, m6)	#OP AL, imm8
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, etc...)
	#	m1 is the explicit machine code
	#	m2 is the r/m8, imm8 version of the machine code
	#Is it: OP al, imm8?
	if extracted = /^\w+\s+al,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm8(extracted.captures[0]) #validate sanity of imm8
		printf("%-32s %20s", m5 + s_operand, instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m6 + s_operand, instruction, "(r/m8, imm8)\n")
		printf("%-32s %20s %20s", m3 + littleend('00' + s_operand), instruction, "(ax, imm16)\n")
		printf("%-32s %20s %20s", m4 + littleend('00' + s_operand), instruction, "(r/m16, imm16)\n")
		printf("%-32s %20s %20s", m1 + littleend('000000' + s_operand), instruction, "(eax, imm32)\n")
		printf("%-32s %20s %20s", m2 + littleend('000000' + s_operand), instruction, "(r/m32, imm32)\n")

		return 1
	end
end

def aximm16_e (instruction, op, m1, m2, m3, m4, m5, m6)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the al, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+ax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm16(extracted.captures[0])
		printf("%-32s %20s", m3 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m4 + littleend(s_operand), instruction, "(r/m16, imm16)\n")
		printf("%-32s %20s %20s", m1 + littleend('0000' + s_operand), instruction, "(eax, imm32)\n")
		printf("%-32s %20s %20s", m2 + littleend('0000' + s_operand), instruction, "(r/m32, imm32)\n")
		if extracted_i = /00(..)/i.match(s_operand)
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction, "(al, imm8)\n")
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction, "(r/m8, imm8)\n")		
		end
		puts "\n"
		return 1
	end
end

def eaximm32_e (instruction, op, m1, m2, m3, m4, m5, m6)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#	m3 is the al, imm8 version of the machine code
	#Is it: OP ax, imm16?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction, "(r/m32, imm32)\n")
		if extracted_i = /0000(....)/i.match(s_operand)		
			printf("%-32s %20s %20s", m3 + littleend(extracted_i.captures[0]), instruction, "(ax, imm16)\n")			
		    printf("%-32s %20s %20s", m4 + littleend(extracted_i.captures[0]), instruction, "(r/m16, imm16)\n")			
		end		
		if extracted_i = /000000(..)/i.match(s_operand)		
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction, "(al, imm8)\n")
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction, "(r/m8, imm8)\n")		
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
	printf("%-32s %20s\n\n", m1 + m2, instruction)
	puts "Alternatives (Machine Code Only):"
	for i in 1..7
			printf("%-32s %20s\n", (m1 + (m2.hex.to_s(10).to_i + i).to_s(16)).upcase, instruction)
	end
	puts
end

def modrm8 (instruction)
	#is it just a register as the pointer
	if extracted = /^\[[^\]]*?(e[acdbs][xip])[^\]]*?\]/i.match(instruction)
		register = extracted.captures[0]
		offset = '0'
		multiplier = '1'
	end
	if extracted = /^\[[^\]]*?[^x*]{2}(\d+)[^\]]*?\]/i.match(instruction)
		offset = extracted.captures[0]	
	end		
	if extracted = /^\[[^\]]*?(0x[0-9a-f]+)[^\]]*?\]/i.match(instruction)
		offset = extracted.captures[0]
	end
	if extracted = /^\[[^\]]*?\*\s*([1248])[^\]]*?\]/i.match(instruction)
		multiplier = extracted.captures[0]
	end
	#All Values parsed:
	puts "Register: %s" % register
	puts "Offset: %s" % offset
	puts "Multiplier %s" % multiplier		

end
#[register, a number, a multiplier], in any order

#any register
#1 and 4 byte offsets for number
#multipliers of 1, 2, 4, and 8
#esp can't have multipier

#register = eax, ecx, edx, ebx, ebp, esp, esi, edi
#number = 0x[a-f0-9] or \d
#multiplier = register\s\*\s[1248], were register isn't esp


#--------------------------------
# 	Other Helper Routines		#
#--------------------------------

def zeropad (data, bytes)
	#A function that adds leading zeros for the specified amount
	#of bytes. Maybe this could be a sprintf equiv...
	len = data.length		
	zeros = bytes - len
	data = '0' * zeros + data
	return data
end

def littleend (data)
	#This function reverses bytes to be little-endian
	returndata = ''
	while extracted = /.+(..)$/i.match(data) do
		returndata = returndata + extracted.captures[0]
		data = data.gsub(/(.+)..$/i, '\1')
	end
	returndata = "%s%s" % [returndata, data]
	return returndata
end

def nasm (data)
	file = File.open("tmp.asm", "w")
	file.write("[BITS 32]\n" + data + "\n")
	file.close
	cmd = 'nasm -f bin tmp.asm'
	system(cmd)
	machine_code = `xxd -ps -g 16 tmp`
	machine_code = machine_code.chomp
	puts "Decoded with the help of Nasm:\n%s\t%s\n\n" % [machine_code, data]
	system('rm tmp tmp.asm')
end

main
