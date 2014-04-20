## xmlstats package
### author: Brian M. Bot

A package to allow users to interact with the [xmlstats api](https://erikberg.com/api) as developed by Erik Berg. Users must get a token from xmlstats to use most of their services.

#### How to install the package:
```r
require(devtools)
install_github("brian-bot/xmlstats")
```

#### How to set retrieved token for use with API calls:
```r
setToken("myTokenString1234")
```

This can be set as a hook in your (private) .Rprofile
```r
setHook(
  packageEvent("xmlstats", "attach"),
  function(...){
    setToken("myTokenString1234")
  }
)
```

#### Get all MLB stats for a given date
```r
theseEvents <- getMlbDate(as.Date("2014-03-22"))
```

#### REST level interface with the API
To make any call to the API:
```r
mlbTeams <- xmlstatsRestGET('/mlb/teams.json')
```
