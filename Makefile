
TARGET := main

CXX = clang++
CC = $(CXX)
CXXFLAGS = -std=c++14 -g -Wall -Wpedantic
LDFLAGS = -std=c++14

#SOURCES = $(wildcard *.cpp)
SOURCES = $(TARGET).cpp
OBJS = $(SOURCES:.cpp=.o)
HDRS = $(wildcard *.hpp)

all: $(TARGET)

$(TARGET): $(OBJS)

$(OBJS): $(HDRS)

.phony: clean

clean:
	$(RM) $(TARGET) $(OBJS)

