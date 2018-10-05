##PLOT 1
##Loading the data. The dataset must be present into the working directory.
Data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

##Processing the data.
##I will select only the needed rows and column and convert the Global Active Power values to numeric
Data <- as.numeric(subset(Data, Date == "1/2/2007"|Date == "2/2/2007")$Global_active_power)/500

##Plotting and copying plot to png
hist(Data, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
##THE END##