# irasm
Interactive Redundant Assembler (shell)

# Description
The irasm shell takes an assembly instruction as input, and gives the corresponding machine code as output.<br>
The main distinction between this tool and something like nasm_shell, is that the output not only gives an official machine code output, but it also gives alternative machine-code, including some machine-code that no assembler would output (valid machine code)<br>
Not every instruction format is supported. For those that aren't, this script gracefully falls back on using nasm to assemble some machine code<br>
Some instruction formats that may never get support are ones with xmm registers and VEX prefixes

#Supported Instruction Formats
Atomic (nop, ret, pause, etc...)<br>
OP al/ax/eax, imm8/16/32 (xor ax, 0x1337)

#Supported Instructions (only with the above instruction formats)
aad, aam, aas, adc, add, and, cbw, cwde, clac, clc, cld, cli, clts, cmc, cmp, cmpsb, cmpsw, cmpsd, cpuid, cwd, cdq, daa, das, emms, f2xm1, fabs, faddp, fchs, fclex, fnclex, fcom, fcomp, fcompp, fcos, fdecstp, fdivp, fdivrp, fincstp, finit, fninit, fld1, fldl2t, fldl2e, fldpi, fldlg2, fldln2, fldz, fmulp, fnop, fpatan, fprem, fprem1, fptan, frndint, fscale, fsin, fsincos, fsqrt, fstsw ax, fnstsw ax, fsubp, fsubrp, ftst, fucom, fucomp, fucompp, fxam, fxch, fxtract, fyl2x, fyl2xp1, hlt, in\s, insb, insw, insd, into, invd, iretw, iretd?, lahf, leave, leavew, lfence, lock, lodsb, lodsw, lodsd, mfence, monitor, movsb, movsw, movsd, mwait, nop, or\s, outsb, outsw, outsd, pause, popaw, popad?, popfw, popfd?, pushaw, pushad?, pushfw, pushfd?, rdmsr, rdpmc, rdtsc, rdtscp, ret, retf, rsm, sahf, sbb, scasb, scasw, scasd, sfence, stac, stc, std, sti, stosb, stosw, stosd, sub, swapgs, syscall, sysenter, sysexit, sysret, test, ud2, f?wait, wbinvd, wrmsr, xgetbv, xlat, xor, xsetbv, and xtest
