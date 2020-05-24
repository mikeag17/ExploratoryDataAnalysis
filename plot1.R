
rm(list=ls())

# import data file 
data_tbl<- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")


# format date column and filter data to dates of interest
data_tbl$Date<- as.Date(data_tbl$Date, format = "%d/%m/%Y")
data_subset<- subset(data_tbl,Date>= as.Date("2007-2-1") & Date<= as.Date("2007-2-2"))

#formate and create time vector
data_time<- paste(as.Date(data_subset$Date),data_subset$Time)
data_subset_time<- as.POSIXct(data_time)

png(file = "plot1.png", height=480, width=480)
# Plot Number 1
hist(data_tbl$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()