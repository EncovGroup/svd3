set(SVD3_SOURCES svd3_cuda/svd3.cu)
set(SVD3_HEADESR svd3.h svd3_cuda/svd3_cuda.h)


CUDA_ADD_LIBRARY(SVD3 ${SVD3_SOURCES} ${SVD3_HEADESR})

# the ".." is needed to build as dependency to be able to include as <SVD3/....>
target_include_directories(SVD3 PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/>)

set_target_properties(SVD3 PROPERTIES
        SOVERSION "${SVD3_SOVERSION}"
        VERSION "${SVD3_BUILD_VERSION}")

target_compile_features(SVD3 PUBLIC cxx_std_11)
set_target_properties(SVD3 PROPERTIES POSITION_INDEPENDENT_CODE ON)
set_target_properties(SVD3 PROPERTIES DEBUG_POSTFIX "d")

# Targets:
#   * header location after install: <prefix>/include/
install(TARGETS SVD3
        EXPORT "${targets_export_name}"
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${SVD3_INSTALL_BINDIR}
        INCLUDES DESTINATION "${include_install_dir}/svd3")

install(DIRECTORY ${PROJECT_SOURCE_DIR}/src/svd3
        DESTINATION "${include_install_dir}/svd3"
        FILES_MATCHING PATTERN "*.hpp" PATTERN "*.h")
