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

You can also get it as a docker image to make things even simpler.

OVERVIEW:

reproxy runs mitmdump with a special set of scripts. It will record all traffic for a proxy session. The neat 
thing is that you can then "replay" that session and have an instantly reproducible example of all network 
traffic. You can prove to people your code talking to the API or service worked!

And, once you have a set of replay files, you can edit them (the body of each request is stored as you would expect, 
either JSON or XML). Edit them in your favorite editor and then "replay" the proxy request with your modified client
code to validate that the suggestions made by the API team are correct. 

All of this is logged into a git repository for you. Share the repository between devs and QA to provide
fully reproducible test cases. QAs no longer have to provide reproduction steps because the steps are stored
for you inside the reproduction files inside the git repository.

If you are using GitHub (or Enterprise GitHub) reproxy will even generate a real API document for you inside of your
associated wiki. This is a "what is so" version of the API, not the typical "what we'll do in three months" or "what we 
thought we would do three weeks ago and you are still waiting on" version of an API document.

Also, reproxy will generate a script with curl commands to run against your API server. You can verify the new steps work 
with a single script and tell the API team: "Sorry, your API changes are not yet there, despite the email saying they are."
Save valuable time for your QA and developers who keep testing partially implemented services. 

EXAMPLES:

$ # record a session for bug # 11345 under my username "xrd"
reproxy --record --name xrd/11345  

$ # replay a session (the proxy will replay all requests identically)
$ reproxy --replay --name xrd/11345  

$ # replay a session from the modifications at 90dd259892009fff139a7d 
$ reproxy --replay --name xrd/11345 --revision 90dd259892009fff139a7d

# Use git to show that revision, notice the SHA hash is identical to the revision above
$ git show 90dd259892009fff139a7d:xrd/11345/corp.loginserver.com/v13/login/doIt.jsp

# Open the latest replay file for that JSON login request in your $EDITOR
$ reproxy --edit xrd/11345/corp.loginserver.com/v13/login/doIt.jsp

$ # replay a session from the last modifications 
$ reproxy --replay --name xrd/11345 --revision last

# Now that someone has fixed a bug in the remote API, hit the API and verify things
# are what you expect
$ reproxy --verify --name xrd/11345
  
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
