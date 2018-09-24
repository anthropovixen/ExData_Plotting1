# Create 4 Plot for general observation

# Reading data from file

fulldata <- read.csv("household_power_consumption.txt"
                     , header = TRUE
                     , sep = ";"
                     , na.strings = "?"
                     , nrows = 2075259
                     , check.names = FALSE
                     , stringsAsFactors = FALSE
                     , comment.char = ""
                     , quote = "\"")

# Subsetting for specific dates

PeriodData <- fulldata[fulldata$Date %in% c("1/2/2007", "2/2/2007"), ]

# Making sure dates are in the right format

PeriodData$Date <- as.Date(PeriodData$Date, format = "%d/%m/%Y")

# Getting Date and Time together
DateTime <- paste(as.Date(PeriodData$Date), PeriodData$Time)

# Create a new variable DateTime

PeriodData$DateTime <- as.POSIXct(DateTime)

# Save plot to a PNG file

png("plot4.png", width=480, height=480)

# Set parameters for 4 plots at the same screen

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Create 1st Plot from superior left

with(PeriodData, {
  plot(Global_active_power~DateTime
       , type = "l"
       , xlab = ""
       , ylab = "Global Active Power")
  })

# Create 2nd Plot from superior right

with(PeriodData, {
  plot(Voltage~DateTime
       , type = "l"
       , xlab = "DateTime"
       , ylab = "Voltage")
})

# Create 3rd Plot from bottom left

with(PeriodData, {
  plot(Sub_metering_1~DateTime
       , type = "l", xlab = ""
       , ylab = "energy sub-metering")
  lines(Sub_metering_2~DateTime, col = "red")
  lines(Sub_metering_3~DateTime, col = "blue")
})
legend("topright"
       , col = c("black", "red", "blue")
       , lty = 1, lwd = 2, bty = "n"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create 4th plot bottom right

with(PeriodData, {
  plot(Global_reactive_power~DateTime
       , type = "l", xlab = ""
       , ylab = "Global Reactive Power")
})

# Close device

dev.off()
