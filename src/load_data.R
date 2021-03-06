load.data <- function() {
        household.power.consumption <- 
                read.table("./data/household_power_consumption.txt", 
                           header = TRUE,
                           sep=";", 
                           fill=FALSE, 
                           strip.white=TRUE,
                           na.strings="?",
                           stringsAsFactors=FALSE)
        rows <- household.power.consumption$Date %in% c("1/2/2007", "2/2/2007")
        household.power.consumption <-  household.power.consumption[rows, ]
        rm(rows)
        household.power.consumption$DateTime <- 
                with(household.power.consumption, paste(Date, Time, sep=" "))
        household.power.consumption$Date <- NULL
        household.power.consumption$Time <- NULL
        format="%d/%m/%Y %H:%M:%S"
        household.power.consumption$datetime <- 
                strptime(household.power.consumption$DateTime, format=format)

        return(household.power.consumption)
}
