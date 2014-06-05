require ("sqldf")

#include the two days that we need in a data frame
twoDays <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

#add column for date/time
newDate<-strptime(paste(twoDays$Date, twoDays$Time), format="%d/%m/%Y %H:%M:%S")
twoDays[, "DateTime"]<-data.frame(d=as.data.frame.vector(newDate))

##create and save the plot to plot3.png file
png(filename="plot3.png")
plot(twoDays$DateTime, twoDays$Sub_metering_1, ylab="Energy sub metering", xlab="", 
     type="l")
lines(twoDays$DateTime, twoDays$Sub_metering_2, col="red")
lines(twoDays$DateTime, twoDays$Sub_metering_3, col="blue")

legend("topright", lwd=1, col=c("Black", "Blue", "Red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
