# data extraction for 2007-02-01 ~ 2007-02-02.
HPC <- read.table("household_power_consumption.txt", header = T, sep = ";")
HPC$Date<-as.Date(HPC$Date, tryFormats = "%d/%m/%Y")
HPC_Feb2007 <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02")
HPC_Feb2007$Global_active_power <- as.numeric(HPC_Feb2007$Global_active_power)

# show the graph on screen device.
library(dplyr)
rownum <- data.frame("order"=c(1:2880))
HPC_plot <- mutate(rownum, HPC_Feb2007)
par(mfcol = c(2, 2), mar = c(4,4,2,2))

# 1st plot
plot(HPC_plot$order, HPC_plot$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

# 2nd plot
plot(HPC_plot$order, HPC_plot$Sub_metering_1, type = "n", ylab = "Energy sub metering")
points(HPC_plot$order, HPC_plot$Sub_metering_1, type = "l")
points(HPC_plot$order, HPC_plot$Sub_metering_2, type = "l", col = "red")
points(HPC_plot$order, HPC_plot$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"))

# 3rd plot
plot(HPC_plot$order, HPC_plot$Voltage, type = "l", ylab = "Voltage")

# 4th plot
plot(HPC_plot$order, HPC_plot$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

# copy the graph to a PNG file.
dev.copy(png, file = "plot4.png")
dev.off()
