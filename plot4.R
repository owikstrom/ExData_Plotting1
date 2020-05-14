# Data selection
df <- read.csv('household_power_consumption.txt', header =TRUE, sep =";")
df <-subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df$datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Voltage <- as.numeric(df$Voltage)

#Change settings
png('plot4.png', 480, 480, 'px')
par(mfrow=c(2,2))

# Graph Plot 1
plot(df$datetime, df$Global_active_power, ylab = 'Global Active Power', xlab ="", type = "n")
lines(df$datetime,df$Global_active_power)

# Graph Plot 2
with(df, plot(datetime, Voltage,type = "n"))
with(df, lines(datetime,Voltage))


# Graph Plot 3
plot(df$datetime, df$Sub_metering_1, ylab = 'Energy sub metering', xlab ="", type = "n")
lines(df$datetime,df$Sub_metering_1, col= 'black')
lines(df$datetime,df$Sub_metering_2, col= 'red')
lines(df$datetime,df$Sub_metering_3, col= 'blue')
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c('black','red','blue'), lty=1, bty = 'n')

# Graph Plot 4
with(df, plot(datetime, Global_reactive_power, type = "n"))
lines(df$datetime, df$Global_reactive_power, col='black')


# Cleanup
rm(df)
dev.off()