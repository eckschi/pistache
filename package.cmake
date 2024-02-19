list(
    APPEND
    PUBLIC_INCLUDES
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/async.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/base64.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/client.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/common.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/config.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/cookie.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/description.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/endpoint.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/errors.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/flags.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/http_defs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/http.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/http_header.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/http_headers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/iterator_adapter.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/listener.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/log.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/mailbox.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/mime.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/meta.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/net.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/os.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/peer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/prototype.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/reactor.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/route_bind.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/router.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/ssl_wrappers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/stream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/string_logger.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/tcp.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/timer_pool.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/transport.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/type_checkers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/typeid.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/utils.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/pistache/view.h
)

set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_SOURCE_DIR}/LICENSE)
set(CPACK_RESOURCE_FILE_README ${CMAKE_SOURCE_DIR}/README.md)

set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/local")
set(CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST_ADDITION
    "/usr/local"
    "/usr/local/include"
    "/usr/local/include/${PROJECT_NAME}"
    "/usr/local/lib64"
    "/usr/local/share"
    "/usr/local/share/${PROJECT_NAME}")

install(FILES ${PUBLIC_INCLUDES} DESTINATION include/pistache)

install(
    TARGETS pistache_shared pistache_static
    LIBRARY DESTINATION lib64
    ARCHIVE DESTINATION lib64
)

set(CPACK_SYSTEM_NAME x86_64)
set(CPACK_GENERATOR "RPM")
set(CPACK_SOURCE_GENERATOR "RPM")

set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_RPM_PACKAGE_ARCHITECTURE ${CPACK_PACKAGE_ARCHITECTURE})
set(CPACK_RPM_PACKAGE_RELEASE ${RPM_RELEASE})
set(CPACK_RPM_PACKAGE_LICENSE ${PROJECT_LICENSE})
set(CPACK_RPM_PACKAGE_DESCRIPTION "RPM Version Info: ${RPM_VERSION_INFO}")
set(CPACK_RPM_PACKAGE_URL ${PROJECT_URL})
set(CPACK_RPM_PACKAGE_REQUIRES ${PACKAGE_DEPENDENCIES})
set(CPACK_RPM_SPEC_INSTALL_POST "/bin/true")

include(CPack)
