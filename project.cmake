project(TEST)

add_library(A dummy.cpp)

add_library(B empty.cpp)

# This doesn't work
MESSAGE($<TARGET_FILE:A>)

# This is what I realy want to do but I end up with an defective project, because the string above is written to the project file
set_target_properties(B PROPERTIES STATIC_LIBRARY_FLAGS $<TARGET_FILE:A>)
# Explaination: I want to staticly link B into A, so that A contains B's symbols
