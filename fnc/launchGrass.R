

################################################################################
# Function to launch GRASS session in defined mapset
################################################################################

launchGrass <- function(locationIdx = 1, 
                        manual = T, 
                        gui = T,
                        gisdbase = "grassdata", 
                        mapset = "PERMANENT"){
  
  # Initiate session
  location <- list.files(gisdbase)[locationIdx]
  initGRASS(gisBase = Sys.getenv("GISBASE"), 
            home = Sys.getenv("HOME"),
            gisDbase = gisdbase,
            location = location,
            mapset = mapset, 
            override = T)
  
  # Get overview
  gmeta()
  execGRASS("g.list", type="all", flags=c("m", "t"))
  
  
  # Open help and GUI
  if(manual == T){execGRASS("g.manual", "i")}   
  if(gui == T){execGRASS("g.gui", ui="wxpython")}
  
}  