
setwd("F:/DOWN/datascientist/ExploratoryAnalysis/assign1")

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
dedata$DT = strptime(paste(dedata$Date,dedata$Time,sep = " "),"%d/%m/%Y %T")


hist(dedata$Global_active_power, col = "red",main="global active power",xlab="global active power (kilowats)")
dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!





