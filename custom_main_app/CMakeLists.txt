cmake_minimum_required(VERSION 3.10)

project(main_app)

# 设置引入的cmake文件的路径
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(dynamiclib REQUIRED)

# 然后设置一个缓存变量, 给Findxxxlib.cmake使用
set(DLIB_INSTALL_PATH "./lib" CACHE PATH "dlib的安装路径")
message(STATUS "dlib的安装路径为: ${DLIB_INSTALL_PATH}")

if(dlib_FOUND)
    message(STATUS "dlib found")
    message(STATUS "dlib的头文件路径为: ${dlib_INCLUDE_DIR}")
    message(STATUS "dlib的库文件路径为: ${dlib_LIBRARY}")
    message(STATUS "dlib_VERSION: ${dlib_VERSION}")
else()
    message(FATAL_ERROR "dlib not found")
endif()

set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
set(CMAKE_INSTALL_RPATH ${dlib_LIBRARY_DIR})

add_executable(main_app src/main.cpp)

# 给要引用的头文件添加路径
target_include_directories(main_app PUBLIC ${dlib_INCLUDE_DIR})

# 给要引用的库添加路径
target_link_libraries(main_app ${dlib_LIBRARY})

install(TARGETS main_app
    RUNTIME DESTINATION bin
)