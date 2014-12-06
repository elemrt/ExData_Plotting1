###################################
## Coursera Exploratory Data Analysis, Course Project 1, Plot 1
## Plot Global Active Power from the UC Irvine Machine Learning Repository
###################################

# Read data from file
power_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')

# Only use data from the dates 2007-02-01 and 2007-02-02
data2plot <- subset(power_data, power_data$Date == '1/2/2007' | power_data$Date == '2/2/2007')

# Convert Global_active_power to numeric, so it can be plotted
data2plot$Global_active_power <- as.numeric(levels(data2plot$Global_active_power))[data2plot$Global_active_power]

# Plot

png(file='plot1.png')

# The model PNGs supplied in the GitHub project have transparent backgrounds, 
# even though this is not specified in the project requirements. 
# The transparent background makes it really hard to compare the graphics to the models
# from the requirements, so I kept the white background.
# To set the background to transparent anyway, uncomment the next line
# par(bg=NA) 

hist(data2plot$Global_active_power,  col='red', main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', ylab='Frequency')
dev.off()


