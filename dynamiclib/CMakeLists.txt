cmake_minimum_required(VERSION 3.10)

project(dynamiclib)

# 将源码编译成动态库
add_library(${PROJECT_NAME} SHARED src/dynamiclib.cpp)

# 添加头文件目录
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)

# 单独设置动态库的头文件, 方便后面install
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${PROJECT_SOURCE_DIR}/include/dynamiclib.h")

# 安装目录
install(
    TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION lib # 动态库
    PUBLIC_HEADER DESTINATION include # 公共头文件
)
