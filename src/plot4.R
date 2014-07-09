source("./src/load_data.R")

household.power.consumption <- load.data()

file.name <- "./plots/plot4.png"
if (file.exists(file.name)) {
        file.remove(file.name)
}
png(file = file.name, width = 480, height = 480)
par(mfrow = c(2, 2))
with(household.power.consumption, {
        plot(datetime, Global_active_power, type = "l", xlab = "", 
             ylab = "Global Active Power")
        plot(datetime, Voltage, type = "l")
        plot(datetime, Sub_metering_1, type = "l", xlab="", 
             ylab="Energy sub metering")
        points(datetime, Sub_metering_2, type = "l", col = "red")
        points(datetime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "n")
        plot(datetime, Global_reactive_power, type = "l")})
dev.off()
