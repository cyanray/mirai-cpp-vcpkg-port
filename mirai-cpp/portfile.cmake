vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/cyanray/mirai-cpp/archive/v0.4.4-alpha.zip"
    FILENAME "mirai-cpp 0.4.4-alpha.zip"
    SHA512 d085e57fb16c14bde83f8d6d767596645a9edc9564ec20d9d0e149a40f858be6b3a56696c139206396318db031aa780a469c75306062f9a3b1f3d95ad0c80103
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE} 
)


vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    OPTIONS 
        -DMIRAI_CPP_BUILD_EXAMPLES:BOOL=OFF
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/mirai-cpp)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include )

# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/mirai-cpp RENAME copyright)
