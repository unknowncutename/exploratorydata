plot4<- function() {
#  read data file   
 project_elec<-read.table("household_power_consumption.txt",
                             sep=";",header=TRUE)
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
  #  filter to get desired date range and create date time variable  
    proj2<-filter(project_elec,
                  project_elec$Date1>=as.Date("2007-02-01") & 
                   project_elec$Date1<=as.Date("2007-02-02"))
    proj2$dt1<-as.POSIXct(paste(proj2$Date,proj2$Time),format="%d/%m/%Y %H:%M:%S")
# create plot
png("plot4.png")
 par(mfrow=c(2,2),mar=c(4,4,2,1))
    # left up corner    
    with(proj2,plot(dt1,Global_active_power,
                    ylab="Global active power (kilowatts)",xlab=" ",type="l"))
# right up corner
    with(proj2,plot(dt1,Voltage,
                    ylab="Voltage",xlab="datetime",type="l"))
# left low corner    
    with(proj2,plot(dt1,Sub_metering_1,col="black",type="l",xlab=" ",ylab="Energy Sub metering"))
lines(proj2$dt1,proj2$Sub_metering_2,col="red")
 lines(proj2$dt1,proj2$Sub_metering_3,col="blue")  
legend("topright",legend=c("Sub_metering_1","Sub metering_2",
               "Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
# right low corner
with(proj2,plot(dt1,Global_reactive_power,
                ylab="Global reactive power (kilowatts)",xlab="datetime ",type="l"))
dev.off()
}

