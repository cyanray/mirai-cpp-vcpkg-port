vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/cyanray/mirai-cpp/archive/v0.3.0-alpha.zip"
    FILENAME "mirai-cpp 0.3.0.zip"
    SHA512 2591dc50dc856b7f104b2f4ce4c712e5f3f69a84a2597aa5914e312bf95db385f61bb314e645c9a131a3f46ba5189911fea5cf08828a3231dded9f4bb784f67a
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

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug )

# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/mirai-cpp RENAME copyright)

