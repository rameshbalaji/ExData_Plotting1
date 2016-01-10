## Setting the working directory
## setwd("C:/Ramesh/R Programs/Exploratory Data/")
## Get the power consumption data
getallpowerdata <- read.table(file="household_power_consumption.txt", 
header=T, sep=";")

getfebpowerdatafor2days <- getallpowerdata[getallpowerdata$Date %in% c("1/2/2007","2/2/2007") ,]

combinedateandtime <- strptime(paste(getfebpowerdatafor2days$Date, getfebpowerdatafor2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

getfebpowerdatafor2days$Sub_metering_1 <- as.numeric(getfebpowerdatafor2days$Sub_metering_1)
getfebpowerdatafor2days$Sub_metering_2 <- as.numeric(getfebpowerdatafor2days$Sub_metering_2)
getfebpowerdatafor2days$Sub_metering_3 <- as.numeric(getfebpowerdatafor2days$Sub_metering_3)
getfebpowerdatafor2days$Voltage <- as.numeric(getfebpowerdatafor2days$Voltage)
getfebpowerdatafor2days$Global_active_power<- as.numeric(getfebpowerdatafor2days$Global_active_power)


png(filename = "Plot4.png",
    width = 480, height = 480, units = "px")

## setting par function for 2 cols and 2 rows
par(mfcol = c(2,2))

plot(combinedateandtime, getfebpowerdatafor2days$Global_active_power, xlab = "", ylab = "Global Active Power", type="l")

plot(combinedateandtime, getfebpowerdatafor2days$Sub_metering_1 , xlab = "", ylab = "Energy sub metering", type="l")
points(combinedateandtime, getfebpowerdatafor2days$Sub_metering_2, col="red", type="l" , pch = 1)
points(combinedateandtime, getfebpowerdatafor2days$Sub_metering_3, col="blue", type="l", pch = 1)
legend("topright", pch = "____", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(combinedateandtime, getfebpowerdatafor2days$Voltage , xlab = "Datetime", ylab = "Voltage", type="l")
plot(combinedateandtime, getfebpowerdatafor2days$Global_active_power, xlab = "Datetime", ylab = "Global Active Power", type ="o")

dev.off()
