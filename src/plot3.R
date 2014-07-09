source("./src/load_data.R")

household.power.consumption <- load.data()

file.name <- "./plots/plot3.png"
if (file.exists(file.name)) {
        file.remove(file.name)
}
png(file = file.name, width = 480, height = 480)
with(household.power.consumption, {
     plot(DateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
     points(DateTime, Sub_metering_2, type = "l", col = "red")
     points(DateTime, Sub_metering_3, type = "l", col = "blue")})
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
