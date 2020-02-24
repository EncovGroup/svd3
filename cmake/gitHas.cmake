find_package(Git QUIET)

if(Git_FOUND)

    execute_process(
            COMMAND
            ${GIT_EXECUTABLE} rev-parse --short HEAD
            RESULT_VARIABLE
            SHORT_HASH_RESULT
            OUTPUT_VARIABLE
            SHORT_HASH
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE)

#    message(STATUS "SHORT_HASH_RESULT ${SHORT_HASH_RESULT}")
#    message(STATUS "SHORT_HASH ${SHORT_HASH}")

    if(${SHORT_HASH_RESULT} EQUAL 0)
        set(SVD3_BUILD_VERSION "${SVD3_BUILD_VERSION}.${SHORT_HASH}")
    else()
        message(WARNING "Unable to find the git hash")
    endif()
else()
    message(WARNING "Unable to find git")
endif()