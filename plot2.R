# Data selection

df <- read.csv('household_power_consumption.txt', header =TRUE, sep =";")
df$Date <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df <-subset(df, Date >= strptime("2/1/2007", "%m/%d/%Y") & Date < strptime("2/3/2007", "%m/%d/%Y"))
df$Global_active_power <- as.numeric(df$Global_active_power)



# Graphing
png('plot2.png', 480, 480, 'px')
plot(df$Date, df$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = "", type = "n")
lines(df$Date,df$Global_active_power)

# Cleanup
rm(df)
dev.off()