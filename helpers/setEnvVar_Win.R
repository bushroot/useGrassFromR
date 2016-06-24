

################################################################################
# Set environement variables (in windows using OSGEO4W) for working 
  # with GRASS without starting it explicitly
################################################################################
# (https://grass.osgeo.org/grass70/manuals/variables.html)
# (https://grasswiki.osgeo.org/wiki/Working_with_GRASS_without_starting_it_explicitly)


# Shell environment variables --------------------------------------------------

# Set PYTHONPATH
Sys.setenv(
  PYTHONPATH = paste0("C:/OSGEO4~1/apps/grass/grass-7.0.3/etc/python;C:/OSGEO4~1/apps/grass/grass-7.0.3/gui/wxpython")
)

# Set PYTHONHOME
Sys.setenv(PYTHONHOME = "C:/OSGEO4~1/apps/Python27")

# Set PATHS for case of OSGEO4W
newPath <- "C:/OSGEO4~1/bin"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
newPath <- "C:/Program Files/GRASS GIS 7.0.3/lib"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
newPath <- "C:/Program Files/GRASS GIS 7.0.3/bin"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))
newPath <- "C:/Program Files/GRASS GIS 7.0.3/Python27/Scripts"
Sys.setenv("PATH" = paste(newPath, Sys.getenv("PATH"), sep=.Platform$path.sep))

# Set HOME 
# (directory in which to create the .gisrc file)
Sys.setenv(HOME = getwd())

# Set language of messages
Sys.setenv("LANG" = "en")


# GRASS related shell environment variables ------------------------------------

# Set GISBASE
  # (directory where GRASS lives)
Sys.setenv(GISBASE = "C:/OSGEO4~1/apps/grass/grass-7.0.3")

# Set GISRC path
  # (GISRC absolute path to file containing settings for GISDBASE, LOCATION_NAME and MAPSET.)
# Sys.setenv(GISRC = paste0(getwd(), "/", ".grass7/rc"))
# Sys.setenv(GISRC = paste0(getwd(), "/.gisrc"))
# Sys.setenv(GISRC = ".gisrc")

 # Set GRASS_ADDON_BASE

# Set GRASS_SKIP_MAPSET_OWNER_CHECK
  # ("True" disables the owner check and allows to access to mapset)
Sys.setenv(GRASS_SKIP_MAPSET_OWNER_CHECK = "true")

# Set GRASS_PYTHON
  # (To override Python executable)
Sys.setenv(GRASS_PYTHON = "C:/Program Files/GRASS GIS 7.0.3/extrabin/python.exe")






