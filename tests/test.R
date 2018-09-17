# Example Unit Testing Script
context("Example tests")
expect_equal(1, 1)

# change certain columns from character to  integer
pdf.tbl[, c(3,6:10,11)] <- sapply(pdf.tbl[, c(3,6:10,11)], as.numeric)
pdf.tbl$`2016-17`<-gsub('[^a-zA-Z0-9.]', '', pdf.tbl$`2016-17`)
pdf.tbl[, c(3,6:10,11)] <-lapply(pdf.tbl[, c(3,6:10,11)], function(y) gsub('[^a-zA-Z0-9.]', '', y))
pdf.tbl[, c(2:11)] <-lapply(pdf.tbl[, c(2:11)], function(y) gsub('[^a-zA-Z0-9.]', '', y))

p <- plot_ly(grad_res, labels = ~Description, values = ~2016-17, type = 'pie') %>%
  layout(title = 'Grad Residents COA',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))


library(plotly)

USPersonalExpenditure <- data.frame("Categorie" = rownames(USPersonalExpenditure), USPersonalExpenditure)
data <- USPersonalExpenditure[, c('Categorie', 'X1960')]

colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

p <- plot_ly(grad_res, labels = ~Description, values = ~ay1617, type = 'pie',
        textposition = 'inside',
        textinfo = 'label+percent',
        insidetextfont = list(color = '#FFFFFF'),
        hoverinfo = 'text',
        text = ~paste('$', ay1617, ' dollars'),
        marker = list(colors = colors,
                      line = list(color = '#FFFFFF', width = 1)),
                      #The 'pull' attribute can also be used to create space between the sectors
        showlegend = FALSE) %>%
  layout(title = str_c(currentAY, '-Resident Graduate COA'),
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

# change column names
colnames(grad_res)[2] <- "ay1617"

colnames(grad_res)[2] <- paste("ay", colnames(grad_res[,c(2)]), sep = "")


aes_string(y=names(grad_res)[2])

pdf.tbl[, c(2:6, 8:12)] <-lapply(pdf.tbl[, c(2:6, 8:12)], function(y) as.numeric(gsub('[^a-zA-Z0-9.]', '', y)))



```{r heading,echo=FALSE, results='asis'}
<!-- cat("#", params$currentYr)-->
<!-- pandoc.header(params$currentYr) -->
```

# setnames(grad_res, "2016-17", "1617")
# setnames(grad_non_res, "2016-17", "1617")


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


# set pander table-layout options
library(pander)
panderOptions('table.alignment.default', function(df)
    ifelse(sapply(df, is.numeric), 'right', 'left'))
panderOptions('table.split.table', Inf)
panderOptions('big.mark', ",")
panderOptions('keep.trailing.zeros', TRUE)