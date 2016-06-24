
#########################################################################
# Intitialize GRASS session with existing location
  # The script initializes the session and lists available raster and 
    #vector maps
#########################################################################

# Import libraries
library("rgrass7")

# Set environment variables
source("scripts/archive/helpers/setEnvVar_OSGEO4W.R")



# Initiate GRASS session -------------------------------------------------------

# Locate data 
gisdbase <- "grassdata"
location <- "tz"
mapset <- "PERMANENT"

# Initiate session
initGRASS(gisBase = Sys.getenv("GISBASE"), 
          home = Sys.getenv("HOME"),
          gisDbase = gisdbase,
          location = location,
          mapset = mapset, 
          override = T)


# Get an overview of the location, its mapsets, and its data
execGRASS("g.gisenv", "n") 
gmeta()
execGRASS("g.mapset", "l")
execGRASS("g.list", type="all", mapset="*", c("m", "t"))


# Open help and GUI
execGRASS("g.gui", ui="wxpython")
execGRASS("g.manual", "i") 





