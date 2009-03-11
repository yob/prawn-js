$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'prawn'
require 'prawn/js'

Prawn::Document.generate "js_doc_close.pdf" do

  add_docclose_js("alert", "app.alert('closing',3)")

  text "Javascript Prototype", :at => [150,720], :size => 32

end
