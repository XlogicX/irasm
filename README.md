# irasm
Interactive Redundant Assembler (shell)

# Description
The irasm shell takes an assembly instruction as input, and gives the corresponding machine code as output.<br>
The main distinction between this tool and something like nasm_shell, is that the output not only gives an official machine code output, but it also gives alternative machine-code, including some machine-code that no assembler would output (valid machine code)<br>
Not every instruction format is supported. For those that aren't, this script gracefully falls back on using nasm to assemble some machine code<br>
Some instruction formats that may never get support are ones with xmm registers and VEX prefixes

# Supported Instruction Formats
Atomic (nop, ret, pause, etc...)<br>
OP al, imm8 (xor al, 0x13)<br>
OP ax, imm16 (xor ax, 0x1337)<br>
OP eax, imm32 (xor eax, 0x13371337)<br>
OP r/m8, imm8 (adc byte [eax + ebx + 0x1337], 66)<br>
OP r/m16, imm8 (adc word [eax + ebx + 0x1337], 0x22)<br>
OP r/m32, imm8 (adc dword [eax + ebx + 0x1337], 0x22)<br>
OP r/m16, imm16 (adc word [eax + ebx + 0x1337], 0x4444)<br>
OP r/m32, imm32 (adc dword [eax + ebx + 0x1337], 0x88888888)<br>
OP r/m8, r8 (xor al, ah)<br>
OP r/m16, r16 (xor ax, ax)<br>
OP r/m32, r32 (xor eax, eax)<br>
OP r8, r/m8 (xor al, ah)<br>
OP r16, r/m16 (xor ax, ax)<br>
OP r32, r/m32 (xor eax, eax)<br>
OP rel8<br>
OP rel16<br>
OP rel32<br>

## Remaining Formats (to call script 'public')


# Fully Supported Instructions
adc, aad, aam, aas, add, and, cbw, cmp cwde, clac, clc, cld, cli, clts, cmc, cmpsb, cmpsw, cmpsd, cpuid, cwd, cdq, daa, das, emms, f2xm1, fabs, faddp, fchs, fclex, fnclex, fcompp, fcos, fdecstp, fincstp, finit, fninit, fld1, fldl2t, fldl2e, fldpi, fldlg2, fldln2, fldz, fnop, fpatan, fprem, fprem1, fptan, frndint, fscale, fsin, fsincos, fsqrt, ftst, fucompp, fxam, fxtract, fyl2x, fyl2xp1, hlt, insb, insw, insd, into, invd, iretw, iretd, iret, lahf, leave, leavew, lfence, lock, lodsb, lodsw, lodsd, mfence, monitor, movsb, movsw, movsd, mwait, nop, or, outsb, outsw, outsd, pause, popaw, popad, popa, popfw, popfd, popf, pushaw, pushad, pusha, pushfw, pushfd, pushf, rdmsr, rdpmc, rdtsc, rdtscp, rsm, sbb, scasb, scasw, scasd, sfence, stac, stc, std, sti, stosb, stosw, stosd, sub, swapgs, syscall, sysenter, sysexit, sysret, test, ud2, fwait, wait, wbinvd, wrmsr, xgetbv, xlat, xor, xsetbv, and xtest

# Partially Supported Instructions (only with the above instruction formats)
fcom, fcomp, fdivp, fdivrp, fmulp, fstsw ax, fnstsw ax, fsubp, fsubrp, fucom, fucomp, fxch, in, ret, retf, and sahf

# Test Instructions
The below instructions are examples that can be used to test out the functionality of irasm:<br>
aad<br>
add eax, 0x00000022<br>
adc byte [ebp + eax + 0x13371337], 88<br>
mfence<br>
cmp ax, 0x5555<br>
and al, 0x66<br>
