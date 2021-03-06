library(RCurl)
library(XML)
library(stringr)
library(pylr)
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"
links <- getHTMLLinks(url)
filenames <- links[str_detect(links, "JCMB_2015")]
filenames_list <- as.list(filenames)
downloadcsv <- function (mainurl,filename){
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}
l_ply(filenames,downloadcsv,mainurl="http://www.geos.ed.ac.uk/~weather/jcmb_ws/")
