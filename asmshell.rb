#!/usr/bin/ruby

def main
	while 1 do
		print 'asmshell > '
		asm = gets.chomp
		if /(quit|(?<!s)exit)/i.match(asm)
			exit
		end 

		nasm(asm) 
	end
end

def nasm (data)
	file = File.open("tmp.asm", "w")
	file.write("[BITS 32]\n" + data + "\n")
	file.close
	cmd = 'nasm -f bin tmp.asm'
	system(cmd)
	machine_code = `xxd -ps -g 16 tmp`
	machine_code = machine_code.chomp
	puts "%s\t%s\t\n\n" % [machine_code, data]
	system('rm tmp tmp.asm')
end

main
