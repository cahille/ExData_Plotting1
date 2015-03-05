# read in the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# filter down to the requested days
filtered_data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# start png
png(file="plot2.png", width=480, height=480, units="px")

# combine date and time fields
date_time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=' '), "%d/%m/%Y %T")

# place y values into a variable
y <- filtered_data$Global_active_power

# create histogram
plot(date_time, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close and enjoy!
dev.off()
