setwd('Y:/Weiterbildung/Coursera/Data_Science/Exploratory Data Analysis/week1')

Sys.setlocale("LC_TIME", "English")

#dataimport and subset right dates
data<-read.csv2('household_power_consumption.txt')
data$date_right_format <-as.Date(data$Date,format="%d/%m/%Y")
dataUse <- subset(data, data$date_right_format<=as.Date("2007-02-02"))
dataUse <- subset(dataUse, dataUse$date_right_format>=as.Date("2007-02-01"))
dataUse$Global_active_power <- as.numeric(as.character(dataUse$Global_active_power))


#do transformations
dataUse$datetime<-as.POSIXct(paste(dataUse$date_right_format, dataUse$Time), format="%Y-%m-%d %H:%M:%S")

#do plotting
png("plot_2.png")
plot2<-plot(dataUse$datetime,dataUse$Global_active_power,type='l',xlab='',ylab="Global Active Power (kilowatts)")
dev.off()