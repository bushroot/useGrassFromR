
#########################################################################
# Intitialize GRASS session with existing location
  # The script initializes the session and lists available raster and 
    #vector maps
#########################################################################



# Paths to the GRASS GIS launch script -----------------------------------------

# MS Windows (OSGEO4W)
# grass7bin <- "C:/OSGeo4W64/bin/grass70.bat"
# MS Windows
# grass7bin <- "C:/Program Files/GRASS GIS 7.0.3/grass70.bat"
# Linux
grass7bin <- "grass70" 
# Mac OS X
# grass7bin <- "/Applications/GRASS/GRASS-7.0.app/"   


# GRASS environment variable ---------------------------------------------------
  # (https://grass.osgeo.org/grass70/manuals/variables.html)
  # (https://grasswiki.osgeo.org/wiki/Working_with_GRASS_without_starting_it_explicitly)

# Set GISBASE environment variable 
  # (Needs to be set to the top-level directory of the GRASS installation)
startcmd <- paste(grass7bin, '--config', 'path')
p <- system(startcmd, ignore.stdout = F, ignore.stderr = F)
if (p != 0) {print(paste0("ERROR: Cannot find GRASS GIS 7 start script (",
                          startcmd, ")"))
} else {gisbase <- system(startcmd, intern = T)}
Sys.setenv(GISBASE = gisbase)

# Set skip mapset owner check 
  # ("True" disables the owner check and allows to access to mapset)
Sys.setenv(GRASS_SKIP_MAPSET_OWNER_CHECK = "true")

# Set HOME 
# Sys.setenv(HOME = getwd())

# Set GISRC path
  # (GISRC needs to contain the absolute path to a file containing settings for 
      # GISDBASE, LOCATION_NAME and MAPSET.)
# Sys.setenv(GISRC = paste0(getwd(), "/", ".grass7/gisrc"))



# Set PATHS for case of OSGEO4W
Sys.getenv("PATH")

newPath <- "C:\\OSGEO4~1\\bin"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))


newPath <- "C:\\OSGEO4~1\\apps\\grass\\grass-7.0.3\\lib"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))

newPath <- "C:\\OSGEO4~1\\apps\\grass\\grass-7.0.3\\bin"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))

 
newPath <- "/usr/lib/grass70/bin:/usr/lib/grass70/scripts:/home/rogerbaer/.grass7/addons/bin:/home/rogerbaer/.grass7/addons/scripts:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/scipts/grassPython:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/temporary:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/scipts/python:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/scipts/grassPython:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/temporary:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/scipts/python:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/scipts/grassPython:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/temporary:/home/rogerbaer/GIS/Workpackages/StudyAreaDelimitation/scipts/python:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))

newPath <- "usr/lib/grass70/gui/wxpython"
Sys.setenv("PYTHONPATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))


Sys.setenv(PYTHONPATH = "/usr/lib/grass70/etc/python:/usr/lib/grass70/gui/wxpython")

Sys.setenv(GRASS_PYTHON = "python")


# newPath <- "C:\\Program Files\\R\\R-3.2.4revised\\bin\\x64"
# Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
# 
# newPath <- "C:\\Users\\roger.baer\\AppData\\Roaming\\GRASS7\\addons\\bin"
# Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
# 
# newPath <- "E:\\RB\\GIS\\Workpackages\\LandClassification\\scripts\\py"
# Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
# 
# newPath <- "C:\\OSGEO4~1\\apps\\Python27\\Scripts\\py"
# Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
# 
# newPath <- "C:\\Program Files\\RStudio\\bin"
# Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))



# Initiate GRASS session -------------------------------------------------------


# Import libraries
library("rgrass7")
execGRASS("g.version")

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

# Get an overview of the location, its mapsets, and its data
execGRASS("g.gisenv", "n") 
gmeta()
execGRASS("g.mapset", "l")
execGRASS("g.list", type="all", mapset="*", c("m", "t"))


execGRASS("g.gui", ui="wxpython")



system("grass70 exit")
system("g.manual")





