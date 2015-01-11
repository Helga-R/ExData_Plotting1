## plot4.R

## set correct path to read file, strip date and time, select data of 1/2/2007 and 2/2/2007

setwd("C:/BenD/Data Science/RWorkingDir")
powercons <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, na.strings="?")
date1 <- as.Date(powercons2$Date)
datetime <- strptime((paste(powercons$Date, powercons$Time, sep=" ")),"%d/$m/%Y %H:%M:%S")
powercons2<-cbind(datetime,powercons)
colnames(powercons2)[1]<- "Date2"
powercons3 <- subset(powercons2, Date == "1/2/2007" | Date == "2/2/2007")

## create plot and copy to png file

par(mfrow = c(2,2),cex=0.7)
with(powercons3,{
plot(Date2,Global_active_power, xlab="", type="l", ylab="Global Active Power")
plot(Date2, Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(Date2, Sub_metering_1, xlab="", type="l", ylab="Energy sub metering")
lines(Date2, Sub_metering_2,col="red")
lines(Date2, Sub_metering_3,col="blue")
legend("topright",bty="n", col = c("black","red","blue"), lty = c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(Date2,Global_reactive_power, type="l", xlab="datetime")
})
dev.copy(png, file="Plot4.png")
dev.off()
