setwd("D:/eda")
data.electric<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

data.electric.1<-data.electric[data.electric$Date == "1/2/2007" | data.electric$Date == "2/2/2007",]

data.electric.1$Date<-as.character(data.electric.1$Date)
data.electric.1$Time<-as.character(data.electric.1$Time)
data.electric.1$Date<-rep(c("1/2/07","2/2/07"), each=1440)

x<-paste(data.electric.1$Date,data.electric.1$Time)
formal.time<-strptime(xx,"%d/%m/%y %H:%M:%S")
data.electric.formal<-data.frame(formal.time,data.electric.1)


#plot3
png(filename="plot3.png",width=480,height=480)
plot3<-plot(formal.time,as.numeric(data.electric.formal$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(formal.time,as.numeric(data.electric.formal$Sub_metering_2),type="l",col="red")
lines(formal.time,as.numeric(data.electric.formal$Sub_metering_3),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()

