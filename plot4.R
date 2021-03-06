library(lubridate)
#read file
df <- read.table("household_power_consumption 2.txt", 
                 header = TRUE, na.strings = "?", sep = ";")

#subset the data
dates <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
head(dates)
#Convert to Date class
#dates$Date <- as.Date(dates$Date, format="%d/%m/%Y")
datetime <- strptime(paste(dates$Date, dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot 
par(mfrow=c(2,2))

plot(datetime, dates$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(datetime, dates$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, dates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, dates$Sub_metering_2, type = "l", col = "red")
lines(datetime, dates$Sub_metering_3, type = "l", col = "blue")
#legend
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty =1, lwd=2, col =c("black", "red", "blue"))

plot(datetime, dates$Global_reactive_power, type = "l", xlab = datetime, ylab = "Global_reactive_power")


#save as png
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()

