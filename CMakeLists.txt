cmake_minimum_required(VERSION 3.2 FATAL_ERROR)

project(Template
  VERSION 0.1
  LANGUAGES CXX
)

include(FeatureSummary)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wpedantic")

find_package(Eigen3 REQUIRED NO_MODULE)

add_executable(main main.cpp)

feature_summary(WHAT ALL)
