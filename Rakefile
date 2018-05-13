task :test do 
	desc 'Run all tests'
  FileList['spec/*_spec.rb'].each{|f| system "ruby #{f}"}
end

desc "All tests"
task 'test'