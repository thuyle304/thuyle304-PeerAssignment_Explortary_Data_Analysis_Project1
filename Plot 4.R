#Read data
data <- read.table("/Users/thuyle/Downloads/household_power_consumption.txt", 
                   header=TRUE, sep=";", na.strings = "?")
# Extract some observations for dates of data from the dates 2007-02-01 and 2007-02-02
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Combine and then convert Date and Time variable to POSIXlt
mydata$dt <- paste(mydata$Date, mydata$Time)
mydata$dt <- strptime(mydata$dt, "%d/%m/%Y %H:%M:%S")
mydata$dt <- as.Date(mydata$dt)

# Look at the data
names(mydata)
summary(mydata)


# Build the fourth plot
mydata$Voltage <- as.numeric(mydata$Voltage)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,4,4))
plot(mydata$dt, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(mydata$dt, mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(mydata$dt, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(mydata$dt, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$dt, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=0.5, col=c("black", "red", "blue"), bty="n", cex=0.5)
plot(mydata$dt, mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()