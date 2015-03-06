# read in the data

txt_filename <- "household_power_consumption.txt"
if(!file.exists(txt_filename)) {
    zip_filename <- "household_power_consumption.zip"
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zip_filename)
    unzip(zip_filename)
}

data <- read.table(txt_filename, sep=";", header=TRUE, na.strings="?")

# filter down to the requested days
filtered_data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# start png
png(file="plot1.png", width=480, height=480, units="px")

# create histogram
hist(filtered_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# close and enjoy!
dev.off()
