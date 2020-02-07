## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(lodi)

data("toy_data")

head(toy_data, n = 10)

## -----------------------------------------------------------------------------
clmi.out <- clmi(formula = log(poll) ~ case_cntrl + smoking + gender,
                   df = toy_data, lod = lod, seed = 12345, n.imps = 5)

## ---- eval=FALSE--------------------------------------------------------------
#  extract.imputed.dfs <- clmi.out$imputed.dfs

## -----------------------------------------------------------------------------
results <- pool.clmi(formula = case_cntrl ~ poll_transform_imputed + smoking +
                                 gender, clmi.out = clmi.out, type = logistic)

## -----------------------------------------------------------------------------
results$output

## ---- eval=FALSE--------------------------------------------------------------
#  results$regression.summaries

