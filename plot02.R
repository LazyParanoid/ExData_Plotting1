data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
data <- data[data$Date== "1/2/2007" | data$Date=="2/2/2007", ]

merge_time <- function(dat){
    paste(dat[1], dat[2], collapse= " ")
}

data$new_time <- apply(data,1,merge_time) 
data$new_time <- strptime(data$new_time, "%d/%m/%Y %H:%M:%S")


png(filename = "plot02.png", width = 480, height=480, unit = "px")


plot(data$new_time, data$Global_active_power, 
     ylab = "Global active power (kilowatts)",  type = "l")#

dev.off()