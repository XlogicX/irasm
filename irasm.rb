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
	elsif eaximm32(instruction, 'adc', '15', '81D0', '6615', '6681D0', '14', '80D0')
	elsif modrm8imm(instruction, 'adc', '80', '2')
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
		instruction_alt = objdump(m2 + s_operand)
		printf("%-32s %20s %20s", m2 + s_operand, instruction_alt, "(r/m8, imm8)\n")		
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
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction_alt, "(r/m16, imm16)\n")
		if extracted_i = /00(..)/i.match(s_operand)
			instruction = instruction.gsub(/ax/i, 'al')
			instruction_alt = objdump(m3 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m3 + extracted_i.captures[0], instruction_alt, "(al, imm8)\n")		
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
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction_alt, "(r/m32, imm32)\n")
		if extracted_i = /0000(....)/i.match(s_operand)
			instruction = instruction.gsub(/eax/i, 'ax')
			instruction_alt = objdump(m3 + littleend(extracted_i.captures[0]))
		    printf("%-32s %20s %20s", m3 + littleend(extracted_i.captures[0]), instruction_alt, "(r/m16, imm16)\n")
		    instruction_alt = objdump(m4 + littleend(extracted_i.captures[0]))			
			printf("%-32s %20s %20s", m4 + littleend(extracted_i.captures[0]), instruction_alt, "(ax, imm16)\n")		
		end		
		if extracted_i = /000000(..)/i.match(s_operand)
			instruction = instruction.gsub(/ax/i, 'al')
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction_alt, "(al, imm8)\n")
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction_alt, "(r/m8, imm8)\n")		
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
		instruction_alt = objdump(m6 + s_operand)
		printf("%-32s %20s %20s", m6 + s_operand, instruction_alt, "(r/m8, imm8)\n")
		instruction_alt = objdump(m3 + littleend('ff' + s_operand))
		printf("%-32s %20s %20s", m3 + littleend('ff' + s_operand), instruction_alt, "(ax, imm16)\n")
		instruction_alt = objdump(m4 + littleend('ff' + s_operand))
		printf("%-32s %20s %20s", m4 + littleend('ff' + s_operand), instruction_alt, "(r/m16, imm16)\n")
		instruction_alt = objdump(m1 + littleend('ffffff' + s_operand))
		printf("%-32s %20s %20s", m1 + littleend('ffffff' + s_operand), instruction_alt, "(eax, imm32)\n")
		instruction_alt = objdump(m2 + littleend('ffffff' + s_operand))
		printf("%-32s %20s %20s", m2 + littleend('ffffff' + s_operand), instruction_alt, "(r/m32, imm32)\n")

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
		instruction_alt = objdump(m4 + littleend(s_operand))
		printf("%-32s %20s %20s", m4 + littleend(s_operand), instruction_alt, "(r/m16, imm16)\n")
		instruction_alt = objdump(m1 + littleend('ffff' + s_operand))
		printf("%-32s %20s %20s", m1 + littleend('ffff' + s_operand), instruction_alt, "(eax, imm32)\n")
		instruction_alt = objdump(m2 + littleend('ffff' + s_operand))
		printf("%-32s %20s %20s", m2 + littleend('ffff' + s_operand), instruction_alt, "(r/m32, imm32)\n")
		if extracted_i = /ff(..)/i.match(s_operand)
			instruction = instruction.gsub(/ax/i, 'al')
			instruction = instruction.gsub(/xff/i, 'x')
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction_alt, "(al, imm8)\n")
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction_alt, "(r/m8, imm8)\n")		
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
	#Is it: OP eax, imm32?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction_alt, "(r/m32, imm32)\n")
		if extracted_i = /ffff(....)/i.match(s_operand)		
			instruction_alt = objdump(m3 + littleend(extracted_i.captures[0]))
			printf("%-32s %20s %20s", m3 + littleend(extracted_i.captures[0]), instruction_alt, "(ax, imm16)\n")
			instruction_alt = objdump(m4 + littleend(extracted_i.captures[0]))
		    printf("%-32s %20s %20s", m4 + littleend(extracted_i.captures[0]), instruction_alt, "(r/m16, imm16)\n")			
		end		
		if extracted_i = /ffffff(..)/i.match(s_operand)		
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction_alt, "(al, imm8)\n")
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction_alt, "(r/m8, imm8)\n")		
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
		instruction_int = objdump(m2 + s_operand)
		printf("%-32s %20s %20s", m2 + s_operand, instruction_int, "(r/m8, imm8)\n")		
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
		instruction_int = objdump(m2 + littleend(s_operand))
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction_int, "(r/m16, imm16)\n")
		return 1
	end
