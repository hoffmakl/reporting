# Examples of Code for Reporting Analyses in Rmarkdown

##Example 1:
Assemble a function which returns Rmarkdown-friendly output including headers for organization. 
Useful if you have multiple outcomes/explanatory variables/data sets that you want to report identical analyses on.

[headerFuns.Rmd](headerFuns.Rmd)'s is RMarkdown code that, when knitted, compiles an html report with headers and subheaders for two identical sample analyses.


##Example 2:
Export your plots (base R, ggplot2, or otherwise) as vector graphics objects, allowing investigators to edit details like colors, titles, fonts, sizes, etc. themselves.

[vg.R](vg.R) shows a simple example of how to use David Gohel's officer and rvg packages to do this. There is also a function that you can use if you have several plots to export.

