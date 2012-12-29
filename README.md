# Fixbraces

Make sure that the opening brace for an Objective-C code block is on the same
line.

Xcode is inconsistent about the placement of braces for code that it inserts for
us. Sometimes it puts the opening braces on the same line, sometimes it puts it
on the next line. I prefer it to be on the opening line.

## Installation

### From Rubygems

    $ gem install fixbraces

### From source

Clone the repository and then build and install it:

    rake install

## Usage

Once it is installed, you can run it from the command line. Either pass it the
current directory ('.') or a path to a directory that contains source
file. Alternatively, pass it a list of files.

You can pass it a directory:

    fixbraces aDirectory

or even use '.' for the current directory:

    fixbraces .

Apply it ot a single file:

    fixbraces aDirectory/SourceFile.m

or a number of files:

    fixbraces aDirectory/*.m

Run `fixbraces --help` for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Standard MIT license. Knock yourself out.
