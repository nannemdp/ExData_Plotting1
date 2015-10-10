df <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
df <- df[complete.cases(df),]

df[, "Date"] <- as.Date(df[, "Date"], format="%d/%m/%Y")

small_df = df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02") ) ,]

png("plot1.png")
hist(small_df$Global_active_power, col = 'red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()