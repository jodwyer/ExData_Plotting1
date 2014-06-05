require ("sqldf")

#include the two days that we need in a data frame
twoDays <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

#add column for date/time
newDate<-strptime(paste(twoDays$Date, twoDays$Time), format="%d/%m/%Y %H:%M:%S")
twoDays[, "DateTime"]<-data.frame(d=as.data.frame.vector(newDate))

##create and save the plots to plot4.png file
png(filename="plot4.png")

par(mfrow=c(2,2))

#plot 1
plot(twoDays$DateTime, twoDays$Global_active_power, ylab="Global Active Power", xlab="", 
     type="l")

#plot 2
plot(twoDays$DateTime, twoDays$Voltage, ylab="Voltage", xlab="datetime", 
     type="l")

#plot 3
plot(twoDays$DateTime, twoDays$Sub_metering_1, ylab="Energy sub metering", xlab="", 
     type="l")
lines(twoDays$DateTime, twoDays$Sub_metering_2, col="red")
lines(twoDays$DateTime, twoDays$Sub_metering_3, col="blue")

legend("topright", lwd=1, bty="n", col=c("Black", "Blue", "Red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(twoDays$DateTime, twoDays$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", 
     type="l")

dev.off()


