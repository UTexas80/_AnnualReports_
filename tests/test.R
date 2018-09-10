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
  layout(title = 'Resident Graduate COA ',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

# change column names
colnames(grad_res)[2] <- "ay1617"

colnames(grad_res)[2] <- paste("ay", colnames(grad_res[,c(2)]), sep = "")


aes_string(y=names(grad_res)[2])