setwd('Y:/Weiterbildung/Coursera/Data_Science/Exploratory Data Analysis/week1')

Sys.setlocale("LC_TIME", "English")

#dataimport and subset right dates
data<-read.csv2('household_power_consumption.txt')
data$date_right_format <-as.Date(data$Date,format="%d/%m/%Y")
dataUse <- subset(data, data$date_right_format<=as.Date("2007-02-02"))
dataUse <- subset(dataUse, dataUse$date_right_format>=as.Date("2007-02-01"))
dataUse$Global_reactive_power <- as.numeric(as.character(dataUse$Global_reactive_power))
dataUse$Global_active_power <- as.numeric(as.character(dataUse$Global_active_power))
dataUse$Sub_metering_1 <- as.numeric(as.character(dataUse$Sub_metering_1))
dataUse$Sub_metering_2 <- as.numeric(as.character(dataUse$Sub_metering_2))
dataUse$Sub_metering_3 <- as.numeric(as.character(dataUse$Sub_metering_3))
dataUse$Voltage <- as.numeric(as.character(dataUse$Voltage))

#do transformations
dataUse$datetime<-as.POSIXct(paste(dataUse$date_right_format, dataUse$Time), format="%Y-%m-%d %H:%M:%S")

#do plotting
png("plot_4.png")
par(mfrow=c(2,2))
plot1<-plot(dataUse$datetime,dataUse$Global_active_power,type='l',xlab='',ylab="Global Active Power")
plot2<-plot(dataUse$datetime,dataUse$Voltage,type='l',xlab='datetime',ylab="Voltage")
plot3<-plot(dataUse$datetime,dataUse$Sub_metering_1,type='l',xlab='',ylab="Energy sub metering")
lines(dataUse$datetime,dataUse$Sub_metering_2,col='red')
lines(dataUse$datetime,dataUse$Sub_metering_3,col='blue')
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot4<-plot(dataUse$datetime,dataUse$Global_reactive_power,type='l',xlab='datetime',ylab="Global Reactive Power")
dev.off()
