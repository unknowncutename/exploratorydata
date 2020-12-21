plot3<- function() {
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
# create datwe time variable 
   proj2$dt1<-as.POSIXct(paste(proj2$Date,proj2$Time),format="%d/%m/%Y %H:%M:%S")
# create plot
png("plot3.png")
with(proj2,plot(dt1,Sub_metering_1,col="black",type="l",xlab=" ",ylab="Energy ub metering"))
lines(proj2$dt1,proj2$Sub_metering_2,col="red")
 lines(proj2$dt1,proj2$Sub_metering_3,col="blue")  
legend("topright",legend=c("Sub_metering_1","Sub metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()   
 }
