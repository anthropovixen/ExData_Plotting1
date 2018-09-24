# Create Line Plot for Global Active Power VS Time

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

png("plot2.png", width=480, height=480)

# Create Plot 2

with(PeriodData, {
  plot(Global_active_power~DateTime
       , type = "l", xlab = ""
       , ylab = "Global Active Power (kilowatts)"
       , main = "Global Active Power VS Time")
  })

# Close device

dev.off()