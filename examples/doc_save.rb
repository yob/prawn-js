$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'prawn/core'
require 'prawn/js'

Prawn::Document.generate "js_doc_save.pdf" do |pdf|

  pdf.add_will_save_js("alert", "app.alert('saving',3)")

  pdf.text "Javascript Prototype", :at => [150,720], :size => 32

end
