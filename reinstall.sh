cd ext/libstrophe-0.7.3
scons
cp -f *.a ../
cd ../../strophe_ruby
rake clean
rake compile
rake gem
sudo gem install pkg/strophe_ruby-0.0.5.gem