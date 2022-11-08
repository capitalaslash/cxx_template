cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(Template
  VERSION 0.1
  LANGUAGES CXX
)

include(FetchContent)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wpedantic")

FetchContent_Declare(fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  GIT_TAG master
)
FetchContent_MakeAvailable(fmt)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(FeatureSummary)

include(CodeFormat)

find_package(Eigen3 REQUIRED NO_MODULE)

add_executable(main main.cpp)
target_link_libraries(main
  PUBLIC
    Eigen3::Eigen
    fmt::fmt
)

feature_summary(WHAT ALL)
