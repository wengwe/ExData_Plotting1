library(dplyr)
proj.dir <- "C:/Dev/Src/Coursera_EDA/week1_project/ExData_Plotting1/"

datafile.path <- file.path(proj.dir, "household_power_consumption.txt")
df <- read.csv(datafile.path, sep=";", stringsAsFactors = FALSE)
data.df <- filter(df, Date=="1/2/2007"|Date=="2/2/2007")

data.df$DateTimeStr <- paste(data.df$Date, data.df$Time)
data.df$DateTime <- strptime(data.df$DateTimeStr, "%d/%m/%Y %H:%M:%S")

png.path <- file.path(proj.dir, "plot2.png")
png(filename = png.path,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
with(data.df, plot(DateTime,Global_active_power, type = "l",ylab = "Global Active Power(kilowatts)"))
dev.off()
