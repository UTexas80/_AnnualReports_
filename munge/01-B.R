# Create a word document to contain R outputs
doc <- docx()
# Add a title to the document
doc <- addTitle(doc, "Simple Word document", level=1)
# Add a paragraph of text into the Word document 
doc <- addParagraph(doc, "This simple Word document is created using R software and ReporteRs package. It contains just a simple text.")
# Add a sub title
doc <- addTitle(doc, "What is R language?", level = 2) 
doc <- addParagraph(doc, "R is a language and environment for statistical computing and graphics. R provides a wide variety of statistical and graphical techniques, and is highly extensible.")
doc <- addTitle(doc, "What is ReporteRs", level = 2)
doc <- addParagraph(doc, "ReporteRs is a package to write and format easily a Word document from R software.")

doc <- addFlexTable( doc, FlexTable(pdf.tbl))
# doc <- addFlexTable( doc, FlexTable(xxx))
#doc <- print(datatable(pdf.tbl) %>% formatCurrency(2:11, digits = 0))

pdf.tbl[is.na(pdf.tbl)] <- ""
pdf.tbl[, c(2:11)] <-lapply(pdf.tbl[, c(2:11)], function(y) as.numeric(gsub('[^a-zA-Z0-9.]', '', y)))   
ft <- regulartable(pdf.tbl)
# format function:
# fun_ <- function(x) paste0("$", formatC(x, format="f", big.mark=",", digits = 0) )

fun_ <- function(x) {
  out <- paste0("$", formatC(x, format="f", big.mark=",", digits = 0) )
  ifelse(is.na(x), "", out)
}
# columns to be formatted:
colnames_ <- Filter(is.numeric, pdf.tbl) %>% names()

# prepare args for `set_formatter` call
sf_args <- rep(c(fun_), length(colnames_)) %>% 
  setNames(colnames_)
sf_args$x <- ft

# call exec
ft <- do.call(set_formatter, sf_args) 

autofit(ft) %>% print()

doc %>% 
  addFlexTable( pdf.tbl %>% 
                  FlexTable( header.cell.props = cellProperties( background.color =  "#003366" ),
                             header.text.props = textBold( color = "white" )) %>%
                  setZebraStyle( odd = "#DDDDDD", even = "#FFFFFF" ))

# Write the Word document to a file 
writeDoc(doc, file = "r-reporters-simple-word-document.docx")