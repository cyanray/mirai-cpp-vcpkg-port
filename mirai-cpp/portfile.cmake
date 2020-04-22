vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/cyanray/mirai-cpp/archive/v0.4.2.zip"
    FILENAME "mirai-cpp 0.4.2.zip"
    SHA512 72f45c1127b131ecff1070f45c660620709acf8c56f4a7019464d44a709ef72d43002f55c928f87031bf6b886bbab109bd0c93a2f53fc6e4f68b93de76ad5762
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

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include )

# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/mirai-cpp RENAME copyright)

