Tidy documentation can be found at the following links:
* Tidy -
* Accessibility - http://www.html-tidy.org/accessibility/
* Source code: https://github.com/htacg/tidy-html5

Config file is /etc/tidy.conf or ~/.tidyrc

This is simplified packaging, where all files are installed in /usr/lib/nixnote2 and there is only one
package "nixnote2-tidy". This contains binary and libraries (both runtime and development).
The idea is, that the package can be easily installed on all supported Ubuntu versions
without risking conflict with possibly present system default tidy.

--
Robert Spiegel
