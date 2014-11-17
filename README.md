CMAKE How to get Target File Location
================

I'm trying to get the location of a static library of another project. I tried

get_property(target_name TARGET Test PROPERTY LOCATION) but CMAKE gives the following error
    
    CMake Error at project.cmake:6 (get_property):
    The LOCATION property may not be read from target "A".
    Use the target name directly with add_custom_command, or use the generator
    expression $<TARGET_FILE>, as appropriate.

I tried to use the generator expression mentioned in the error message with no success. 

    MESSAGE($<TARGET_FILE:A>)

just outputs the exact same string, so the generator expression doesn't seem to be evaluated at all:

    $<TARGET_FILE:A>

I read the [Documentation](http://www.cmake.org/cmake/help/v3.0/manual/cmake-generator-expressions.7.html). In the first lines it mentions:

>   Generator expressions are evaluated **during build system generation** to produce 
    information specific to each build configuration.

If I'm understanding this correctly then at the time the message function is evaluated the generator expressions are not evaluated anymore? So what am I supposed to be doing in this case?
