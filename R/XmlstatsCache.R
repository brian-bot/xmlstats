## CREATE AND MANAGE A GLOBAL CACHE FOR THE CLIENT TO ACCESS
#####
## AUTHOR: BRIAN M. BOT
#####

.setXmlstatsCache <- function(key, value){
  cache <- new("XmlstatsCache")
  cache@env[[key]] <- value
  
  ## IF ONE OF THESE PARAMS THEN ADD TO opts
  validOpts <- c("low.speed.time", "low.speed.limit", "connecttimeout", "followlocation", "verbose")
  if(key %in% validOpts){
    opts <- .getXmlstatsCache("opts")
    opts[[key]] <- value
    .setXmlstatsCache("opts", opts)
  }
  
  ## IF ONE OF THESE PARAMS THEN ADD TO httpheader
  validHeaders <- c("Authorization", "User-Agent", "Accept")
  if(key %in% validHeaders){
    httpheader <- .getXmlstatsCache("httpheader")
    httpheader[[key]] <- value
    .setXmlstatsCache("httpheader", httpheader)
  }
  
  return(NULL)
}

.inXmlstatsCache <- function(key){
  cache <- new("XmlstatsCache")
  return(key %in% ls(cache@env))
}

.getXmlstatsCache <- function(key){
  if( !.inXmlstatsCache(key) ){
    return(NULL)
  } else{
    cache <- new("XmlstatsCache")
    return(cache@env[[key]])
  }
}

