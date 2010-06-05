namespace :vms do
	desc "Lists all Virtual Machines"
	task :list do
		VirtualMachine.all.map { |vm| puts vm } 
	end

	desc "Lists active Virtual Machines"
	task :active do
		VirtualMachine.on.map { |vm| puts vm }
	end

	desc "List In-Active Virtual Machines"
	task :inactive do
		VirtualMachine.off.map { |vm| puts vm }
	end
end
