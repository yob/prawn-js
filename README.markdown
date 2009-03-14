# prawn-js

## Overview

This extension to the Prawn PDF generation library adds support for embedding javascript
in your files. These Javascript fragments will be compiled and executed on supported
viewers (like Adobe Acrobat Reader), usually in response to particular events (like the
document opening, closing, etc).

The Javascript syntax supported is fairly standard, although it includes a few extensions
defined by Adobe. For more information on these extensions (and the capabilities of
Javascript and PDF in general) visit Adobe's reference site, linked in the further reading
section of this readme.

## Installation

    gem install prawn-js

## Usage

Prawn-JS depends on core prawn library, and simply adds a few additional methods to the
standard Prawn::Document object that allow your Javascript to be associated with certain
events.

Start by requiring the prawn library, then the prawn-js library. Build your PDF as usual,
and use methods lke add_docopen_js to register your code fragments.

    require 'prawn'
    require 'prawn/js'

    Prawn::Document.generate "js_doc_open.pdf" do
      add_docopen_js("alert", "app.alert('open!',3)")
      text "Javascript Prototype", :at => [150,720], :size => 32
    end

For further examples and documentation, check out the examples/ directory of this project
and the code docs for the Prawn::JS module.

## Licensing

This library is distributed under the terms of the MIT License. See the included file for
more detail.

## Contributing

All suggestions and patches welcome, preferably via a git repository I can pull from.

## Further Reading

- The source: [http://github.com/yob/prawn-js/tree/master](http://github.com/yob/prawn-js/tree/master)
- Prawn source: [http://github.com/sandal/prawn/tree/master](http://github.com/sandal/prawn/tree/master)
- Rubyforge: [http://rubyforge.org/projects/prawn](http://rubyforge.org/projects/prawn)
- Adobe Javascript Site: [http://www.adobe.com/devnet/acrobat/javascript.html](http://www.adobe.com/devnet/acrobat/javascript.html)
