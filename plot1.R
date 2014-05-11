## load the entire power consumption file to data frame -> PwrData
PwrData <- read.table("./data/household_power_consumption.txt", sep = ";",  header = TRUE,na.strings="?",as.is = c("Date","Time"))

## format time and then the date, time first because need concat the date to time to set time properly to the observation date
PwrData$Time <- strptime(paste(PwrData$Date,PwrData$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
PwrData$Date <- as.Date(PwrData$Date, "%d/%m/%Y")

## extract Feb 1 and Feb 2 data to data frame -> PwrDataFeb2007
PwrDataFeb2007<- subset(PwrData, PwrData$Date == "2007-02-01")
PwrDataFeb2007 <- rbind(PwrDataFeb2007, subset(PwrData,PwrData$Date == "2007-02-02"))

## Plot 1 
hist(PwrDataFeb2007$Global_active_power,xlab ="Global Active Power (kilowatts)", col = "red",main = "Global Active Power")

## Save to PNG File 
png(file = "Plot1.png",width = 480, height=480 )
hist(PwrDataFeb2007$Global_active_power,xlab ="Global Active Power (kilowatts)", col = "red",main = "Global Active Power")
dev.off()

