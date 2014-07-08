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
household.power.consumption$DateTime <- 
        strptime(household.power.consumption$DateTime, format=format)

hist(household.power.consumption$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
