#setwd("F:/DOWN/datascientist/ExploratoryAnalysis/assign1")

indata <- read.csv("household_power_consumption.txt",sep= ";"
                   ,colClasses = c("character", "character"
                                   ,"numeric"  ,"numeric"
                                   , "numeric","numeric"
                                   , "numeric","numeric"
                                   , "numeric"),na.strings=c("?") , nrows=-1)

dedata <- subset(indata, Date == "1/2/2007" | Date== "2/2/2007" )

head(dedata,5)
str(dedata)

?strptime()
?as.Date()

dedata$DT = strptime(paste(dedata$Date,dedata$Time,sep = " "),"%d/%m/%Y %T")
dedata$Date=as.Date(dedata$Date,"%d/%m/%Y")
dedata$Time=strptime(dedata$Time,"%T")

par(mfrow = c(2, 2))

with(dedata, plot(DT, Global_active_power,type="l",xlab="",ylab="global active power (kilowats)"))

with(dedata, plot(DT,Voltage ,type="l",xlab="datetime",ylab="voltage"))

with(dedata,plot(DT,Sub_metering_1,type="l",col="gray",xlab=" ",ylab="Energy submetering"))
with(dedata, points(DT,Sub_metering_2,type="l",xlab=" ",col="blue"))
with(dedata, points(DT,Sub_metering_3,type="l",xlab=" ",col="red"))
legend("topright", pch = 1, col = c("gray","blue", "red"),cex=0.7,bty="n",lty=1:2
       ,inset=c(0.2,0) 
       , legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(dedata, plot(DT,Global_reactive_power 
                  ,type="l",xlab="datetime",ylab="global_reactive_power"),inset)

dev.copy(png, file = "plot4.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!



