data =read.table("household_power_consumption.txt", header = TRUE, sep= ";")
a<- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
a$Date <- as.Date (a$Date, "%d/%m/%Y")
a$date.time = paste(a$Date, a$Time, sep="")
d<- strftime(a$date.time)
e<-as.POSIXct (d)
f<- as.numeric(levels(a$Global_active_power))[a$Global_active_power]
a$Voltage <- as.numeric(levels(a$Voltage))[a$Voltage]
a$Sub_metering_1<- as.numeric(levels(a$Sub_metering_1))[a$Sub_metering_1]
a$Sub_metering_2<- as.numeric(levels(a$Sub_metering_2))[a$Sub_metering_2]
a$Sub_metering_3<- as.numeric(levels(a$Sub_metering_3))[a$Sub_metering_3]
a$Global_reactive_power <- as.numeric(levels(a$Global_reactive_power))[a$Global_reactive_power]
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow= c(2,2))
plot(e, f, type = "l", xlab = "", main = "", ylab = "Global Active Power (kilowatts)")
plot(e, a$Voltage, type = "l", xlab = "datetime", main = "", ylab = "Voltage")
plot(e,a$Sub_metering_1, type="l", ylab= "Energy sub metering", main="", xlab = "")
lines(e,a$Sub_metering_2, type="l", ylab= "Energy sub metering", main="", xlab = "", col= "red")
lines(e,a$Sub_metering_3, type="l", ylab= "Energy sub metering", main="", xlab = "", col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=1, box.lwd = 0)
plot(e, a$Global_reactive_power, type = "l", xlab = "datetime", main = "", ylab = "Global_reactive_power")
dev.off()
