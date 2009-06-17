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

Prawn-JS depends on the core prawn library, and simply adds a few additional
methods to the standard Prawn::Document object that allow your Javascript to be
associated with certain events.

Start by requiring the prawn library, then the prawn-js library. Build your PDF as usual,
and use methods like add_docopen_js to register your code fragments.

    require 'prawn/core'
    require 'prawn/js'

    Prawn::Document.generate "js_doc_open.pdf" do |pdf|
      pdf.add_docopen_js("alert", "app.alert('open!',3)")
      pdf.text "Javascript Prototype", :at => [150,720], :size => 32
    end

For further examples and documentation, check out the examples/ directory of this project
and the code docs for the Prawn::JS module.

For general information on the syntax of JavaScript, I highly recommend
"JavaScript: The Good Parts" by Douglas Crockford, ISBN: 9780596517748.

For specific information on Adobe's extensions to JavaScript, in particular the
objects they provide for interacting with your document and the application
(somewhat similar to the DOM provided to Javascript in web browsers) read the
documents available on Adobe's JavaScript site (see links below). Look for
"JavaScript for Acrobat API Reference" and "Developing Acrobat Applications
Using JavaScript".

## Disclaimer

I haven't yet found a situation where I've wanted to embed JS in my documents.
Most viewers ignore it and few users demand it.

This extension was more or less thrown together as a proof of concept. I'm
happy to review any patches that are submitted, but I not planning to actively
develop it. I'm releasing it because the code was getting lonely sitting on my
laptop. if there's one thing I hate it's lonely code.

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
