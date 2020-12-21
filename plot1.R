plot1<- function() {
    # read data  
    project_elec<-read.table("household_power_consumption.txt",
                             sep=";",header=TRUE)
    # convert to numeric 
    project_elec$Sub_metering_1<-as.numeric(project_elec$Sub_metering_1)
    project_elec$Sub_metering_2<-as.numeric(project_elec$Sub_metering_2)
    project_elec$Sub_metering_3<-as.numeric(project_elec$Sub_metering_3)
    project_elec$Global_active_power<-
        as.numeric(project_elec$Global_active_power)
    project_elec$Global_intensity<-
        as.numeric(project_elec$Global_intensity)
    project_elec$Global_reactive_power<-
        as.numeric(project_elec$Global_reactive_power)
    project_elec$Voltage<-as.numeric(project_elec$Voltage)
    project_elec$Date1<-as.Date(project_elec$Date,"%d/%m/%Y")
    
    # select desired date range  
    proj2<-filter(project_elec,
                  project_elec$Date1>=as.Date("2007-02-01") & 
                      project_elec$Date1<=as.Date("2007-02-02"))
    # combine date and time to get date-time string  
    
    proj2$dt1<-as.POSIXct(paste(proj2$Date,proj2$Time),format="%d/%m/%Y %H:%M:%S")
    # create plot  
    png("plot1.png")
    hist(proj2$Global_active_power,breaks=13,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
    dev.off()
}