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

#Build the third plot
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(mydata$dt, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(mydata$dt, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$dt, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()