namespace :vm do
	desc "Starts a Virtual Machine"
	task :start, :vm do |t, args|
		VirtualMachine.start(args[:vm])
	end
	
	desc "Terminate a Virtual Machine"
	task :terminate, :vm do |t, args|
		puts "This is an absolute last resort, it will have the same effect as pulling the plug, you have 5 seconds to ^C the action"
		sleep 5
		VirtualMachine.terminate(args[:vm])
	end
end
