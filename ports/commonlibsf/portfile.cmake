
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Starfield-Reverse-Engineering/CommonLibSF
  REF 1cd48a3d41e8e20de8db1590558aaa2afa6cfcc0
  SHA512 6DC9F8611BAC39F5DECCB154D1946DECA2BEFE21491185244C5272C973123FB5DA562EABAD5A411F964E1025B5B89D82CA852290DC6EC3C7929BA7629524AC0A
  HEAD_REF main)
 
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(
  PACKAGE_NAME CommonLibSF 
  CONFIG_PATH lib/cmake)
vcpkg_copy_pdbs()

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/CommonLibSF")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF")

file(
  INSTALL "${SOURCE_PATH}/COPYING"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
