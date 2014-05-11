## load the entire power consumption file to data frame -> PwrData
PwrData <- read.table("./data/household_power_consumption.txt", sep = ";",  header = TRUE,na.strings="?",as.is = c("Date","Time"))

## format time and then the date, time first because need concat the date to time to set time properly to the observation date
PwrData$Time <- strptime(paste(PwrData$Date,PwrData$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
PwrData$Date <- as.Date(PwrData$Date, "%d/%m/%Y")

## extract Feb 1 and Feb 2 data to data frame -> PwrDataFeb2007
PwrDataFeb2007<- subset(PwrData, PwrData$Date == "2007-02-01")
PwrDataFeb2007 <- rbind(PwrDataFeb2007, subset(PwrData,PwrData$Date == "2007-02-02"))

## Plot 3
plot(PwrDataFeb2007$Time,PwrDataFeb2007$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(PwrDataFeb2007$Time,PwrDataFeb2007$Sub_metering_2, type = "l",col = "red")
lines(PwrDataFeb2007$Time,PwrDataFeb2007$Sub_metering_3, type = "l",col = "blue")
legend("topright",pch="-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png(file = "Plot3.png",width = 480, height=480 )
plot(PwrDataFeb2007$Time,PwrDataFeb2007$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(PwrDataFeb2007$Time,PwrDataFeb2007$Sub_metering_2, type = "l",col = "red")
lines(PwrDataFeb2007$Time,PwrDataFeb2007$Sub_metering_3, type = "l",col = "blue")
legend("topright",pch="-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

