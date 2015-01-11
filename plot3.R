## plot3.R

## set correct path to read file, strip date and time, select data of 1/2/2007 and 2/2/2007

setwd("C:/BenD/Data Science/RWorkingDir")
powercons <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, na.strings="?")
date1 <- as.Date(powercons2$Date)
datetime <- strptime((paste(powercons$Date, powercons$Time, sep=" ")),"%d/$m/%Y %H:%M:%S")
powercons2<-cbind(datetime,powercons)
colnames(powercons2)[1]<- "Date2"
powercons3 <- subset(powercons2, Date == "1/2/2007" | Date == "2/2/2007")

## create plot and copy to png file

plot(powercons3$Date2, powercons3$Sub_metering_1, type="1", xlab="",ylab="Energy sub metering")
lines(powercons3$Date2, powercons3$Sub_metering_2,col="red")
lines(powercons3$Date2, powercons3$Sub_metering_3,col="blue")
legend("topright", col = c("black","red","blue"), lty = c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="Plot3.png")
dev.off()
