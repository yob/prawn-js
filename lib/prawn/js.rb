
module Prawn
  module JS
    # The maximum number of children to fit into a single node in the JavaScript tree.
    NAME_TREE_CHILDREN_LIMIT = 20 #:nodoc:

    def add_document_js(name, script)
      obj = ref(:S => :JavaScript, :JS => script)
      javascript.data.add(name, obj)
    end

    def javascript
      names.data[:JavaScript] ||= ref(Prawn::NameTree::Node.new(self, NAME_TREE_CHILDREN_LIMIT))
    end

  end
end

require 'prawn/document'
Prawn::Document.send(:include, Prawn::JS)
