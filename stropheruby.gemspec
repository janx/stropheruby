
Gem::Specification.new do |s|
  s.name = %q{stropheruby}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fran\303\247ois Lamontagne"]
  s.date = %q{2009-03-06}
  s.email = ["flamontagne@gmail.com"]
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "ext/md5.c", "ext/parser.c", "ext/util.c", "ext/strophe_ruby.c", "ext/conn.c", "ext/ctx.c", "ext/jid.c", "ext/handler.c", "ext/hash.c", "ext/sasl.c", "ext/event.c", "ext/auth.c", "ext/thread.c", "ext/stanza.c", "ext/tls_dummy.c", "ext/sha1.c", "ext/snprintf.c", "ext/sock.c", "ext/tls.h", "ext/sasl.h", "ext/thread.h", "ext/util.h", "ext/common.h", "ext/md5.h", "ext/hash.h", "ext/sha1.h", "ext/sock.h", "ext/strophe.h", "ext/ostypes.h", "lib/strophe_ruby.rb", "test/test_helper.rb", "test/test_strophe_ruby.rb", "test/test_strophe_ruby_extn.rb", "ext/extconf.rb", "examples/xmpp_client.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{strophe_ruby}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{strophe_ruby}
  s.test_files = ["test/test_strophe_ruby_extn.rb", "test/test_strophe_ruby.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.3"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.3"])
  end
end
