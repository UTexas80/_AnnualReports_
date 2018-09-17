# Example preprocessing script.
# change column names

# p_grad_res<-plot_ly(grad_res, x = ~Description, y = ~ay1617)
# plotly_data(p_grad_res)

# browsable(tagList(c_pie_grad_res, c_pie_grad_non))
rmarkdown::render("AnnualReportsWord.rmd", "word_document")