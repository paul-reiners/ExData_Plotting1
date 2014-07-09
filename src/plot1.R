source("./src/load_data.R")

household.power.consumption <- load.data()

file.name <- "./plots/plot1.png"
if (file.exists(file.name)) {
        file.remove(file.name)
}
png(file = file.name, width = 480, height = 480)
hist(household.power.consumption$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
