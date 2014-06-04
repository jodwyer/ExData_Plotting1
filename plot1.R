
require ("sqldf")

#include the two days that we need in a data frame
twoDays <- read.csv.sql("household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

##create and save histogram to plot1.png file
png(filename="plot1.png")
hist(twoDays$Global_active_power, col="Red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
