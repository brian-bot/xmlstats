## REST API CALLS
#####
## FOCUS ON GET CALLS ONLY FOR NOW - POSSIBLY EXTEND TO POST, PATCH, PUT, AND DELETE IN THE FUTURE
#####

xmlstatsRestGET <- function(uri, endpoint = .getXmlstatsCache("xmlstatsEndpoint"), .opts=.getXmlstatsCache("opts"), httpheader=.getXmlstatsCache("httpheader"), ...){
  uri <- sub(endpoint, "", uri, fixed=T)
  if(substr(uri, 1, 1) == "/"){
    uri <- substr(uri, 2, nchar(uri))
  }
  
  url <- paste(endpoint, uri, sep="")
  .getXmlstatsJSON(url, .opts=.opts, httpheader=httpheader, ...)
}

