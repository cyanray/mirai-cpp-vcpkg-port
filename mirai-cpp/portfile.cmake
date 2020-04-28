vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/cyanray/mirai-cpp/archive/v0.5.0-alpha.zip"
    FILENAME "mirai-cpp 0.5.0-alpha.zip"
    SHA512 0443c8ed959722a884648f357bdce68feb35d151d27537ebb5e2a8c5d333870ddd1e700cba3b89f4cfbda3b17d814bee2cff191b4abd8f3eadeb37bc58459a26
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
