##Plot 3
library(dplyr)
##Loading the data. The dataset must be present into the working directory.
Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
##Processing the data.
##I will select only the needed rows and column and convert the Global Active Power values to numeric
Data <- select(subset(Data, Date == "1/2/2007"|Date == "2/2/2007"), Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time)
Data$DateTime <- strptime(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")
##Plotting
with(Data, plot(y=Sub_metering_1, x=DateTime, type="n", ylab = "Energy sub metering", xlab = ""))
lines(y=Data$Sub_metering_1, x=Data$DateTime, col="black")
lines(y=Data$Sub_metering_2, x=Data$DateTime, col="red")
lines(y=Data$Sub_metering_3, x=Data$DateTime, col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Writing the plot on plot3.ng
dev.copy(png, file = "plot3.png")
dev.off()
