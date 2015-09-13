data =read.table("household_power_consumption.txt", header = TRUE, sep= ";")
a<- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
b<-as.numeric(levels(a$Global_active_power))[a$Global_active_power]
png(file = 'plot1.png',width = 480, height = 480, units = "px")
hist(b, breaks=12, col = 'red', xlab= 'Global Active Power(kilowatts)', main = 'Global Active Power')
dev.off()
