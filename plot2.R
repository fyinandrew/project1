

setwd("D:/eda")
data.electric<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

data.electric.1<-data.electric[data.electric$Date == "1/2/2007" | data.electric$Date == "2/2/2007",]

data.electric.1$Date<-as.character(data.electric.1$Date)
data.electric.1$Time<-as.character(data.electric.1$Time)
data.electric.1$Date<-rep(c("1/2/07","2/2/07"), each=1440)

x<-paste(data.electric.1$Date,data.electric.1$Time)
formal.time<-strptime(x,"%d/%m/%y %H:%M:%S")
data.electric.formal<-data.frame(formal.time,data.electric.1)


#plot2
png(filename="plot2.png",width=480,height=480)
plot2<-plot(formal.time,as.numeric(data.electric.formal$Global_active_power)/1000,type="l",ylab="Global active power(kilowatts)")
dev.off()

