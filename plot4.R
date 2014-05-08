pow = read.table('household_power_consumption.txt', header=TRUE, sep=';')
pow$DateTime=paste(as.character(pow$Date),as.character(pow$Time))
pow$DateTime=strptime(pow$DateTime, "%d/%m/%Y %H:%M:%s")

pows=subset(pow,pow$DateTime>=as.POSIXlt("2007-02-01 00:00:00") & pow$DateTime<as.POSIXlt("2007-02-03 00:00:00"))
pows$Global_active_power2=as.numeric(as.character(pows$Global_active_power))
pows$Sub_metering_12=as.numeric(as.character(pows$Sub_metering_1))
pows$Sub_metering_22=as.numeric(as.character(pows$Sub_metering_2))
pows$Voltage2=as.numeric(as.character(pows$Voltage))
pows$Global_reactive_power2=as.numeric(as.character(pows$Global_reactive_power))

par(mfcol=c(2,2),mar=c(4.1,5.1,3.1,2.1))

plot(pows$DateTime,pows$Global_active_power2, type='l',xlab=' ',ylab='Global Active Power', cex.lab=.7, cex.axis=.7)

plot(pows$DateTime,pows$Sub_metering_12, type='l',xlab=' ',ylab='Energy sub metering', cex.lab=.7, cex.axis=.7)
lines(pows$DateTime,pows$Sub_metering_22, type='l', col='red')
lines(pows$DateTime,pows$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'),lty=1,cex=.8, bty='n')

plot(pows$DateTime,pows$Voltage2, type='l',xlab='datetime',ylab='Voltage', cex.lab=.7, cex.axis=.7)

plot(pows$DateTime,pows$Global_reactive_power2, type='l',xlab='datetime',ylab='Global_reactive_power', cex.lab=.7, cex.axis=.7)

dev.copy(png, file = 'plot4.png', width = 480, height = 480)

dev.off()