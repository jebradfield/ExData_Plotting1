pow = read.table('household_power_consumption.txt', header=TRUE, sep=';')
pow$DateTime=paste(as.character(pow$Date),as.character(pow$Time))
pow$DateTime=strptime(pow$DateTime, "%d/%m/%Y %H:%M:%s")

pows=subset(pow,pow$DateTime>=as.POSIXlt("2007-02-01 00:00:00") & pow$DateTime<as.POSIXlt("2007-02-03 00:00:00"))
pows$Global_active_power2=as.numeric(as.character(pows$Global_active_power))
pows$Sub_metering_12=as.numeric(as.character(pows$Sub_metering_1))
pows$Sub_metering_22=as.numeric(as.character(pows$Sub_metering_2))
pows$Voltage2=as.numeric(as.character(pows$Voltage))
pows$Global_reactive_power2=as.numeric(as.character(pows$Global_reactive_power))

hist(pows$Global_active_power2, col='red', breaks=25, xlab='Global Active Power (kilowatts)', main='Global Active Power')

dev.copy(png, file = 'plot1.png', width = 480, height = 480)
dev.off()