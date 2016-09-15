## FUNCTION THAT WILL CHECK ALL CALLS FOR FAILURES AND CONVERT JSON RESPONSES
#####

.getXmlstatsJSON <- function(url, .opts, httpheader, ...){
  
  tryGetURL <- getURL(url, .opts=.opts, .encoding='UTF-8', encoding='gzip',
                      httpheader=httpheader, ...)
  tryGetURL <- fromJSON(tryGetURL)
  
  return(tryGetURL)
}
