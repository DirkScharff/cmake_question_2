cmake_minimum_required(VERSION 3.0.0)
SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON) 

if(MSVC)
	string (REPLACE "/EHsc" "/EHa" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
endif()

#Include all *.cmake and cmake/*.cmake files
file(GLOB cmake_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "cmake/*.cmake" "*.cmake")
foreach(cmake_file ${cmake_files})
  include(${cmake_file})
endforeach(cmake_file)

# Add all Subdirectories with a CMakeLists.txt
file(GLOB all_valid_subdirs RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*/CMakeLists.txt")
foreach(dir ${all_valid_subdirs})
    message(STATUS "path = ${dir}")
    if(${dir} MATCHES "^([^/]*)//CMakeLists.txt")
        string(REGEX REPLACE "^([^/]*)//CMakeLists.txt" "\\1" dir_trimmed ${dir})
        add_subdirectory(${dir_trimmed} ${config})
    endif()
endforeach(dir)
