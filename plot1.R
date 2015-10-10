df <-read.table("household_power_consumption.txt", header=TRUE, sep=";")

df[, "Global_active_power_kw"] <- as.numeric( df[, "Global_active_power"])/1000
df[, "Date"] <- as.Date(df[, "Date"], format="%d/%m/%Y")

small_df = df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02") ) ,]


png("plot1.png")
hist(small_df$Global_active_power_kw, xlim = c(0,6), col = 'red', 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()