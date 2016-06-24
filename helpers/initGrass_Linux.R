
#########################################################################
# Intitialize GRASS session with existing location
  # The script initializes the session and lists available raster and 
    #vector maps
#########################################################################


# GRASS environment variables --------------------------------------------------
  # (https://grass.osgeo.org/grass70/manuals/variables.html)
  # (https://grasswiki.osgeo.org/wiki/Working_with_GRASS_without_starting_it_explicitly)

# Set GISBASE 
  # (Needs to be set to the top-level directory of the GRASS installation)
grass7bin <- "grass70" 
startcmd <- paste(grass7bin, '--config', 'path')
p <- system(startcmd, ignore.stdout = F, ignore.stderr = F)
if (p != 0) {print(paste0("ERROR: Cannot find GRASS GIS 7 start script (",
                          startcmd, ")"))
} else {gisbase <- system(startcmd, intern = T)}
Sys.setenv(GISBASE = gisbase)

# Set SKIP MAPSET OWNER CHECK 
  # ("True" disables the owner check and allows to access to mapset)
Sys.setenv(GRASS_SKIP_MAPSET_OWNER_CHECK = "true")

# Set HOME 
Sys.setenv(HOME = getwd())


Sys.setenv(GISDBASE = paste0(getwd(), "grassdata"))

Sys.setenv(LOCATION_NAME = "nc_basic_spm_grass7")

Sys.setenv(MAPSET = "PERMANENT")

Sys.setenv("GISDBASE" = "grassdata")


# Set GISRC path
  # (GISRC needs to contain the absolute path to a file containing settings for 
      # GISDBASE, LOCATION_NAME and MAPSET.)
# Sys.setenv(GISRC = paste0(getwd(), "/", ".grass7/gisrc"))


# Set PYTHONPATH
Sys.setenv(PYTHONPATH = "/usr/lib/grass70/etc/python:/usr/lib/grass70/gui/wxpython")

# Set GRASS_PYTHON
Sys.setenv(GRASS_PYTHON = "python")

# Set GRASS_ADDON_BASE
Sys.setenv(GRASS_ADDON_BASE = paste0(getwd(), "/", ".grass7/addons"))

# Set language of messages
Sys.setenv("LANG" = "en")



# Initiate GRASS session -------------------------------------------------------

# Import libraries
library("rgrass7")

# Locate data 
gisdbase <- "grassdata"
location <- "nc_basic_spm_grass7"
mapset <- "PERMANENT"

# Initiate session
initGRASS(gisBase = gisbase, 
          home = getwd(), 
          gisDbase = gisdbase,
          location = location,
          mapset = mapset, 
          override = T)


initGRASS(gisBase = gisbase, 
         home = getwd(), 
         gisDbase = Sys.getenv("GISDBASE"),
         location = Sys.getenv("LOCATION_NAME"),
         mapset = Sys.getenv("MAPSET")
         # , 
         # override = T
         )



# Get an overview of the location, its mapsets, and its data
execGRASS("g.gisenv", "n") 
gmeta()
execGRASS("g.mapset", "l")
execGRASS("g.list", type="all", mapset="*", c("m", "t"))



# Launch GUI -------------------------------------------------------------------
execGRASS("g.gui", ui="wxpython")



system("grass70 exit")
system("g.manual")





