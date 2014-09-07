pwr<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F, na.strings="?")
#change date format to be able to work with it
pwr$Date<-as.Date(pwr$Date, format="%d/%m/%Y")
#subset for dates we want to examine
pwrsub <- subset(pwr, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

pwrsubdt <- paste(as.Date(pwrsub$Date), pwrsub$Time)
pwrsubdt$DateTime <- as.POSIXct(pwrsubdt)

par(mfrow=c(2,2))

#plot1 of 4
plot(pwrsub$Global_active_power~pwrsubdt$DateTime, type="l",
ylab="Global Active Power", xlab="")

#plot2 of 4
plot(pwrsub$Voltage~pwrsubdt$DateTime, type="l",
ylab="Voltage", xlab="datetime")

#plot3 of 4
with(pwrsub, {
plot(Sub_metering_1~pwrsubdt$DateTime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~pwrsubdt$DateTime,col='Red')
lines(Sub_metering_3~pwrsubdt$DateTime,col='Blue')
})legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4 of 4
plot(pwrsub$Global_ractive_power~pwrsubdt$DateTime, type="l",
ylab="Global_ractive_power", xlab="datetime")

#png 4
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()