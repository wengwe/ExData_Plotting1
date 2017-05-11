library(dplyr)
datafile.path <- "C:/Dev/Src/Coursera_EDA/week1_project/ExData_Plotting1/household_power_consumption.txt"
df <- read.csv(datafile.path, sep=";", stringsAsFactors = FALSE)
data.df <- filter(df, Date=="1/2/2007"|Date=="2/2/2007")
data.df$Date <- as.Date(data.df$Date, format="%d/%m/%Y")
data.df$Global_active_power <- as.numeric(data.df$Global_active_power)

png.path <- "C:/Dev/Src/Coursera_EDA/week1_project/ExData_Plotting1/plot1.png"
png(filename = png.path,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
with(data.df, hist(Global_active_power, col="red", main = "Globa Active Power", xlab = "Globa Active Power(kilowatts)"))
dev.off()
