## Startup functions and global constants
###############################################################################

kCertBundle <- "certificateBundle/cacert.pem"

.onLoad <- function(libname, pkgname){
  
  ## SET ESPN CACHE AND START OPTIONS
  .setXmlstatsCache("opts", list())
  .setXmlstatsCache("xmlstatsEndpoint", "https://erikberg.com/")
  .setXmlstatsCache("httpheader", character())
  .setXmlstatsCache("User-Agent", .userAgent())
  .setXmlstatsCache("low.speed.time", 60)
  .setXmlstatsCache("low.speed.limit", 1)
  .setXmlstatsCache("connecttimeout", 300)
  .setXmlstatsCache("followlocation", TRUE)
  .setXmlstatsCache("verbose", FALSE)
  .setXmlstatsCache("cainfo", file.path(libname, pkgname, kCertBundle))
}

.userAgent <- function(){
  return(paste("xmlstats/", utils::packageDescription("xmlstats", fields="Version"), sep=""))
#   return(paste("xmlstatsApi/", utils::packageDescription("xmlstatsApi", fields="Version"), "(http://www.github.com/brian-bot/xmlstats)", sep=""))
}
