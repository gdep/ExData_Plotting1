plot1 <- function(){
    
    # Setting plotting device as a png file.
    png("plot1.png", width = 480, height=480, type="windows")
    
    # Reading the data.
    df <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
    
    # Subsetting the data to specified dates.
    ss <- subset(df, Date == "1/2/2007" | Date == "2/2/2007" )
    
    # Setting environment variables in order to plot 4 graphs simultaneously and margin values.
    par( mfrow = c(1,1), mar = c(5.1,4.1,4.1,2.1) )
    
    # Plotting histogram
    hist( as.numeric ( as.character (ss$Global_active_power) ), 
          col = "red", cex.lab=0.9, cex.axis = 0.9,
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)" )
    
    
    # Closing the PNG device.
    dev.off()
    
}