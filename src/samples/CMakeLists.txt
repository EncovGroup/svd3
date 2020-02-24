add_executable(testCpu main_cpu.cpp)
target_link_libraries(testCpu PUBLIC SVD3)
set_target_properties(testCpu PROPERTIES
        SOVERSION "${SVD3_SOVERSION}"
        VERSION "${SVD3_BUILD_VERSION}")
install(TARGETS testCpu DESTINATION ${SVD3_INSTALL_BINDIR})


add_executable(testGpu main_gpu.cpp)
target_link_libraries(testGpu PUBLIC SVD3)
set_target_properties(testGpu PROPERTIES
        SOVERSION "${SVD3_SOVERSION}"
        VERSION "${SVD3_BUILD_VERSION}")
install(TARGETS testGpu DESTINATION ${SVD3_INSTALL_BINDIR})

find_package(glm QUIET)
if(glm_FOUND)
    add_executable(testGlm main_glm.cpp)
    target_compile_definitions(testGlm PUBLIC -DGLM_ENABLE_EXPERIMENTAL)
    target_link_libraries(testGlm PUBLIC glm SVD3)
    set_target_properties(testGlm PROPERTIES
            SOVERSION "${SVD3_SOVERSION}"
            VERSION "${SVD3_BUILD_VERSION}")
    install(TARGETS testGlm DESTINATION ${SVD3_INSTALL_BINDIR})
else()
    message(STATUS "GLM not found - Sample will not be built")
endif()