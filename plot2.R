##PLOT 2##
library(dplyr)
##Loading the data. The dataset must be present into the working directory.
Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
##Processing the data.
##I will select only the needed rows and column and convert the Global Active Power values to numeric
Data <- select(subset(Data, Date == "1/2/2007"|Date == "2/2/2007"), Global_active_power, Date, Time)
Data$Global_active_power <- as.numeric(Data$Global_active_power)/500
##Merging date and time columns into one columns in a format compatible with plot
Data$DateTime <- strptime(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")
##Plotting and copying plot to png
plot(y=Data$Global_active_power,x=Data$DateTime , type="n", ylab="Global active power (kilowatts)", xlab = "")
lines(y=Data$Global_active_power, x=Data$DateTime, col="black")
dev.copy(png, file = "plot2.png")
dev.off()
##THE END##