# read in the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# filter down to the requested days
filtered_data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# start png
png(file="plot3.png", width=480, height=480, units="px")

# combine date and time fields
date_time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=' '), "%d/%m/%Y %T")

# create base plot
plot(date_time, filtered_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")

# add two sets of other points
points(date_time, filtered_data$Sub_metering_2, type="l", col="red")
points(date_time, filtered_data$Sub_metering_3, type="l", col="blue")

# I am legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))

# close and enjoy!
dev.off()
