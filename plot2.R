
require ("sqldf")

#include the two days that we need in a data frame
twoDays <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

#add column for date/time
newDate<-strptime(paste(twoDays$Date, twoDays$Time), format="%d/%m/%Y %H:%M:%S")

twoDays[, "DateTime"]<-data.frame(d=as.data.frame.vector(newDate))

##create and save histogram to plot1.png file
png(filename="plot2.png")
plot(twoDays$DateTime, twoDays$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
