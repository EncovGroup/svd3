# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2020-02-24
### Added
- exporting samples optionally in the preferred directories of vcpkg

## [1.0.1] - 2020-02-24
### Added
- exporting samples
- postfix `d` for debug
- \[developers\] optional versioning of building products using git hash

### Changed
- all build products can be found at the same place in `${PROJECT_BINARY_DIR}/${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}`
- so version set to major and build version to full project version

### Removed
- duplicated cmake code

## [1.0.0] - 2018-08-23
### Added
- CHANGELOG.md to keep track of changes wrt the original version
- INSTALL.md to explain building instructions
- LICENSE.md
- CMake files for building

### Changed
- moved all files in a more standard project tree
- renamed `main.cpp` into `main_gpu.cpp`

### Removed
- old makefiles