###################################
## Coursera Exploratory Data Analysis, Course Project 1, Plot 2
## Plot Global Active Power from the UC Irvine Machine Learning Repository
###################################

# Save current system's locale
locale <- Sys.getlocale(category = "LC_TIME")

## Set English locale in order to have labels printed in English
Sys.setlocale('LC_TIME', 'C') 

# Read data from web (takes forever, but satisfies the requirement, that the plots have to be fully reproducible)
temp <- tempfile()
download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
power_data <- read.table(unz(temp,'household_power_consumption.txt'), header = TRUE, sep = ';')
unlink(temp)

# Only use data from the dates 2007-02-01 and 2007-02-02
data2plot <- subset(power_data, power_data$Date == '1/2/2007' | power_data$Date == '2/2/2007')

# Convert Global_active_power to numeric, so it can be plotted
data2plot$Global_active_power <- as.numeric(levels(data2plot$Global_active_power))[data2plot$Global_active_power]

# Collapse Date and Time and convert to class "POSIXlt" to get days
data2plot$DateTime <- strptime(paste(data2plot$Date, data2plot$Time), "%d/%m/%Y %H:%M:%S")

# Plot
png(file='plot2.png')

# The model PNGs supplied in the GitHub project have transparent backgrounds, 
# even though this is not specified in the project requirements. 
# The transparent background makes it really hard to compare the graphics to the models
# from the requirements, so I kept the white background.
# To set the background to transparent anyway, uncomment the next line
# par(bg=NA) 

plot(data2plot$DateTime,data2plot$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)',type='l')
dev.off()

# Restore system's original locale
Sys.setlocale("LC_TIME", locale)
