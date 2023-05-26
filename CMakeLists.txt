cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(Template
  VERSION 0.1
  LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wpedantic")

include(FetchContent)
FetchContent_Declare(fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  GIT_TAG master
)
FetchContent_MakeAvailable(fmt)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(FeatureSummary)

# include(CodeFormat)

find_package(Eigen3 REQUIRED NO_MODULE)

add_executable(main)

set(SRC_FILES
  main.cpp
)
# set(HEADER_FILES
#   header.hpp
# )

target_sources(main
	PRIVATE ${SRC_FILES}
	# PUBLIC ${HEADER_FILES}
)
target_link_libraries(main
  PUBLIC
    Eigen3::Eigen
    fmt::fmt
)

feature_summary(WHAT ALL)

find_program(CLANGFORMAT clang-format)
if (CLANGFORMAT)
  add_custom_target(format
    COMMAND ${CLANGFORMAT}
    -i
    ${SRC_FILES} ${HEADER_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  )
else()
  add_custom_target(format
    COMMAND echo "clang-format could not be found"
  )
endif()