end

def eaximm32_c (instruction, op, m1, m2)
	#Where instruction is the full instruction inputted
	#	op is the opcode (adc, xor, cmp, ec...)
	#	m1 is the explicit machine code
	#	m2 is the r/m16, imm16 version of the machine code
	#Is it: OP eax, imm32?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		instruction_int = objdump(m2 + littleend(s_operand))
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction_int, "(r/m32, imm32)\n")
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
		instruction_alt = objdump(m6 + s_operand)
		printf("%-32s %20s %20s", m6 + s_operand, instruction_alt, "(r/m8, imm8)\n")
		instruction_alt = objdump(m3 + littleend('00' + s_operand))
		printf("%-32s %20s %20s", m3 + littleend('00' + s_operand), instruction_alt, "(ax, imm16)\n")
		instruction_alt = objdump(m4 + littleend('00' + s_operand))
		printf("%-32s %20s %20s", m4 + littleend('00' + s_operand), instruction_alt, "(r/m16, imm16)\n")
		instruction_alt = objdump(m1 + littleend('000000' + s_operand))
		printf("%-32s %20s %20s", m1 + littleend('000000' + s_operand), instruction_alt, "(eax, imm32)\n")
		instruction_alt = objdump(m2 + littleend('000000' + s_operand))
		printf("%-32s %20s %20s", m2 + littleend('000000' + s_operand), instruction_alt, "(r/m32, imm32)\n")

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
		instruction_alt = objdump(m4 + littleend(s_operand))
		printf("%-32s %20s %20s", m4 + littleend(s_operand), instruction_alt, "(r/m16, imm16)\n")
		instruction_alt = objdump(m1 + littleend('0000' + s_operand))
		printf("%-32s %20s %20s", m1 + littleend('0000' + s_operand), instruction_alt, "(eax, imm32)\n")
		instruction_alt = objdump(m2 + littleend('0000' + s_operand))
		printf("%-32s %20s %20s", m2 + littleend('0000' + s_operand), instruction_alt, "(r/m32, imm32)\n")
		if extracted_i = /00(..)/i.match(s_operand)
			instruction_alt = objdump(m5 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction_alt, "(al, imm8)\n")
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction_alt, "(r/m8, imm8)\n")		
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
	#Is it: OP ax, imm32?
	if extracted = /^\w+\s+eax,\s*((0x)?[a-f0-9]+)$/i.match(instruction)
		s_operand = imm32(extracted.captures[0])
		printf("%-32s %20s", m1 + littleend(s_operand), instruction)
		puts "\nAssembly Alternatives:"
		instruction_alt = objdump(m2 + littleend(s_operand))
		printf("%-32s %20s %20s", m2 + littleend(s_operand), instruction_alt, "(r/m32, imm32)\n")
		if extracted_i = /0000(....)/i.match(s_operand)
			instruction_alt = objdump(m3 + littleend(extracted_i.captures[0]))
			printf("%-32s %20s %20s", m3 + littleend(extracted_i.captures[0]), instruction_alt, "(ax, imm16)\n")
			instruction_alt = objdump(m4 + littleend(extracted_i.captures[0]))			
		    printf("%-32s %20s %20s", m4 + littleend(extracted_i.captures[0]), instruction_alt, "(r/m16, imm16)\n")			
		end		
		if extracted_i = /000000(..)/i.match(s_operand)	
			instruction_alt = objdump(m5 + extracted_i.captures[0])	
			printf("%-32s %20s %20s", m5 + extracted_i.captures[0], instruction_alt, "(al, imm8)\n")
			instruction_alt = objdump(m6 + extracted_i.captures[0])
			printf("%-32s %20s %20s", m6 + extracted_i.captures[0], instruction_alt, "(r/m8, imm8)\n")		
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

