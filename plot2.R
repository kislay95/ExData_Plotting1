data_1 <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data_1$Date <- as.Date(data_1$Date, format = "%d/%m/%Y")
data <- subset(data_1, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_1)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
plot(data$Global_active_power ~ data$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
