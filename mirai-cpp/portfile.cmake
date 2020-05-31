vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/cyanray/mirai-cpp/archive/v0.6.6-alpha.zip"
    FILENAME "mirai-cpp 0.6.6-alpha.zip"
    SHA512 0773483e6511cdb14c22036e8d7adec550c9fc9486b6f3298528c0ac9197f6d837b69a840a25e44d9427f45c6c21475c7f52dbc9eb21c492778e37aaa31efe03
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
