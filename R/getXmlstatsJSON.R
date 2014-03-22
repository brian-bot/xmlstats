## FUNCTION THAT WILL CHECK ALL CALLS FOR FAILURES AND CONVERT JSON RESPONSES
#####

.getXmlstatsJSON <- function(url, .opts, httpheader, ...){
  
  tryGetURL <- getURL(url, .opts=.opts,
                      httpheader=httpheader, ...)
  tryGetURL <- fromJSON(tryGetURL)
#   if(is.character(tryGetURL)){
#     if(tryGetURL["message"] == "Not Found")
#       stop("espn api could not find specified URI", call.=F)
#   }
  
  return(tryGetURL)
}
