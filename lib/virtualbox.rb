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
end
