
project(mbarcodescanner
  VERSION 0.0.1
  DESCRIPTION "Milo barcode scanner"
  LANGUAGES CXX
)

find_package(Qt5 COMPONENTS REQUIRED Core)

set(SOURCES MImageConverters.h MImageConverters.cpp MBarcodeCaptureFilter.h
  MBarcodeCaptureFilter.cpp)

set(OTHER_FILES README.md barcode_scanning.doxyfile
  camera_tricks.md how_to_build.md)

add_library(mbarcodescanner OBJECT ${SOURCES} ${OTHER_FILES})

target_include_directories(mbarcodescanner
  PUBLIC
  $<INSTALL_INTERFACE:include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_link_libraries(mbarcodescanner
  Qt5::Core
)

message("MBarCodeScanner: missing unit test!")
#add_subdirectory(tst_mbarcodescanner)
