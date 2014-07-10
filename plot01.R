data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
data <- data[data$Date== "1/2/2007" | data$Date=="2/2/2007", ]

get_time <- function(dat){
    strptime(paste(dat[1], dat[2], collapse= " "), "%d/%m/%Y %H:%M:%S")
}

data$new_time <- apply(data,1,get_time)

png(filename = "plot01.png", width = 480, height=480, unit = "px")

hist(data$Global_activ, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()