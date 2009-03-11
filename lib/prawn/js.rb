# encoding: utf-8


module Prawn
  module JS
    # The maximum number of children to fit into a single node in the JavaScript tree.
    NAME_TREE_CHILDREN_LIMIT = 20 #:nodoc:

    # add a Javascript fragment that will execute after the document is saved.
    #
    # There can only be a single fragment. Calling this function multiple times
    # will override earlier fragments.
    #
    def add_did_save_js(name, script)
      aa[:DS] = ref(:S => :JavaScript, :JS => script)
    end

    # add a Javascript fragment that will execute after the document is printed.
    #
    # There can only be a single fragment. Calling this function multiple times
    # will override earlier fragments.
    #
    def add_did_print_js(name, script)
      aa[:DP] = ref(:S => :JavaScript, :JS => script)
    end

    # add a Javascript fragment that will execute when the document is opened.
    #
    # There can only be as many fragments as required. Calling this function
    # multiple times will append the new fragment to the list.
    #
    def add_docopen_js(name, script)
      obj = ref(:S => :JavaScript, :JS => script)
      javascript.data.add(name, obj)
    end

    # add a Javascript fragment that will execute when the document is closed.
    #
    # There can only be a single fragment. Calling this function multiple times
    # will override earlier fragments.
    #
    def add_will_close_js(name, script)
      aa[:WC] = ref(:S => :JavaScript, :JS => script)
    end

    # add a Javascript fragment that will execute before the document is printed.
    #
    # There can only be a single fragment. Calling this function multiple times
    # will override earlier fragments.
    #
    def add_will_print_js(name, script)
      aa[:WP] = ref(:S => :JavaScript, :JS => script)
    end

    # add a Javascript fragment that will execute before the document is saved.
    #
    # There can only be a single fragment. Calling this function multiple times
    # will override earlier fragments.
    #
    def add_will_save_js(name, script)
      aa[:WS] = ref(:S => :JavaScript, :JS => script)
    end

    private

    # create or access the Additional Actions dictionary in the document catalogue.
    # See section 8.5.2 and table 8.47 of the PDF spec
    #
    def aa
      # TODO: this entry is only valid in the document catalogue in PDF versions 1.4+.
      #       We need to ensure the version is set appropriately
      @root.data[:AA] ||= {}
    end

    # create or access the Javascript Name Tree in the document names dict.
    # See section 3.6.3 and table 3.28 in the PDF spec.
    #
    def javascript
      names.data[:JavaScript] ||= ref(Prawn::NameTree::Node.new(self, NAME_TREE_CHILDREN_LIMIT))
    end

  end
end

require 'prawn/document'
Prawn::Document.send(:include, Prawn::JS)
