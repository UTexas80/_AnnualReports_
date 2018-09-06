# Example preprocessing script.
url <- 'https://tinyurl.com/ybjbdpp3'                                           #Specifying the url for desired website to be scrapped
webpage <- read_html(url)                                                       #Reading the HTML code from the website
rank_data_html <- html_nodes(webpage,'.tableauViz')                             #Using CSS selectors to scrap the rankings section

# Load Tabula functions
library(tabulizer)
library(tabulizerjars)

pdf.file <- "~/AnnualReports/data/02UndergraduateCostOfAttendance.pdf"          # Define path to PDF file
pdf.dat <- extract_tables(pdf.file)                                             # Extract data table
# Coerce output matrix to data.frame
# pdf.tbl <- data.frame(pdf.dat[[1]][-1, ])
pdf.tbl <- data.table(pdf.dat[[1]][-1, ])                                       # Coerce output matrix to data.table
names(pdf.tbl) <- pdf.dat[[1]][1, ]
pie(table(pdf.tbl[2:5,11]))                                                     # create pie chart
head(pdf.tbl)                                                                   # Display first 5 rows of data


##    mpg  cyl disp  hp  drat wt    qsec  vs am gear carb
## 1  21.0 6   160.0 110 3.90 2.620 16.46  0  1   4   4
## 2  21.0 6   160.0 110 3.90 2.875 17.02  0  1   4   4
## 3  22.8 4   108.0  93 3.85 2.320 18.61  1  1   4   1
## 4  21.4 6   258.0 110 3.08 3.215 19.44  1 0    3   1
## 5  18.7 8   360.0 175 3.15 3.440 17.02  0 0    3   2


# pdf.dat[[1]][,1]
# pdf.dat[[1]][,11]
# pdf.dat[[1]][1,11]
# pdf.dat[[1]][3,11]
# pdf.dat[[1]][4,11]
# pdf.dat[[1]][1:7,11]

# t<-data.table(pdf.dat[[1]])
# names(t)<-as.character(t[1,])
# t<-t[-1,]