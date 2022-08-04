# data extraction for 2007-02-01 ~ 2007-02-02.
HPC <- read.table("household_power_consumption.txt", header = T, sep = ";")
HPC$Date<-as.Date(HPC$Date, tryFormats = "%d/%m/%Y")
HPC_Feb2007 <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02")
HPC_Feb2007$Global_active_power <- as.numeric(HPC_Feb2007$Global_active_power)

# show the histogram on screen device.
hist(HPC_Feb2007$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# copy the histogram to a PNG file.
dev.copy(png, file = "plot1.png")
dev.off()

