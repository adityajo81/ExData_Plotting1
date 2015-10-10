hh_pwr_con <- read.table("C:/Users/Aditya Joshi/Documents/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

require(dplyr)

hh_pwr_con2 <- tbl_df(hh_pwr_con) %>% filter(Date %in% c("1/2/2007","2/2/2007"))

hh_pwr_con2$Global_active_power <- as.numeric(hh_pwr_con2$Global_active_power)
hh_pwr_con2$Global_reactive_power <- as.numeric(hh_pwr_con2$Global_reactive_power)
hh_pwr_con2$Voltage <- as.numeric(hh_pwr_con2$Voltage)
hh_pwr_con2$Global_intensity <- as.numeric(hh_pwr_con2$Global_intensity)
hh_pwr_con2$Sub_metering_1 <- as.numeric(hh_pwr_con2$Sub_metering_1)
hh_pwr_con2$Sub_metering_2 <- as.numeric(hh_pwr_con2$Sub_metering_2)
hh_pwr_con2$Sub_metering_3 <- as.numeric(hh_pwr_con2$Sub_metering_3)

hh_pwr_con2$DateTime <- strptime(paste(hh_pwr_con2$Date,hh_pwr_con2$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(hh_pwr_con2$DateTime, hh_pwr_con2$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(hh_pwr_con2$DateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(hh_pwr_con2$DateTime, hh_pwr_con2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

lines(hh_pwr_con2$DateTime, hh_pwr_con2$Sub_metering_2, type="l", col="red")

lines(hh_pwr_con2$DateTime, hh_pwr_con2$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.0, col=c("black", "red", "blue"), bty="o")

plot(hh_pwr_con2$DateTime, hh_pwr_con2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()