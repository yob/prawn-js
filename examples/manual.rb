require 'rubygems'
require 'prawn/core'

# This is how you can add some JS to your PDF files using only prawn-core.
# Kids, don't try this at home.

NAME_TREE_CHILDREN_LIMIT = 20

Prawn::Document.generate "autoprint.pdf" do |pdf|
  # Build the script we want to execute when the document opens
  script = <<-EOF
    var pp = this.getPrintParams();
    pp.interactive = pp.constants.interactionLevel.silent;
    this.print(pp);
  EOF

  js_root = pdf.ref(Prawn::NameTree::Node.new(self, NAME_TREE_CHILDREN_LIMIT))
  pdf.names.data[:JavaScript] ||= js_root 

  # embed our script. The label is arbitary and can be anything
  obj = pdf.ref(:S => :JavaScript, :JS => script)

  # reference our JS fragment from the root javascript object
  js_root.data.add("some_random_label_that_can_be_anything", obj)

  # finally add some real content to the page so something gets printed.
  pdf.text "Javascript Prototype", :at => [150,720], :size => 32

end
