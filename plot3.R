rm(list=ls())


# import data file 
data_tbl<- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")


# format date column and filter data to dates of interest
data_tbl$Date<- as.Date(data_tbl$Date, format = "%d/%m/%Y")
data_subset<- subset(data_tbl,Date>= as.Date("2007-2-1") & Date<= as.Date("2007-2-2"))

#formate and create time vector
data_time<- paste(as.Date(data_subset$Date),data_subset$Time)
data_subset_time<- as.POSIXct(data_time)


#create labels for 3rd graph
png(file = "plot3.png", height=480, width=480)
plot(data_subset_time,data_subset$Sub_metering_1,type = "l", col="black",xlab="",ylab= "Energy sub metering")
lines(data_subset_time,data_subset$Sub_metering_2,col = "red")
lines(data_subset_time,data_subset$Sub_metering_3,col = "blue")
col_lbls = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend= col_lbls,col = c("black","red","blue"),lty= "solid")
dev.off()