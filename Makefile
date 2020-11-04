
TARGET := main

CXX = clang++
CC = $(CXX)
CXXFLAGS = -std=c++17 -g -Wall -Wpedantic
LDFLAGS = -std=c++17

#SOURCES = $(wildcard *.cpp)
SOURCES = $(TARGET).cpp
OBJS = $(SOURCES:.cpp=.o)
HDRS = $(wildcard *.hpp)

all: $(TARGET)

$(TARGET): $(OBJS)

$(OBJS): $(HDRS)

.phony: clean install

clean:
	$(RM) $(TARGET) $(OBJS)

install: $(TARGET)
	mkdir -p $(DESTDIR)/bin
	cp $(TARGET) $(DESTDIR)/bin/$(TARGET)
