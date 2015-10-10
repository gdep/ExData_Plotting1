plot4 <- function(){
    
    # Setting plotting device as a png file.
    png("plot4.png", width = 480, height=480, type="windows")
    
    # Reading the data.
    df <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
    
    # Subsetting the data to specified dates.
    ss <- subset(df, Date == "1/2/2007" | Date == "2/2/2007" )
    
    # Changing the date to a POSIX format and merging the Time variable with it.
    ss$Date <- as.POSIXct(paste(ss$Date, ss$Time), format = "%d/%m/%Y %H:%M:%S")
    
    # Setting environment variables in order to plot 4 graphs simultaneously and margin values.
    par( mfrow = c(2,2), mar = c(5.1,4.1,4.1,2.1) )
    
    # Plotting the 4 graphs.
    with( ss, {
        
        # Plotting the first graph (top left).
        plot( Date, as.numeric( as.character( Global_active_power ) ), 
              type = "l", lwd = 1, cex.axis = 0.9, cex.lab=0.9,
              xlab = "", ylab = "Global Active Power" )
        
        
        # Plotting the second graph (top right).
        plot( Date, as.numeric( as.character( Voltage ) ), 
              type = "l", lwd = 1, cex.axis = 0.9, cex.lab=0.9,
              xlab = "datetime", ylab = "Voltage" )
        
        
    
        # Plotting the third graph (bottom left).
        plot( Date, as.numeric( as.character( Sub_metering_1 ) ), 
              type = "l", cex.axis = 0.9, cex.lab=0.9,
              xlab = "", ylab = "Energy sub metering" )
        
        
        # Adding the "Sub_metering_2" line in the red color to the third graph.
        points( Date, as.numeric( as.character( Sub_metering_2 ) ), col = "red", type = "l", lwd = 1)
        
        # Adding the "Sub_metering_2" line in the blue color to the third graph.
        points( Date, as.numeric( as.character( Sub_metering_3 ) ), col = "blue", type = "l", lwd = 1)
        
        # Adding the legend (top right corner) to identify the 3 plotted lines in the third graph.
        legend("topright", lwd = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "n", cex = 0.9)
        
        
        # Plotting the fourth graph (bottom right).
        plot( Date, as.numeric( as.character( Global_reactive_power ) ), 
              type = "l", lwd = 1, cex.axis = 0.9, cex.lab=0.9,
              xlab = "datetime", ylab = "Global_reactive_power" )
    
    })
    
    
    # Closing the PNG device.
    dev.off()
    
}