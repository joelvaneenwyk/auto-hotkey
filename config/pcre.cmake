##
## AutoHotkey // PCRE
##

set(TARGET_NAME lib_pcre)

set(AHK_SOURCE_DIR ${CMAKE_SOURCE_DIR}/source)
set(PCRE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/source/lib_pcre)

set(AHK_PCRE_COMMON_FILES
    ${PCRE_SOURCE_DIR}/pcre/config.h
    ${PCRE_SOURCE_DIR}/pcre/pcre.h
    ${PCRE_SOURCE_DIR}/pcre/pcret.h
    ${PCRE_SOURCE_DIR}/pcre/ucp.h
)
set(AHK_PCRE_X86_FILES
    ${PCRE_SOURCE_DIR}/pcre/pcre_chartables.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_compile.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_config.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_dfa_exec.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_exec.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_fullinfo.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_get.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_globals.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_internal.h
    ${PCRE_SOURCE_DIR}/pcre/pcre_jit_compile.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_maketables.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_newline.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_ord2utf8.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_refcount.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_string_utils.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_study.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_tables.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_ucd.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_valid_utf8.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_version.c
    ${PCRE_SOURCE_DIR}/pcre/pcre_xclass.c
)
set(AHK_PCRE_X64_FILES
    ${PCRE_SOURCE_DIR}/pcre/pcre16_chartables.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_compile.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_config.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_exec.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_fullinfo.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_get.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_globals.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_jit_compile.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_newline.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_ord2utf16.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_refcount.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_string_utils.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_study.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_tables.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_ucd.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_valid_utf16.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_version.c
    ${PCRE_SOURCE_DIR}/pcre/pcre16_xclass.c
)
set(AHK_PCRE_SLJIT_FILES
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitConfig.h
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitConfigInternal.h
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitExecAllocator.c
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitLir.c
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitLir.h
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitUtils.c
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitNativeX86_common.c
)
set(AHK_PCRE_SLJIT_X86_FILES
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitNativeX86_32.c
)
set(AHK_PCRE_SLJIT_X64_FILES
    ${PCRE_SOURCE_DIR}/pcre/sljit/sljitNativeX86_64.c
)
set(AHK_PCRE_SOURCES
    ${AHK_PCRE_COMMON_FILES}
    ${AHK_PCRE_X86_FILES}

    # ${AHK_PCRE_SLJIT_FILES}
    # ${AHK_PCRE_SLJIT_X86_FILES}
)

add_library(${TARGET_NAME})
target_sources(${TARGET_NAME} PRIVATE
    ${AHK_PCRE_SOURCES}
)

set_target_properties(${TARGET_NAME}
    PROPERTIES COMPILE_FLAGS "\
        -DHAVE_CONFIG_H=1 -DUNICODE -D_UNICODE \
        -DLINK_SIZE=4 -DSLJIT_INLINE=inline -DSLJIT_CONFIG_AUTO=1 \
        -DSLJIT_VERBOSE=0 -DSLJIT_DEBUG=0 -DSLJIT_CONFIG_X86_64=1 \
        -DSLJIT_CONFIG_AUTO=0 -DLINK_SIZE=4 -DSLJIT_VERBOSE=0 -DSLJIT_DEBUG=0 \
        -DSLJIT_CONFIG_X86=0 -DSLJIT_CONFIG_X86_32=0 -DSLJIT_CONFIG_X86_64=1 \
        -DSLJIT_CONFIG_UNSUPPORTED=0 \
        -DSLJIT_CONFIG_DEBUG=0 -DSLJIT_CONFIG_STATIC=1 \
        -DPC \
")
target_include_directories(${TARGET_NAME} PRIVATE
    ${AHK_SOURCE_DIR}
    ${AHK_SOURCE_DIR}/lib
    ${AHK_SOURCE_DIR}/lib_pcre
    ${AHK_SOURCE_DIR}/lib_pcre/pcre
    ${AHK_SOURCE_DIR}/lib_pcre/pcre/sljit
    ${AHK_SOURCE_DIR}/libx64call
    ${AHK_SOURCE_DIR}/resources
    ${AHK_SOURCE_DIR}/scripts)

#
# Precompiled headers are not setup for PCRE library in Visual Studio project either so
# we do not enable it here to maintain consistency.
#
