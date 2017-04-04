cmake_minimum_required(VERSION 3.2 FATAL_ERROR)

project(Template
  VERSION 0.1
  LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wpedantic")

add_executable(main main.cpp)

