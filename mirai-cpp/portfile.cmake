vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/cyanray/mirai-cpp/archive/v1.0.0.zip"
    FILENAME "mirai-cpp 1.0.0.zip"
    SHA512 714679260049bd7fd2bc63de1d45619748d3fe19046da65b5badb1537d9e844f062359ecf6358069c0943532cf7183f274ef974b879695a4a1b621ccaa998040
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
