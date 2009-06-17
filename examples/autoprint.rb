$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'prawn/core'
require 'prawn/js'

# A simple example that demonstrates having a PDF document automatically
# print itself when it's opened.
#
# For more detail on the options available when printing without
# user interaction, see chapter 5 of "Developing Acrobat Applications Using
# Javascript", available on the Adobe Javascript page.
#
Prawn::Document.generate "autoprint.pdf" do
  # Build the script we want to execute when the document opens
  script = <<-EOF
    var pp = this.getPrintParams();
    pp.interactive = pp.constants.interactionLevel.silent;
    this.print(pp);
  EOF

  # embed our script. The label is arbitary and can be anything
  add_docopen_js("somelabel", script)

  # finally add some real content to the page so something gets printed.
  text "Javascript Prototype", :at => [150,720], :size => 32

end
