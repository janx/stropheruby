require 'mkmf'
have_library("expat")
have_library("resolv")
$CFLAGS = "#{ENV['CFLAGS']} -Wall -O3 -g -fPIC"
if CONFIG["MAJOR"].to_i >= 1 && CONFIG["MINOR"].to_i >= 8
  $CFLAGS << " -DHAVE_DEFINE_ALLOC_FUNCTION"
end
create_makefile('strophe_ruby')
