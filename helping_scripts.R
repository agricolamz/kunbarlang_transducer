library(tidyverse)
library(tidytext)

# get alphabet ------------------------------------------------------------
read_tsv("tests.csv") %>% 
  select(form) %>% 
  unnest_tokens(output = "symbols", input = form, token = "characters") %>% 
  pull() %>% 
  unique() %>% 
  tolower() %>% 
  sort() ->
  symbols

c("Alphabet",
  str_c(c(" ", toupper(symbols)), collapse = " "),
  str_c(c(" ", symbols), collapse = " "),
  read_lines("wlg.twol", skip = 3)) %>% 
  write_lines("wlg.twol")

