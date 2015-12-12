## download file from URL & extract the content
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Electricity_Data.zip")
unzip("Electricity_Data.zip")

## load the data frame
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

## subset to just two target days
df_fn <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"), ]

## open PNG and make the plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
