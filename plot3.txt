plot3 <- function() {
##Create plot of the Energy Sub Meters during 2/1/2007 to 2/2/2007
library(dplyr)
powercomp <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
powercomp$Date <- as.Date(powercomp$Date, format = "%d/%m/%Y")
powercomp$timetemp <- paste(powercomp$Date, powercomp$Time)  
powercomp$Time <- strptime(powercomp$timetemp, format = "%Y-%m-%d %H:%M:%S")
relevantdatespower <- subset(powercomp, Date>="2007-02-01" & Date<="2007-02-02")
png(file = "plot3.png")
with(relevantdatespower, plot(Time, Sub_metering_1,pch=NA_integer_, ylab="Energy Sub Metering"))
lines(relevantdatespower$Time,relevantdatespower$Sub_metering_1, col="black")
lines(relevantdatespower$Time,relevantdatespower$Sub_metering_2, col="red")
lines(relevantdatespower$Time,relevantdatespower$Sub_metering_3, col="blue")
legend("topright",lty=1,lwd=2, col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
dev.off()
}