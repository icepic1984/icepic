cmake_minimum_required(VERSION 3.23)

project(super
    VERSION 0.1.0
    DESCRIPTION "Test test library")

find_package(icepic)

add_executable(super main.c)
target_link_libraries(super icepic::icepic)


