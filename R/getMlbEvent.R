getMlbEvent <- function(eventId){
  boxscore <- xmlstatsRestGET(paste("mlb/boxscore/", eventId, ".json", sep=""))
  cat("  retrieved game:", eventId, "\n")
  
  ## BATTERS
  hb <- t(sapply(boxscore$home_batters, unlist))
  ab <- t(sapply(boxscore$away_batters, unlist))
  allBatters <- rbind(hb, ab)
  
  ## PITCHERS
  hp <- t(sapply(boxscore$home_pitchers, unlist))
  ap <- t(sapply(boxscore$away_pitchers, unlist))
  allPitchers <- rbind(hp, ap)
  
  return(list(batters=allBatters, pitchers=allPitchers))
}