def modrm8imm (instruction, op, m1, num)
	#instruction - full unparsed instruction
	#op - instruction name
	#m1 - machine code for it
	#num - the encoded instruction within the modr/m (i.e ADC r/m8,imm8 is /2)

	#Doesn't yet do alternates
	#Recommended [base + scacle + disp], different order will have silent errors

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
	#			add appropriate displacements with 0's [MUST REVIEW THIS POSSIBLY BAD LOGIC]
	#		f. Add displacements (of appropriate size) if they exist

	###############################
	#           PARSING           #
	###############################	
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
		printf("%-32s %20s\n\n", m1 + modrm + s_operand, instruction)
		return 1
	end	

	negative = 0	#Default, will be changed if subtraction of disp found
	reg_a = ''		#Default, will populate for an edge case
	reg_b = ''		#Default, will populate for an edge case

	#is it just a register as the pointer
	if extracted = /byte.+?\[[^\]]*?(e[acdbs][xip])[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		register = extracted.captures[0]
		s_operand = imm8(extracted.captures[1])
		offset = '0'
		multiplier = '0'
		mreg = ''
	end

	#Parse offset
	#Is there a decimal formatted offset
	if extracted = /byte.+?\[[^\]]*?(?<![x*\s]{2})(\d+)[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		offset = extracted.captures[0]				#parse disp
		s_operand = imm8(extracted.captures[1])		#parse imm
	end		
	if extracted = /byte.+?\[[^\]]*?-\s*?\d+/i.match(instruction) then negative = 1 end		#parse negative value
	#Is there a hex formatted offset
	if extracted = /byte.+?\[[^\]]*?(0x[0-9a-f]+)[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		offset = extracted.captures[0]				#parse disp
		s_operand = imm8(extracted.captures[1])		#parse imm
	end
	if extracted = /byte.+?\[[^\]]*?-\s*(0x[0-9a-f]+)/i.match(instruction) then negative = 1 end #parse negative value
	if $debug == 1 then puts "negative value?: %i" % negative end

	#Is there a scale
	if extracted = /byte.+?\[[^\]]*?(e[acdbs][xip])\s*?\*\s*?([1248])[^\]]*?\]\s*?,\s*?((0x)?[a-f0-9]+)$/i.match(instruction)
		mreg = extracted.captures[0] 				#parse scaled register
		multiplier = extracted.captures[1]			#parse scale
		s_operand = imm8(extracted.captures[2])		#parse imm
		if instruction !~ /.+?e[acdbs][xip].+e[acdbs][xip]/i	#parse possibility of no base register
			register = 'none'
		end
	end

	#Have to handle implicit * 1 with kid gloves, ie adc byte [eax + ebp], 88
	#For the regex, if there's a register followed by adding another register that does not have a scale after it
	if extracted = /byte.+?\[[^\]]*?(e[acdbs][xip])\s*?\+\s*?(e[acdbs][xip])[^*]+$/i.match(instruction) then
		reg_a = extracted.captures[0]	#parse first register
		reg_b = extracted.captures[1]	#parse second register
		tworegs = 1
	end	

	#PROCESSING
	modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, m1, instruction, num)

	###############################
	#   OUTPUT STANDARD RESULTS   #
	###############################	
	if multiplier_p == '0' and !esp_areg_p then
		printf("%-32s %20s\n\n", m1 + modrm_p + s_operand_p, instruction)
	elsif !register_p and !multiplier_p and !mreg_p and offset then
		printf("%-32s %20s\n\n", m1 + modrm_p + s_operand_p, instruction)
	elsif modrm_p == 'error' then return 1
	else printf("%-32s %20s\n\n", m1 + modrm_p + sib_p + s_operand_p, instruction) end

	###############################
	#  OUTPUT ALTERNATE RESULTS   #
	###############################	
	#Force commutative property
	if reg_a != 'esp' and reg_b != 'esp' and tworegs == 1 and reg_a != reg_b then		#If it's machine possible to swap registers
		reg_a, reg_b = reg_b, reg_a		#swapem
		#Re-Process
		modrm_p, sib_p, s_operand_p, esp_areg_p, multiplier_p, register_p, mreg_p = pointer(negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
		if modrm_p == 'error' then return 1
		else 
			instruction_alt = objdump(m1+modrm_p+sib_p + s_operand_p)
			printf("%-32s %20s (Forced commutative property)\n\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt)
		end
		reg_a, reg_b = reg_b, reg_a		#swapem back
	end	
	#Gratuitous disp (convert 1 byte disp to 4 byte disp)
	#This routine requires disp to be in 0xhex format
	if (disp_to_dec(offset) < 128 and negative != '1') or (disp_to_dec(offset) < 129 and negative == '1')
		if extracted = /^[0-9]/i.match(offset) then 		#If decimal (not hex) formatted
			offset = "0x%s" % imm8(offset)						#change it to hex format
		end
		#manually put offset in 0xhex format for processing rest
		if extracted = /.+([0-9a-f]{2})/i.match(offset) then
			s_operand_p = littleend(signed_pad(offset, negative)) + s_operand		#sign extend the disp
			modrm_p = zeropad(((modrm_p.to_i(16).to_s(10)).to_i + 64).to_s(16), 2)	#modify modrm to be disp32 instead of disp8
			if !register_p and !multiplier_p and !mreg_p and offset then			#if it's just the offset
				#Don't do anything, it's actually already supposed to be encoded as disp32
			elsif multiplier_p == '0' and !esp_areg_p then
				instruction_alt = objdump(m1 + modrm_p + s_operand_p)
				printf("%-32s %20s\n\n", m1 + modrm_p + s_operand_p, instruction_alt)
			elsif modrm_p == 'error' then return 1
			else 
				instruction_alt = objdump(m1 + modrm_p + sib_p + s_operand_p)
				printf("%-32s %20s\n\n", m1 + modrm_p + sib_p + s_operand_p, instruction_alt) 
			end
		end			
	end
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
	data = '0' * zeros + data
	return data
end

def fpad (data, bytes)
	#A function that adds leading zeros for the specified amount
	len = data.length
	ffff = bytes - len
	data = 'f' * ffff + data
	return data
end

def signed_pad (data, negative)
	#Takes a signed byte and pads it to 32 bits (signed)
	data = imm8(data)	#remove 0x prefix
	if negative == 1 
		data = fpad((256 - (data.to_i(16).to_s(10)).to_i).to_s(16), 8)
	else
		data = zeropad(data, 8)
	end
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



def pointer (negative, reg_a, reg_b, register, s_operand, offset, multiplier, mreg, m1, instruction, num)
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
			printf("\nesp is an invalid Scaled Index\n") 
			return ["error", '0', '0', '0', '0', '0']
		end
	end	

	#Have to handle implicit * 1 with kid gloves, ie adc byte [eax + ebp], 88
	if reg_a != '' and reg_b != '' then
		if $debug == 1 then puts "reg1 is %s" % reg_a end
		if $debug == 1 then puts "reg2 is %s" % reg_b end
		if reg_a == 'esp' and reg_b == 'esp' then
			printf("\nesp is an invalid Scaled Index\n") 
			return ["error", '0', '0', '0', '0', '0']
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
		offset = 4294967296 - disp_to_dec(offset).to_i	#Get absolute number
		offset = offset.to_s		
		offset = 256 - disp_to_dec(offset).to_i			#2's compliment	8bit	
		offset = offset.to_s
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then
			s_operand = littleend(zeropad(imm32(offset),8)) + s_operand
			modrm = modrm - 64
		else s_operand = littleend(zeropad(imm8(offset),2)) + s_operand	end	
	elsif disp_to_dec(offset) > 2147483647 and negative == 1 then
		puts "Invalid negative displacement"
		return ["error", '0', '0', '0', '0', '0']
	elsif disp_to_dec(offset) < 2147483648 and disp_to_dec(offset) > 128 and negative == 1	then
		#32bit 2's compliment
		offset = 4294967296 - disp_to_dec(offset).to_i	#2's compliment
		offset = offset.to_s
		if $debug == 1 then puts "Offset is %i" % disp_to_dec(offset) end
		if register == 'none' and (multiplier == '4' or multiplier == '8') then modrm = modrm - 128 end
		s_operand = littleend(zeropad(imm32(offset),8)) + s_operand	
	elsif disp_to_dec(offset) < 129 and disp_to_dec(offset) > 0 and negative == 1 then
		#8bit 2's compliment
		offset = 256 - disp_to_dec(offset).to_i			#2's compliment
		offset = offset.to_s
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

def nasm (data)
	file = File.open("tmp.asm", "w")
	file.write("[BITS 32]\n" + data + "\n")
	file.close
	cmd = 'nasm -f bin tmp.asm'
	system(cmd)
	machine_code = `xxd -ps -g 16 tmp`
	machine_code = machine_code.chomp
	puts "%s\t%s\t(Provided by Nasm)\n\n" % [machine_code, data]
	system('rm tmp tmp.asm')
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
	end
end

main
