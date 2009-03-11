$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'prawn'
require 'prawn/js'

Prawn::Document.generate "js.pdf" do

  add_document_js("alert", "app.alert('boo!',3)")

  text "Javascript Prototype", :at => [150,720], :size => 32

end
