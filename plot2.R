data =read.table("household_power_consumption.txt", header = TRUE, sep= ";")
a<- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
a$Date <- as.Date (a$Date, "%d/%m/%Y")
a$date.time = paste(a$Date, a$Time, sep="")
d<- strftime(a$date.time)
e<-as.POSIXct (d)
f<- as.numeric(levels(a$Global_active_power))[a$Global_active_power]
png(file = "plot2.png",  width = 480, height = 480, units = "px")
plot(e, f, type = "l", xlab = "", main = "", ylab = "Global Active Power (kilowatts)")
dev.off()