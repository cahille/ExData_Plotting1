txt_filename <- "household_power_consumption.txt"
if(!file.exists(txt_filename)) {
    zip_filename <- "household_power_consumption.zip"
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zip_filename)
    unzip(zip_filename)
}

# read in the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# filter down to the requested days
filtered_data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# start png
png(file="plot4.png", width=480, height=480, units="px")

# combine date and time fields
date_time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=' '), "%d/%m/%Y %T")

# set up a 2 x 2 grid of plots
par(mfrow = c(2,2))

# top left plot
plot(date_time, filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# top right plot
plot(date_time, filtered_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# bottom left plot
# create base plot
plot(date_time, filtered_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")

# add two sets of other points
points(date_time, filtered_data$Sub_metering_2, type="l", col="red")
points(date_time, filtered_data$Sub_metering_3, type="l", col="blue")

# I am legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty = "n")

# bottom right plot
plot(date_time, filtered_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close and enjoy!
dev.off()
