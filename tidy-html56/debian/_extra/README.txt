Tidy documentation can be found in the tidy manpage.

More documentation can be found at the following links:
* Tidy - http://www.html-tidy.org/documentation/
* Accessibility - http://www.html-tidy.org/accessibility/
* Source code: https://github.com/htacg/tidy-html5

Config file is /etc/tidy.conf or ~/.tidyrc

This is simplified packaging, where all files are installed in /opt/tidy56 and there is only one
package "tidy-html56". This contains binary and libraries (both runtime and development).
The idea is, that the package can be easily installed on all supported Ubuntu version
without conflict with possibly present system default tidy.

--
Robert Spiegel
