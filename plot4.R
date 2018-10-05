##plot 4
library(dplyr)
par(mfrow = c(2, 2))
##Loading the data and selecting needed rows. Adding DateTime column
Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
Data <- subset(Data, Date == "1/2/2007"|Date == "2/2/2007")
Data$DateTime <- strptime(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")
##Plot 1
plot(y=Data$Global_active_power,x=Data$DateTime , type="n", ylab="Global active power (kilowatts)", xlab = "")
lines(y=Data$Global_active_power, x=Data$DateTime, col="black")
##Plot 2
plot(y=Data$Voltage, x=Data$DateTime, type="n")
lines(y=Data$Voltage, x=Data$DateTime,col="black")
#Plot 3
with(Data, plot(y=Sub_metering_1, x=DateTime, type="n", ylab = "Energy sub metering", xlab = ""))
lines(y=Data$Sub_metering_1, x=Data$DateTime, col="black")
lines(y=Data$Sub_metering_2, x=Data$DateTime, col="red")
lines(y=Data$Sub_metering_3, x=Data$DateTime, col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.3)
##Plot 4
plot(y=Data$Global_reactive_power, x=Data$DateTime, type="n")
lines(y=Data$Global_reactive_power, x=Data$DateTime,col="black")
##Writing the plot on plot4.ng
dev.copy(png, file = "plot4.png")
dev.off()
##The end