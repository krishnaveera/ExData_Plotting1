plot1 <- function() {
##Create histogram of Global Active Power in KW during 2/1/2007 to 2/2/2007
library(dplyr)
powercomp <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
powercomp$Date <- as.Date(powercomp$Date, format = "%d/%m/%Y")
powercomp$timetemp <- paste(powercomp$Date, powercomp$Time)  
powercomp$Time <- strptime(powercomp$timetemp, format = "%Y-%m-%d %H:%M:%S")
relevantdatespower <- subset(powercomp, Date>="2007-02-01" & Date<="2007-02-02")
png(file = "plot1.png")
hist(relevantdatespower$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", main ="Global Active Power")
dev.off()
}