library(lubridate)
#read file
df <- read.table("household_power_consumption 2.txt", 
                 header = TRUE, na.strings = "?", sep = ";")

#subset the data
dates <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
head(dates)
#Convert to Date class
dates$Date <- as.Date(dates$Date, format="%d/%m/%Y")
#plot Hist
hist(dates$Global_active_power, col ="red", main = "Global ActivePower", xlab = "Global Active Power (kilowatts)", 
         ylab = "Frequency")
#save as png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
