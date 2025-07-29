corr <- function(directory, threshold = 0) {
        
        # Load complete function
        source("complete.R")
        
        # List all files in the specified directory 
        basefiles <- list.files(directory)
        
        # Complete cases 
        compl <- complete(directory)
        
        # ID above completness threshold
        cc.thres <- compl$id[compl$nobs > threshold]
        
        # Loop through the ID >= threshold
        for(i in seq_along(cc.thres)){
                
                # Get the file corresponding to the current id
                path <- paste0(directory, "/", basefiles[cc.thres[i]])
                
                # Read the CSV file
                f <- read.csv(path)
                f <- na.omit(f) 
                
                # # Correlate
                cr <- numeric()
                cr <- c(cr, cor(f$sulfate, f$nitrate))
                
                
        }
        
        return(cr)
}
