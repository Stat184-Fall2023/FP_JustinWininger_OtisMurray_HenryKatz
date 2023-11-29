library(ggplot2)
library(knitr)
library(janitor)

diamondTable <- diamonds %>%
  tabyl(color, cut) %>%
  adorn_totals(where = c("row", "col")) %>%
  adorn_percentages(denominator = 'all') %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_title(
    placement = 'combined',
    row_name = 'Color',
    col_name = 'Cut'
  )

# diamondFreqTab %>%
#   kable(
#     caption = "Cut and Color of Diamonds",
#     booktabs = TRUE,
#     aling = c('l', rep('c', 6))
#   )
# 
# diamondModel <- lm(formula = price ~ carat, data = diamonds)
# summary(diamondModel)

data("diamonds", package = 'ggplot2')
diamondModel <- lm(formula = price ~ carat, data = diamonds)
diamondModOut <- summary(diamondModel)
str(diamondModOut)

diamondModOut$coefficients %>%
  kable() %>%
  kableExtra::kable_classic()
