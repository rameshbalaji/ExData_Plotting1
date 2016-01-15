## Setting the working directory
setwd("C:/Ramesh/R Programs/Exploratory Data/")

## Get the power consumption data
getallpowerdata <- read.table(file="household_power_consumption.txt", 
header=T, sep=";")

## format to date type

getallpowerdata$Date <- as.Date(getallpowerdata$Date, "%d/%m/%Y")
getfebpowerdatafor2days <- subset(getallpowerdata, Date == "2007-02-01" | Date == "2007-02-02")


getfebpowerdatafor2days$Global_active_power <- as.numeric(as.character(getfebpowerdatafor2days$Global_active_power))

png(filename = "Plot1.png",
    width = 480, height = 480, units = "px")

hist(getfebpowerdatafor2days$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     border="black", 
     col="red")

dev.off()
