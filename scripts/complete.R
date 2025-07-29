complete <- function(directory, id = 1:332){
        
        # List all files in the specified directory 
        basefiles <- list.files(directory)
        
        # Initialize an empty data frame to store combined data
        g <- data.frame(id= id, nobs = NA)
        
        # Loop through the selected file IDs
        for(i in seq_along(id)){
                
                # Get the file corresponding to the current id
                path <- paste0(directory, "/", basefiles[id[i]])
                
                # Read the CSV file
                f = read.csv(path) 
                
                # Count complete cases (both sulfate and nitrate not NA)
                nobs <- sum(complete.cases(f$sulfate, f$nitrate))
                
                # Add to data frame
                g[i, "nobs"] <- nobs
        }
        
        return(g)
}


