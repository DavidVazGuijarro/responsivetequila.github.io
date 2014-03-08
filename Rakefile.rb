require 'rubygems'

task :default => [:build]

task :build do
  sh 'jekyll build'
end

task :deploy do
  system "cd _site"
  system "ls"
  repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:')
  system "echo #{repo}"
  deploy_branch = 'master'
  if repo.match(/github\.com\.git$/)
    deploy_branch = 'master'
  end
  system "git remote set-url --push origin #{repo}"
  system "git remote set-branches --add origin #{deploy_branch}"
  system 'git fetch -q'
  system "git config user.name '#{ENV['GIT_NAME']}'"
  system "git config user.email '#{ENV['GIT_EMAIL']}'"
  system 'git config credential.helper "store --file=.git/credentials"'
  system "echo #{ENV['GIT_NAME']}"
  system "#{ENV['GIT_EMAIL']}"
  system "#{ENV['GH_TOKEN']}"
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
  system "git branch #{deploy_branch} origin/#{deploy_branch}"
  system "git add ."
  system 'git commit -am "Deploy"' 
  system "git push origin master --force"
  File.delete '.git/credentials'
end