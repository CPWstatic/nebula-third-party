ExternalProject_Add(
    libunwind
    URL https://github.com/libunwind/libunwind/releases/download/v1.2.1/libunwind-1.2.1.tar.gz
    URL_HASH MD5=06ba9e60d92fd6f55cd9dadb084df19e
    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/libunwind
    TMP_DIR ${BUILD_INFO_DIR}
    STAMP_DIR ${BUILD_INFO_DIR}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/libunwind/source
    CONFIGURE_COMMAND
        ${common_configure_envs}
        ./configure ${common_configure_args}
                    --disable-minidebuginfo
                    --disable-shared --enable-static
    BUILD_COMMAND make -s -j${BUILDING_JOBS_NUM}
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND make -s install -j${BUILDING_JOBS_NUM}
    LOG_BUILD 1
    LOG_INSTALL 1
)
