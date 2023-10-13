# automatically get zlib instead of relying on system wide installation

include(FetchContent)

FetchContent_Declare(
  zlib
  URL https://www.zlib.net/fossils/zlib-1.2.12.tar.gz
  URL_HASH MD5=5fc414a9726be31427b440b434d05f78
)

FetchContent_GetProperties(zlib)
if (NOT zlib_POPULATED)
	FetchContent_Populate(zlib)
	option(ASM686 "" OFF)
	add_subdirectory(${zlib_SOURCE_DIR} ${zlib_BINARY_DIR})

	add_library(ZLIB::ZLIB ALIAS zlibstatic)
endif()

set(zlib_FOUND TRUE)
set(zlib_INCLUDE_DIR ${zlib_SOURCE_DIR} ${zlib_BINARY_DIR})
set(zlib_LIBRARIES zlibstatic ZLIB::ZLIB)