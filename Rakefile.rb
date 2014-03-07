=begin
task :default => [:test]

task :test do
  
end
=end

task :default => [:build]

task :build do
  sh 'jekyll build'
end