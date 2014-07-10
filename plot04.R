data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
data <- data[data$Date== "1/2/2007" | data$Date=="2/2/2007", ]

merge_time <- function(dat){
    paste(dat[1], dat[2], collapse= " ")
}

data$new_time <- apply(data,1,merge_time) 
data$new_time <- strptime(data$new_time, "%d/%m/%Y %H:%M:%S")



png(filename = "plot04.png", width = 480, height=480, unit = "px")


par(mfcol=c(2,2))

plot(data$new_time, data$Global_active_power, ylab = "Global active power",
     type = "l", xlab = "")#

plot(data$new_time, data$Sub_metering_1, ylab = "Energy Sub metering",
     type = "l",xlab = "")#
lines(data$new_time, data$Sub_metering_2, col = "red")
lines(data$new_time, data$Sub_metering_3, col = "blue")
legend("topright", col = c(1,2,4), lty=c(1,1,1), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(data$new_time, data$Voltage, ylab = "Voltage", type = "l", xlab = "datetime")

plot(data$new_time, data$Global_reactive_power, ylab = "Global_reactive_power",
     type = "l",xlab = "datetime")#

dev.off()