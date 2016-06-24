


################################################################################
# Load all tif files of a given folder to the PERMANENT mapset

  # inp dirPath: path of folder to scan for the tif-files
################################################################################



importFiles <- function(dirPath) {

  # Set target mapset
  # execGRASS("g.mapset", mapset="PERMANENT")  
   
  # List all tif files
  files <- list.files(dirPath, pattern = "*\\.tif$") 
  print(files)

  execGRASS("r.mask", vector="studyArea")
  
  # Define function
  for (i in files) {
    
    # Simplify mapname
    strele <- unlist(strsplit(i, split = "[_\\.]"))
    mapName <- paste(strele[-c(1, length(strele))], collapse = "_")
    print(mapName)
    
    # Import files
    execGRASS("r.import", extent="region", input=paste0(dirPath, "/", i), 
              output="_tmp")
    
    # Crop imported map according to mask
    mapcexp <- paste0(mapName, "=_tmp")
    execGRASS("r.mapcalc", expression=mapcexp)
    execGRASS("g.remove", type="raster", name="_tmp", "f")

  }
  
}
  