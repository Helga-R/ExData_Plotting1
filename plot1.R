## plot1.R

## set correct path to read file and select data of 1/2/2007 and 2/2/2007

setwd("C:/BenD/Data Science/RWorkingDir")
powercons <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, na.strings=c("?"))
powercons2 <- powercons[powercons$Date %in% c("1/2/2007","2/2/2007"), ]

## create plot and copy to png file

hist(as.numeric(powercons2$Global_active_power), col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="Plot1.png")
dev.off()
