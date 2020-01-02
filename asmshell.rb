#!/usr/bin/ruby

def main(bits)
	while 1 do
		print 'asmshell > '
		asm = gets.chomp
		if /(quit|(?<!s)exit)/i.match(asm)
			exit
		end 
		nasm(asm,bits) 
	end
end

def nasm (data,bits)
	file = File.open("tmp.asm", "w")
	if bits == 32 then file.write("[BITS 32]\n" + data + "\n")
	else file.write("[BITS 16]\n" + data + "\n") end
	file.close
	cmd = 'nasm -f bin tmp.asm'
	system(cmd)
	machine_code = `xxd -ps -g 16 tmp`
	machine_code = machine_code.chomp
	puts "%s\t%s\t\n\n" % [machine_code, data]
	system('rm tmp tmp.asm')
end

bits = 32
if ARGV[0] == '-b' then bits = 16 end
ARGV.clear

main(bits)
