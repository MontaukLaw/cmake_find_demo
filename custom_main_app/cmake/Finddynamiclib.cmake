# 在dlib_INCLUDE_DIR查找dlib.h
find_path(dlib_INCLUDE_DIR dynamiclib.h PATHS ${DLIB_INSTALL_PATH}/include)

# 在dlib_LIBRARY查找libdynamic_lib.lib
find_library(dlib_LIBRARY dynamiclib PATHS ${DLIB_INSTALL_PATH}/lib)

if(dlib_INCLUDE_DIR AND dlib_LIBRARY)
    message("found dlib")
    set(dlib_FOUND TRUE)    
    # 设置一个自定义的变量
    set(dlib_VERSION 1.0.0)

    # 获取dlib库的目录
    get_filename_component(dlib_LIBRARY_DIR ${dlib_LIBRARY} DIRECTORY)

endif()