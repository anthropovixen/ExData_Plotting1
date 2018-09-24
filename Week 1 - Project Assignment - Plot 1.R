# Create histogram for Global Active Power

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

as.Date(PeriodData$Date)

# Save plot to a PNG file

png(filename = "plot1.png", width= 480, height= 480)

# Create histogram

hist(PeriodData$Global_active_power, col = "red"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , main = "Global Active Power")

# Close device

dev.off()


