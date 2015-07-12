setwd('Y:/Weiterbildung/Coursera/Data_Science/Exploratory Data Analysis/week1')

#dataimport and subset right dates
data<-read.csv2('household_power_consumption.txt')
data$date_right_format <-as.Date(data$Date,format="%d/%m/%Y")
dataUse <- subset(data, data$date_right_format<=as.Date("2007-02-02"))
dataUse <- subset(dataUse, dataUse$date_right_format>=as.Date("2007-02-01"))
dataUse$Global_active_power <- as.numeric(as.character(dataUse$Global_active_power))

#do plotting
png("plot_1.png")
plot1<-hist(dataUse$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",breaks=13,main="Global Active Power")


dev.off()