#	*************************************************************************
#	* YAT Yet Another Terminal											 	*
#	* (c) 2021 - 2022 Armando Pérez            						    	*
#	*************************************************************************

.PHONY: log logo build run tosd clean cleanroots 

# 	=========================================================================
# 	CONSTANTS
# 	=========================================================================

SOURCE			= YAT.Z8A
OUTPUT			= YAT.COM
ASM				= sjasmplus
SYMFILE			= $(basename $(SOURCE)).sym
LSTFILE			= $(basename $(SOURCE)).lst
SRC_DIR			= SRC
RES_DIR			= RES

# 	=========================================================================
# 	VARS
# 	=========================================================================



MAIN 			= $(SRC_DIR)/$(SOURCE)
ALL_SOURCES_GEN	= $(shell find  $(SRC_DIR) -type f -name "*.Z8A" ! -wholename "*.svn*" ! -wholename "*.DS_Store*" !  -regex "\./\..*" ! -regex "\." ) 


#	=========================================================================
# 	Includes & Defines
#	=========================================================================

INCLUDES 		= -I.	\
				  -I$(SRC_DIR) \
				  -I$(RES_DIR) \


DEFINES			= -DON=$(ON)\
				  -DOFF=$(OFF)\
				  -DDEBUG=$(DEBUG)\
				  -DFINAL=$(FINAL)\


# -	 All Target --------------------------------------------------------------

all: build

# -	 Clean Target ------------------------------------------------------------

clean:
	@$(RM) -R $(OUTPUT) $(LSTFILE) $(SYMFILE)


build: $(OUTPUT)

# -	 Build Target ------------------------------------------------------------


# - OUTPUT -------------------------------------------------------------------

$(OUTPUT): $(ALL_SOURCES_GEN)
	@$(ASM) --lst=$(LSTFILE) --sym=$(SYMFILE) $(INCLUDES) $(DEFINES) $(MAIN) 


log: 
	@echo $(ALL_SOURCES_GEN)
