###################################
## Coursera Exploratory Data Analysis, Course Project 1, Plot 4
## Plot Global Active Power from the UC Irvine Machine Learning Repository
###################################

# Save current system's locale
locale <- Sys.getlocale(category = "LC_TIME")

## Set English locale in order to have labels printed in English
Sys.setlocale('LC_TIME', 'C') 

# Read data from file
power_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')

# Only use data from the dates 2007-02-01 and 2007-02-02
data2plot <- subset(power_data, power_data$Date == '1/2/2007' | power_data$Date == '2/2/2007')

# Prepare plot
png(file='plot4.png')

# The model PNGs supplied in the GitHub project have transparent backgrounds, 
# even though this is not specified in the project requirements. 
# The transparent background makes it really hard to compare the graphics to the models
# from the requirements, so I kept the white background.
# To set the background to transparent anyway, uncomment the next line
# par(bg=NA) 

# There will be 4 plots, in 2 rows and 2 columns
par(mfrow = c(2,2))

# Plot1 
# Convert Global_active_power to numeric, so it can be plotted
data2plot$Global_active_power <- as.numeric(levels(data2plot$Global_active_power))[data2plot$Global_active_power]
# Collapse Date and Time and convert to class "POSIXlt" to get days
data2plot$DateTime <- strptime(paste(data2plot$Date, data2plot$Time), "%d/%m/%Y %H:%M:%S")
# Plot
plot(data2plot$DateTime,data2plot$Global_active_power, xlab='', ylab='Global Active Power',type='l')

# Plot2
# Convert Voltage to numeric, so it can be plotted
data2plot$Voltage <- as.numeric(levels(data2plot$Voltage))[data2plot$Voltage]
# Plot
plot(data2plot$DateTime,data2plot$Voltage, xlab='datetime', ylab='Voltage',type='l')

# Plot3
# Convert Sub_metering_1 & Sub_metering_2 to numeric, so it can be plotted
data2plot$Sub_metering_1 <- as.numeric(levels(data2plot$Sub_metering_1))[data2plot$Sub_metering_1]
data2plot$Sub_metering_2 <- as.numeric(levels(data2plot$Sub_metering_2))[data2plot$Sub_metering_2]
# Plot
plot(data2plot$DateTime,data2plot$Sub_metering_1,type='n', xlab='', 
     ylab='Energy sub metering')
lines(data2plot$DateTime,data2plot$Sub_metering_1)
lines(data2plot$DateTime,data2plot$Sub_metering_2, col='red')
lines(data2plot$DateTime,data2plot$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col = c('black','red','blue'), lty=1, bty='n')

# Plot4
# Convert Global_reactive_power to numeric, so it can be plotted
data2plot$Global_reactive_power <- as.numeric(levels(data2plot$Global_reactive_power))[data2plot$Global_reactive_power]
# Plot
plot(data2plot$DateTime,data2plot$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')

dev.off()

# Restore system's original locale
Sys.setlocale("LC_TIME", locale)
