cd ext/libstrophe-0.7.3
scons
cp -f *.a ../strophe_ruby
cd ../../
rake clean
rake compile
rake gem

OS=`uname -s`

if [ "${OS}" = "Linux" ] ; then
  sudo gem install pkg/strophe_ruby-0.0.5.gem
else
  gem install pkg/strophe_ruby-0.0.5.gem
fi

