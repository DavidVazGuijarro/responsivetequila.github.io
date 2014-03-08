require 'rubygems'

task :default => [:build]

task :build do
  sh 'jekyll build'
end

task :deploy do
  Dir.chdir "_site"
  system "pwd"
  system "ls"
  system "git init"
  deploy_branch = 'master'
  system "git remote set-url --push origin #{repo}"
  system "git remote set-branches --add origin #{deploy_branch}"
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
  system "git branch #{deploy_branch} origin/#{deploy_branch}"
  system "git add ."
  system 'git commit -am "Deploy"' 
  system "git push origin master --force"
  File.delete '.git/credentials'
=begin
  
  
  system 'git fetch -q'
  system "git config user.name '#{ENV['GIT_NAME']}'"
  system "git config user.email '#{ENV['GIT_EMAIL']}'"
  system 'git config credential.helper "store --file=.git/credentials"'
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
  system "git branch #{deploy_branch} origin/#{deploy_branch}"
  system "git add ."
  system 'git commit -am "Deploy"' 
  system "git push origin master --force"
  File.delete '.git/credentials'
=end
end