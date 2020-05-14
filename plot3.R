# Data selection
df <- read.csv('household_power_consumption.txt', header =TRUE, sep =";")
df <-subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df$Date <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


# Graphing
png('plot3.png', 480, 480, 'px')
plot(df$Date, df$Sub_metering_1, ylab = 'Energy sub metering', xlab = "", type = "n")
lines(df$Date,df$Sub_metering_1, col= 'black')
lines(df$Date,df$Sub_metering_2, col= 'red')
lines(df$Date,df$Sub_metering_3, col= 'blue')
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c('black','red','blue'), lty = 1)

# Cleanup
rm(df)
dev.off()