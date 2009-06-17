# coding: utf-8

Gem::Specification.new do |s|
  s.name = %q{prawn-js}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Healy"]
  s.date = %q{2009-06-18}
  s.description = %q{A small extension to prawn that simplifies embedding JavaScript in your PDF files}
  s.email = %q{pat@freelancing-gods.com}
  s.files = ""
  s.files =  Dir.glob("{examples,lib}/**/**/*") +
                      ["README.markdown","MIT-LICENSE", "CHANGELOG"]
  s.has_rdoc = true
  s.homepage = %q{http://ts.freelancing-gods.com}
  s.rdoc_options = ["--title", "PrawnJS", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{prawn}
  s.summary = %q{A small extension to prawn that makes it possible to embed JavaScript fragment in  your document that respond to events.}
  s.add_dependency('prawn-core', '>=0.5')
end
