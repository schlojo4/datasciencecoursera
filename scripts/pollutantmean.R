pollutantmean <- function(directory, pollutant, id = 1:332){

        # List all files in the specified directory 
        basefiles <- list.files(directory)
        
        # Initialize an empty data frame to store combined data
        g <- data.frame()
        
        # Loop through the selected file IDs
        for(basefiles in basefiles[id]){
                
                # Construct the full path to the file
                path <- paste0(directory, "/", basefiles)
                
                # Read the CSV file
                f = read.csv(path)
                
                # Append the data to the combined data frame
                g = rbind(g, f)
        }
        
        # Calculate the mean of the specified pollutant column, ignoring NA values
        m = mean(g[[pollutant]], na.rm = TRUE)
        
        # Print the result
        print(m)  
}

