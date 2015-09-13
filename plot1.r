file<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
names(file)
lapply(file, class)
file$DateTime<-paste(file$Date, file$Time)
file$DateTime<-strptime(file$DateTime, "%d/%m/%Y %H:%M:%S")
start<-which(file$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(file$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

cleanData<-file[start:end,]
png(filename="plot1.png")
hist(as.numeric(as.character(cleanData$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()


