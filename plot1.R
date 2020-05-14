# Data selection

df <- read.csv('household_power_consumption.txt', header =TRUE, sep =";")
df <-subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df$Global_active_power <- as.numeric(df$Global_active_power)

# Graphing

png('plot1.png', 480, 480, 'px')
hist(df$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'red')

# Cleanup
rm(df)
dev.off()
