% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/opt_aggregate_results.R
\name{opt_aggregate_results}
\alias{opt_aggregate_results}
\title{Function to aggregate trading results from multiple folders and files}
\usage{
opt_aggregate_results(fold_path)
}
\arguments{
\item{fold_path}{- path to the folder containing subfolders}
}
\value{
Dataframe with trading results
}
\description{
PURPOSE: Read multiple files stored in different folders
Store results to the intermediate dataframe.
}
\details{
user must provide the path to the files in the folders
all files in subfolders are read and aggregated into one data object.
Data object is sorted in descending order by order close time
}
\examples{

 library(lazytrade)
 library(readr)
 library(dplyr)
 library(magrittr)
 library(lubridate)
 DFOLDER <- system.file("extdata/RES", package = "lazytrade")
 #dir <- normalizePath(tempdir(),winslash = "/")
 opt_aggregate_results(fold_path = DFOLDER)


}
