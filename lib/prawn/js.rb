
module Prawn
  module JS
    # The maximum number of children to fit into a single node in the JavaScript tree.
    NAME_TREE_CHILDREN_LIMIT = 20 #:nodoc:

    # add a javascript fragment that will execute when the document is opened.
    #
    # There can only be as many fragments as required. Calling this function
    # multiple times will append the new fragment to the list.
    #
    def add_docopen_js(name, script)
      obj = ref(:S => :JavaScript, :JS => script)
      javascript.data.add(name, obj)
    end

    # add a javascript fragment that will execute when the document is closed.
    #
    # There can only be a single fragment. Calling this function multiple times
    # will override earlier fragments.
    #
    def add_docclose_js(name, script)
      aa[:WC] = ref(:S => :JavaScript, :JS => script)
    end

    private

    def aa
      @root.data[:AA] ||= {}
    end

    def javascript
      names.data[:JavaScript] ||= ref(Prawn::NameTree::Node.new(self, NAME_TREE_CHILDREN_LIMIT))
    end

  end
end

require 'prawn/document'
Prawn::Document.send(:include, Prawn::JS)
