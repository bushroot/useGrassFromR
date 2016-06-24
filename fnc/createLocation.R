

################################################################################
# Function to create a location and set the region of the PERMANENT mapset

  # inp location: name of location to create (str)
  # inp crs: epsg code of input data (num)
  # inp resolu: cell resolution (str)
################################################################################



createLocation <- function(location, crs=32637, resolu="30") {
  
  # Locate data 
  gisdbase <- "grassdata"
  mapset <- "PERMANENT"
  
  # Initiate session
  initGRASS(gisBase = Sys.getenv("GISBASE"), 
            home = Sys.getenv("HOME"),
            gisDbase = gisdbase,
            location = location,
            mapset = mapset, 
            override = T)
  
  # Overview commands
  execGRASS("g.gisenv", "n") 
  execGRASS("g.list", type="all", mapset="*", c("m", "t"))
  
  # Set CRS
  execGRASS("g.proj", "c", epsg=crs)
  execGRASS("g.proj", "g")
  
  # Import study area layer
  execGRASS("v.import", 
            input="input/tz/studyArea/outlineBuffer_32637.shp",
            layer="outlineBuffer_32637", 
            output="studyArea", 
            extent="input")
  
  # Set region (notably resolution)
  execGRASS("g.region", vector="studyArea", c("s","a"), res=resolu)
  execGRASS("g.region", "p")
  execGRASS("g.region", save="studyRegion")
  
  # Create mask from study area layer
  execGRASS("r.mask", vector="studyArea")
  
}