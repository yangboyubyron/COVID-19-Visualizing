mydata <- read.csv("COVIDdata.csv",header=TRUE)
attach(mydata)

library(stringr)

#Canada
canada <- mydata[which(str_detect(mydata$countriesAndTerritories, "Canada")), ]
canadasorted <- canada[order(as.Date(canada$ï..dateRep, format="%Y-%m-%d")),]
canadasorted$new <- cumsum(canadasorted$cases)
canadasorted$totaldeaths <- cumsum(canadasorted$deaths)
canDeaths <- as.vector(canadasorted$totaldeaths)

Dates <- as.Date(canadasorted$ï..dateRep)
canCases <- as.vector(canadasorted$new)

#USA
USA <- mydata[which(str_detect(mydata$countriesAndTerritories, "United_States_of_America")), ]
usasorted <- USA[order(as.Date(USA$ï..dateRep, format="%Y-%m-%d")),]
usasorted$new <- cumsum(usasorted$cases)
usasorted$totaldeaths <- cumsum(usasorted$deaths)
usaCases <- as.vector(usasorted$new)
usaDeaths <- as.vector(usasorted$totaldeaths)

#Italy
italy <- mydata[which(str_detect(mydata$countriesAndTerritories, "Italy")), ]
italysorted <- italy[order(as.Date(italy$ï..dateRep, format="%Y-%m-%d")),]
italysorted$new <- cumsum(italysorted$cases)
italysorted$totaldeaths <- cumsum(italysorted$deaths)
italyCases <- as.vector(italysorted$new)
italyDeaths <- as.vector(italysorted$totaldeaths)

#South Korea
sKorea <- mydata[which(str_detect(mydata$countriesAndTerritories, "South_Korea")), ]
sKoreasorted <- sKorea[order(as.Date(sKorea$ï..dateRep, format="%Y-%m-%d")),]
sKoreasorted$new <- cumsum(sKoreasorted$cases)
sKoreasorted$totaldeaths <- cumsum(sKorea$deaths)
sKoreaCases <- as.vector(sKoreasorted$new)
sKoreaDeaths <- as.vector(sKoreasorted$totaldeaths)

#Plotting Cases
plot(Dates,canCases,
     pch= 19,
     main="Canadian Cases",
     xlab="Date",
     ylab="Total Cases",
     col="steelblue",
)
plot(Dates,usaCases,
     main="USA Cases",
     pch= 19,
     xlab="Date",
     ylab="Total Cases",
     col="red",
)
plot(Dates,italyCases,
     main="Italy Cases",
     pch= 19,
     xlab="Date",
     ylab="Total Cases",
     col="darkgreen",
)
plot(Dates,sKoreaCases,
     main="South Korea Cases",
     pch= 19,
     xlab="Date",
     ylab="Total Cases",
     col="orange",
)


#--------------------------------------------------------------------------------------
#Plotting deaths
plot(Dates,canDeaths,
     pch= 19,
     main="Canadian Deaths",
     xlab="Date",
     ylab="Total Deaths",
     col="steelblue",
)
plot(Dates,usaDeaths,
     main="USA Deaths",
     pch= 19,
     xlab="Date",
     ylab="Total Deaths",
     col="red",
)
plot(Dates,italyDeaths,
     main="Italy Deaths",
     pch= 19,
     xlab="Date",
     ylab="Total Deaths",
     col="darkgreen",
)
plot(Dates,sKoreaDeaths,
     main="South Korea Deaths",
     pch= 19,
     xlab="Date",
     ylab="Total Deaths",
     col="orange",
)
