#' Write csv files with indicated commands to the external system
#'
#' @description Function is capable to read the data and  writing multiple files e.g. 'SystemControl8139124.csv'
#'
#' @param x - dataframe object with resulting command e.g. 1 - enable; 0 - disable
#' @param path_terminal - path to the terminal
#' @param fileName - desired control file prefix e.g. 'SystemControl'
#'
#' @return Function is writing multiple files e.g. 'SystemControl8139124.csv' to the Sandbox
#'
#' typical content of the file:
#' "Magic","IsEnabled"
#' 8139124,1
#'
#' @export
#'
#' @author (C) 2019 Vladimir Zhbanko
#'
#' @examples
#'
#'
#'
#' library(dplyr)
#' library(readr)
#' library(lubridate)
#' DFT1 <- import_data(trade_log_file = system.file("extdata",
#'                                                  "OrdersResultsT1.csv",
#'                                                  package = "lazytrade"),
#'                     demo_mode = TRUE)
#'
#' dir <- normalizePath(tempdir(),winslash = "/")
#' DFT1 %>%
#' group_by(MagicNumber) %>% select(MagicNumber) %>% mutate(IsEnabled = 0) %>%
#' # write commands to disable systems
#' writeCommandViaCSV(path_terminal = file.path(dir))
#'
#'
#'
writeCommandViaCSV <- function(x, path_terminal = "", fileName = "SystemControl"){
  .Deprecated("write_command_via_csv",msg = "using new function naming conventions")
  # check if the provided object 'x' exists and that it's not empty
  if(exists("x") == TRUE && nrow(x) != 0) {
    # for loop to go through the object x
    for(i in 1:nrow(x))
    {
      # write the file for MQL4 usage
      composed_name <- paste0(fileName, as.character(x[i, 1]), ".csv")
      f_name <- file.path(path_terminal, composed_name)
      write.csv(x[i, ], file = f_name, row.names = FALSE)
    }
  }
}
