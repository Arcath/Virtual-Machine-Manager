class VirtualMachine
	def self.all
		vms=[]
		system("VBoxManage list vms > /tmp/vboxlst.tmp")
		f=File.new("/tmp/vboxlst.tmp")
		begin
			while (line = f.readline)
				a=line.scan(/\"(.*)\" \{/)
				vms.push(a[0][0]) if a[0] != nil
			end
		rescue EOFError
			f.close
		end
		vms
	end

	def self.on
		vms=[]
		system("VBoxManage list runningvms > /tmp/vboxlst.tmp")
		f=File.new("/tmp/vboxlst.tmp")
		begin
			while (line = f.readline)
				a=line.scan(/\"(.*)\" \{/)
				vms.push(a[0][0]) if a[0] != nil
			end
		rescue EOFError
			f.close
		end
		vms
	end

	def self.off
		all - on
	end
	
	def self.start(vm)
		system("screen -d -m -S VBOXVM-#{vm.gsub(" ","-")} VBoxHeadless -s \"#{vm}\"")
	end
	
	def self.terminate(vm)
		system("screen -ls > /tmp/screenlist.tmp")
		f=File.new("/tmp/screenlist.tmp", "r")
		begin
			while (line = f.readline)
				pid=line.scan(/\t(.*?)\.VBOXVM-#{vm.gsub(" ","-")}/) if line =~ /VBOXVM-#{vm.gsub(" ","-")}/
			end
		rescue EOFError
			f.close
		end
		if pid then
			
		else
			puts "Its Okay, Couldn't find the vm \"#{vm}\""
		end
	end
end
