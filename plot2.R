## plot2.R

## set correct path to read file, strip date and time, select data of 1/2/2007 and 2/2/2007 

setwd("C:/BenD/Data Science/RWorkingDir")
powercons <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, na.strings=c("?"))
date1 <- as.Date(powercons$Date)
datetime <- strptime((paste(date1, powercons$Time, sep=" ")),"%d/$m/%Y %H:%M:%S")
powercons2<-cbind(datetime,powercons)
colnames(powercons2)[1]<- "Date2"
powercons3 <- subset(powercons2, Date == "1/2/2007" | Date == "2/2/2007")

## create plot and copy to png file

plot(powercons3$Date2,powercons3$Global_active_power, type="1", xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file="Plot2.png")
dev.off()
