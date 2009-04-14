require 'rubygems'
require 'hoe'

EXT = "ext/strophe_ruby.#{Hoe::DLEXT}"

Hoe.new('stropheruby', '0.1.0') do |p|
  p.developer('François Lamontagne', 'flamontagne@gmail.com') 
  p.summary = 'strophe_ruby' 

  p.spec_extras[:extensions] = "ext/extconf.rb"
  p.clean_globs << EXT << "ext/*.o" << "ext/Makefile"
end

task :test => EXT

file EXT => ["ext/extconf.rb", "ext/strophe_ruby.c"] do
  Dir.chdir "ext" do
    ruby "extconf.rb"
    sh "make"
  end
end
