cmake_minimum_required(VERSION 3.0)

project(${PROJECT_NAME} CXX)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

add_subdirectory(muduo)
include_directories("muduo")

if(${PROJECT_NAME}  STREQUAL echo)
    AUX_SOURCE_DIRECTORY(../src/echo dir_srcs)
elseif(${PROJECT_NAME}  STREQUAL http)
    AUX_SOURCE_DIRECTORY(../src/http dir_srcs)
else()
    MESSAGE(FATAL_ERROR  PROJECT_NAME:${PROJECT_NAME}, no match,exit!)
endif()

message(STATUS src:${dir_srcs})
add_executable(${PROJECT_NAME} ${dir_srcs})
target_link_libraries(${PROJECT_NAME} muduo_net)
target_link_libraries(${PROJECT_NAME} muduo_base)
target_link_libraries(${PROJECT_NAME} muduo_http)
target_link_libraries(${PROJECT_NAME} pthread rt)

