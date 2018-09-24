# Create Lines Plot for energy Sub-metering VS Time

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

png("plot3.png", width=480, height=480)

# Create Plot 3

with(PeriodData, {
  plot(Sub_metering_1~DateTime
       , type = "l", xlab = ""
       , ylab = "energy sub-metering"
       , main = "Energy Sub-metering VS Time")
  lines(Sub_metering_2~DateTime, col = "red")
  lines(Sub_metering_3~DateTime, col = "blue")
})
legend("topright"
       , lty = 1
       , col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device

dev.off()
