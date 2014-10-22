# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reproxy/version'

Gem::Specification.new do |spec|
  spec.name          = "reproxy"
  spec.version       = Reproxy::VERSION
  spec.authors       = ["Chris Dawson"]
  spec.email         = ["cdawson@ebay.com"]
  spec.summary       = %q{reproxy: easy replayable proxy for mobile development }
  spec.description   = <<"END"

INTRODUCTION:
reproxy wraps the excellent mitmproxy/mitmdump to provide a proxy with easy replay support and easy rewriting of requests.

You can also get it as a docker image to make things even simpler

EXAMPLES:

$ # record a session for bug # 11345
reproxy --record --name xrd/11345  
$ # replay a session (the proxy will replay all requests identically)
$ reproxy --replay --name xrd/11345  
$ # replay a session from the modifications at 
$ reproxy --replay --name xrd/11345 --revision 
  
END
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
