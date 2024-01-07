# define compiler 
CXX := g++

# the output 
OUTPUT := app

# dir for SFML (if there)
SFML_DIR := . 
# include and link if there
# -I$(SFML_DIR)/include
# -L$(SFML_DIR)/lib	

# compiler and linker flags
CXX_FLAGS := -03 -std=c++20 -Wno-unused-result
INCLUDES := -I./src -I./include/imgui/
LDFLAGS :=  -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -lGL 

SRC_FILES := $(wildcard src/*.cpp include/imgui/*.cpp)
OBJ_FILES := $(SRC_FILES:.cpp=.o)

all:$(OUTPUT)


# main executable requirements/command
$(OUTPUT): $(OBJ_FILES) Makefile
				$(CXX) $(OBJ_FILES) $(LDFLAGS) -o ./bin/$@

# how object files are compiled
.cpp:
			$(CXX) -c $(CXX_FLAGS) $(INCLUDES) $< -p $@


# command to clean all build files
clean: 
	rm -f $(OBJ_FILES) ./bin/app

# command to compile AND run
run: $(OUTPUT)
		cd bin && ./app && cd ..
# change directory to run and change directory back to root directory 