library(dplyr)
proj.dir <- "C:/Dev/Src/Coursera_EDA/week1_project/ExData_Plotting1/"

datafile.path <- file.path(proj.dir, "household_power_consumption.txt")
df <- read.csv(datafile.path, sep=";", stringsAsFactors = FALSE)
data.df <- filter(df, Date=="1/2/2007"|Date=="2/2/2007")

data.df$DateTimeStr <- paste(data.df$Date, data.df$Time)
data.df$DateTime <- strptime(data.df$DateTimeStr, "%d/%m/%Y %H:%M:%S")

data.df$Sub_metering_1 <- as.numeric(data.df$Sub_metering_1)
data.df$Sub_metering_2 <- as.numeric(data.df$Sub_metering_2)
data.df$Sub_metering_3 <- as.numeric(data.df$Sub_metering_3)

png.path <- file.path(proj.dir, "plot3.png")
png(filename = png.path,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

xrange <- range(data.df$DateTime) 
yrange <- range(c(data.df$Sub_metering_1, data.df$Sub_metering_2, data.df$Sub_metering_3)) 
with(data.df, plot(xrange,yrange, type = "n",xlab="", ylab = "Energe sub metering"))
with(data.df, lines(DateTime, Sub_metering_1, col="black"))
with(data.df, lines(DateTime, Sub_metering_2, col="red"))
with(data.df, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col=c('black','red','blue'))
dev.off()
