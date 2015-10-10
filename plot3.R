#df <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
#df <- df[complete.cases(df),]

#df[, "Date"] <- as.Date(df[, "Date"], format="%d/%m/%Y")

#small_df = df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02") ) ,]

#small_df[,"ComboDate"] <- paste(small_df$Date, small_df$Time, sep=" ")
#small_df$ComboDatePosix <- strptime( small_df[,"ComboDate"], format="%Y-%m-%d %H:%M:%S")

png("plot3.png")
plot(small_df$ComboDatePosix , small_df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(small_df$ComboDatePosix , small_df$Sub_metering_2, ylab="", xlab="", col="red")
points(small_df$ComboDatePosix , small_df$Sub_metering_3, type="l", ylab="Global Active Power (kilowatts)", xlab="", col="blue")
legend("topright", lty=1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
dev.off()