# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codeforces/scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "codeforces-scraper"
  spec.version       = Codeforces::Scraper::VERSION
  spec.authors       = ["RDimon2912"]
  spec.email         = ["rdimon2912@gmail.com"]

  spec.summary       = %q{Codeforces scraper, for scraping problems and profiles.}
  spec.description   = %q{Codeforces scraper.}
  spec.homepage      = "https://github.com/rockettron/codeforces-scraper"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " 
      "public gem pushes."
  end

  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
