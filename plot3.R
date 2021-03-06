## Setting the working directory
setwd("C:/Ramesh/R Programs/Exploratory Data/")
## Get the power consumption data
getallpowerdata <- read.table(file="household_power_consumption.txt", 
header=T, sep=";")

getfebpowerdatafor2days <- getallpowerdata[getallpowerdata$Date %in% c("1/2/2007","2/2/2007") ,]

combinedateandtime <- strptime(paste(getfebpowerdatafor2days$Date, getfebpowerdatafor2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

getfebpowerdatafor2days$Sub_metering_1 <- as.numeric(as.character(getfebpowerdatafor2days$Sub_metering_1))
getfebpowerdatafor2days$Sub_metering_2 <- as.numeric(as.character(getfebpowerdatafor2days$Sub_metering_2))
getfebpowerdatafor2days$Sub_metering_3 <- as.numeric(as.character(getfebpowerdatafor2days$Sub_metering_3))

png(filename = "Plot3.png",
    width = 480, height = 480, units = "px")

plot(combinedateandtime, getfebpowerdatafor2days$Sub_metering_1 , xlab = "", ylab = "Energy sub metering", type="l")
lines(combinedateandtime, getfebpowerdatafor2days$Sub_metering_2, col="red", type="l" , pch = 1)
lines(combinedateandtime, getfebpowerdatafor2days$Sub_metering_3, col="blue", type="l", pch = 1)
legend("topright", pch = "____", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
