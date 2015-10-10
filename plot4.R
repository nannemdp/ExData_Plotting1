df <-read.table("household_power_consumption.txt", header=TRUE, sep=";")
df[, "Global_active_power_kw"] <- as.numeric( df[, "Global_active_power"])/1000
df[, "Date"] <- as.Date(df[, "Date"], format="%d/%m/%Y")
small_df = df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02") ) ,]

small_df[,"ComboDate"] <- paste(small_df$Date, small_df$Time, sep=" ")
small_df$ComboDatePosix <- strptime( small_df[,"ComboDate"], format="%Y-%m-%d %H:%M:%S")

small_df[, "Sub_metering_1"] <- as.numeric( small_df[, "Sub_metering_1"])
small_df[, "Sub_metering_2"] <- as.numeric( small_df[, "Sub_metering_2"])
small_df[, "Sub_metering_3"] <- as.numeric( small_df[, "Sub_metering_3"])


png("plot4.png")
par(mfrow=c(2,2))
plot(small_df$ComboDatePosix , small_df$Global_active_power_kw, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(small_df$ComboDatePosix , small_df$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(small_df$ComboDatePosix , small_df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(small_df$ComboDatePosix , small_df$Sub_metering_2, ylab="", xlab="", col="red")
points(small_df$ComboDatePosix , small_df$Sub_metering_3, type="l", ylab="", xlab="", col="red")
legend("topright", lty=1,lwd=3, col=c("black","blue","red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(small_df$ComboDatePosix , small_df$Global_reactive_power, type="l", ylab="global_reactive_power", xlab="datetime")
dev.off()