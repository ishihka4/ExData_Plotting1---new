# data extraction for 2007-02-01 ~ 2007-02-02.
HPC <- read.table("household_power_consumption.txt", header = T, sep = ";")
HPC$Date<-as.Date(HPC$Date, tryFormats = "%d/%m/%Y")
HPC_Feb2007 <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02")
HPC_Feb2007$Global_active_power <- as.numeric(HPC_Feb2007$Global_active_power)

# show the graph on screen device.
library(dplyr)
rownum <- data.frame("order"=c(1:2880))
HPC_plot <- mutate(rownum, HPC_Feb2007)
plot(HPC_plot$order, HPC_plot$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

# copy the graph to a PNG file.
dev.copy(png, file = "plot2.png")
dev.off()

