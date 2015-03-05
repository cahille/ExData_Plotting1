# read in the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# filter down to the requested days
filtered_data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# start png
png(file="plot1.png", width=480, height=480, units="px")

# create histogram
hist(filtered_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# close and enjoy!
dev.off()
