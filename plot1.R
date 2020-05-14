df <- read.csv('household_power_consumption.txt', header =TRUE, sep =";")
df$Date <- as.Date(df$Date, "%d / %m / %y")

df$Dt <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df2 <-subset(df, dt >= "2007-2-1" & dt < "2007-2-2")
rm(df)

hist(df2$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'red')

png('plot1.png', 480, 480, 'px')