# Calculate the percentage of hours worked on a contract in a certain time interval, accounting for vacation and holidays

library(lubridate)
library(tidyverse)

contract_percent <- function(toggl_hours, date_start, date_end, vacation_days){
  weeks_worked <- as.double(difftime(as.Date(date_end), as.Date(date_start), unit="weeks"))
  wcm_holidays <- as.Date(c("2018-09-03", "2018-11-22", "2018-12-25",
    "2018-12-25", "2019-01-01", "2019-01-21", "2019-02-18"))
  num_vacation <- as.Date(vacation_days) %within% interval(date_start, date_end) %>% sum()
  num_holidays <- wcm_holidays %within% interval(date_start, date_end) %>% sum()
  total_hours <- weeks_worked * 35 - num_vacation * 7 - num_holidays * 7
  return(toggl_hours / total_hours)
}

my_vacation_days <- c("2019-12-26", "2019-12-27", "2019-12-28",
                      "2019-04-03","2019-04-04","2019-04-05")

#Examples
contract_percent(150, "2018-08-20", "2018-12-01", my_vacation_days)
contract_percent(100, "2019-02-13", Sys.Date(), my_vacation_days)
