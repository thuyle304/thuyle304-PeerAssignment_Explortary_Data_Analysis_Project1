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


# Build the second plot
png("plot2.png", width=480, height=480)
plot(mydata$dt, mydata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
