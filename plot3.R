data =read.table("household_power_consumption.txt", header = TRUE, sep= ";")
a<- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
a$Date <- as.Date (a$Date, "%d/%m/%Y")
a$date.time = paste(a$Date, a$Time, sep="")
d<- strftime(a$date.time)
e<-as.POSIXct (d)
g<- as.numeric(levels(a$Sub_metering_2))[a$Sub_metering_2]
h<- as.numeric(levels(a$Sub_metering_1))[a$Sub_metering_1]
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(e,h, type="l", ylab= "Energy sub metering", main="", xlab = "")
lines(e,g, type="l", ylab= "Energy sub metering", main="", xlab = "", col= "red")
lines(e,a$Sub_metering_3, type="l", ylab= "Energy sub metering", main="", xlab = "", col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=1)
dev.off()