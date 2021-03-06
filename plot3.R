## download file from URL & extract the content
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Electricity_Data.zip")
unzip("Electricity_Data.zip")

## load the data frame
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

## subset to just two target days
df_fn <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"), ]

## add datetime column
df_fn$datetime <- strptime(paste(df_fn$Date, df_fn$Time), format = "%d/%m/%Y %T")

## open PNG and make the plots & add legend
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(x = df_fn$datetime, y = df_fn$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(x = df_fn$datetime, y = df_fn$Sub_metering_2, col = "red")
lines(x = df_fn$datetime, y = df_fn$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()
