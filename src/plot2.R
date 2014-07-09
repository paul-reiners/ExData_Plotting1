source("./src/load_data.R")

household.power.consumption <- load.data()

file.name <- "./plots/plot2.png"
if (file.exists(file.name)) {
        file.remove(file.name)
}
png(file = file.name, width = 480, height = 480)
plot(household.power.consumption$datetime, 
     household.power.consumption$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
