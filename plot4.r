file<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
names(file)
lapply(file, class)
file$DateTime<-paste(file$Date, file$Time)
file$DateTime<-strptime(file$DateTime, "%d/%m/%Y %H:%M:%S")
start<-which(file$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(file$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

cleanData<-file[start:end,]

png(filename="plot4.png")
par(mfcol=c(2,2))

plot(cleanData$DateTime, as.numeric(as.character(cleanData$Global_active_power)),type='l',ylab="Global Active Power", xlab="")
plot(cleanData$DateTime, as.numeric(as.character(cleanData$Sub_metering_1)),type='l', xlab="",ylab ="Energy sub metering")
        lines(cleanData$DateTime, as.numeric(as.character(cleanData$Sub_metering_2)),type='l', col='red')
        lines(cleanData$DateTime, cleanData$Sub_metering_3,type='l', col="blue")
        legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))
plot(cleanData$DateTime, as.numeric(as.character(cleanData$Voltage)),type='l', ylab="Voltage",xlab="datetime")
plot(cleanData$DateTime, as.numeric(as.character(cleanData$Global_reactive_power)),type='l', ylab="Global_reactive_power",xlab="datetime" )

dev.off()
