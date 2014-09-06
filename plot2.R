pwr<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F, na.strings="?")
#change date format to be able to work with it
pwr$Date<-as.Date(pwr$Date, format="%d/%m/%Y")
#subset for dates we want to examine
pwrsub <- subset(pwr, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

pwrsubdt <- paste(as.Date(pwrsub$Date), pwrsub$Time)
pwrsubdt$DateTime <- as.POSIXct(pwrsubdt)

#plot2
plot(pwrsub$Global_active_power~pwrsubdt$DateTime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")

#png 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()