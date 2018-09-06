# Example preprocessing script.
h <- read_html("https://tinyurl.com/ybjbdpp3")
reps <- h %>%
    html_node("#mw-content-text > div > table:nth-child(18)") %>%
    html_table()
reps <- reps[,c(1:2,4:9)] %>% as_tibble()