## Setting the working directory

setwd("C:/Ramesh/R Programs/Exploratory Data/")
## Get the power consumption data
getallpowerdata <- read.table(file="household_power_consumption.txt", 
header=T, sep=";")

getfebpowerdatafor2days <- getallpowerdata[getallpowerdata$Date %in% c("1/2/2007","2/2/2007") ,]

combinedateandtime <- strptime(paste(getfebpowerdatafor2days$Date, getfebpowerdatafor2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

getfebpowerdatafor2days$Global_active_power <- as.numeric(as.character(getfebpowerdatafor2days$Global_active_power))


png(filename = "Plot2.png",
    width = 480, height = 480, units = "px")

plot(combinedateandtime, getfebpowerdatafor2days$Global_active_power , xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

dev.off()
