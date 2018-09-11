# Example Unit Testing Script
context("Example tests")
expect_equal(1, 1)

install.packages("XML")
install.packages("plyr")
install.packages("ggplot2")
install.packages("gridExtra")

require("XML")
require("plyr")
require("ggplot2")
require("gridExtra")

xmlfile=read_xml("rank_data_xml")
class(xmlfile) #"XMLInternalDocument" "XMLAbstractDocument"

devtools::install_github('dantonnoriega/xmltools')
library(xmltools)

x <- GET(my_url))
xml2::read_xml(webpage)
