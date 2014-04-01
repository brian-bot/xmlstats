getMlbDate <- function(d){
  class(d) <- "Date"
  cat("##", as.character(d), "##\n")
  
  ## POOR MANS CHECK TO ENSURE API RATE LIMIT NOT EXCEDED
  system("sleep 10")
  daysEvents <- xmlstatsRestGET(paste("/events.json?date=", as.character(d), "&sport=mlb", sep=""))
  
  ## CHECK TO SEE IF THERE ARE ANY GAMES ON THIS DAY
  ne <- length(daysEvents$event)
  if( ne == 0 ){
    return(cat("No games today:", as.character(d), "\n"))
  }
  
  ## BUILD UP A LIST OF BATTERS AND PITCHERS FOR EACH DAY
  allData <- list()
  ## CYCLE THROUGH EACH GAME FOR THIS DAY
  for( i in 1:ne ){
    event <- daysEvents$event[[i]]
    
    ## GRAB THE BOXSCORE IF GAME IS COMPLETED
    if( event$event_status == "completed" ){
      ## POOR MANS CHECK TO ENSURE API RATE LIMIT NOT EXCEDED
      system("sleep 10")
      allData[[i]] <- getMlbEvent(event$event_id)
    } else{
      ## IF THE GAME IS NOT COMPLETED - JUST PRINT A MESSAGE
      cat("Event", event$event_id, "was not complete:", event$event_status, "\n")
    }
  }
  ## COMBINE MATRICES FOR EACH DAYS BATTERS AND PITCHERS
  allBatters <- do.call(rbind, lapply(allData, "[[", "batters"))
  allPitchers <- do.call(rbind, lapply(allData, "[[", "pitchers"))
  
  return(list(batters=allBatters, pitchers=allPitchers))
}
