require 'rubygems'
require 'rake/testtask'

task :default => [:minify_css, :minify_js, :build]

task :build do
  sh 'jekyll build'
end

task :deploy do
  Dir.chdir "_site"
  system "git status"
  system "git add ."
  system 'git commit -am "Deploy From Travis"'
  system 'git push' 
end

task :minify_css do
  Dir.glob("**/*.css").each do |f|
    unless f.end_with? ".min.css" 
      sh "juicer merge #{f} --force"
    end
  end
end

task :minify_js do
  Dir.glob("**/*.js").each do |f|
    unless f.end_with? '.min.js' 
      sh "juicer merge #{f} --force"
    end
  end
end
