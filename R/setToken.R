## AUTHOR: BRIAN M. BOT
#####

setToken <- function(token){
  stopifnot( length(token)==1L & is.character(token))
  
  ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
  .setXmlstatsCache("Authorization", paste("Bearer", token))
  
  message("xmlstats API key successfully stored - will be used for all subsequent calls to the xmlstats API")
  return(invisible(NULL))
}

