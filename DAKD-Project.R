#DAKD Project

#Setting up the working directory
workingPath <- "C:/Users/Meyerhofer/Desktop/DAKD/España/"
setwd(workingPath)

spanishLeagueData <- NULL
directories <- list.dirs()

#creating a whole dataset with all leagues information:
for(dir in directories) {
  if (dir != ".") {
    dirPath <- paste0(workingPath,dir)
    files <- list.files(path= dirPath, pattern="*.csv")
    spanishLeagueData <- rbind(lapply(paste(dirPath,files, sep="/"), read.csv, sep = ","), spanishLeagueData)
  }
}
spanishLeagueData <- do.call("rbind", list(spanishLeagueData[[1]], spanishLeagueData[[2]], spanishLeagueData[[3]]))


setdiff(names(spanishLeagueData[[1]]), names(spanishLeagueData[[2]]))
setdiff(names(spanishLeagueData[[2]]), names(spanishLeagueData[[1]]))
setdiff(names(spanishLeagueData[[3]]), names(spanishLeagueData[[1]]))

spanishLeagueData[[2]]$LBA <- NULL
spanishLeagueData[[2]]$LBH <- NULL
spanishLeagueData[[2]]$LBD <- NULL
spanishLeagueData[[3]]$LBA <- NULL
spanishLeagueData[[3]]$LBH <- NULL
spanishLeagueData[[3]]$LBD <- NULL
spanishLeagueData <- do.call("rbind", spanishLeagueData) 

#should modify data
spanishLeagueData
