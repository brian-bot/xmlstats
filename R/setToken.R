## AUTHOR: BRIAN M. BOT
#####

setToken <- function(token){
  stopifnot( length(token)==1L & is.character(token))
  
  ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
  header <- .getXmlstatsCache("httpheader")
  header[["Authorization"]] <- paste("Bearer", token)
  getUser <- xmlstatsRestGET("/me.json", httpheader=header)
  if( "error" %in% names(getUser) ){
    stop("token not recognized by xmlstats - check the token or generate a new personal access token")
  }

  .setXmlstatsCache("Authorization", paste("Bearer", token))
  
  message(sprintf("xmlstats API key successfully stored for %s %s", getUser$first_name, getUser$last_name))
  return(invisible(NULL))
}

