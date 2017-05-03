#
# Build PhysXVehicle
#

SET(PHYSX_SOURCE_DIR ${PROJECT_SOURCE_DIR}/../../../)

SET(LL_SOURCE_DIR ${PHYSX_SOURCE_DIR}/PhysXVehicle/src)

SET(PHYSXVEHICLE_PLATFORM_INCLUDES
	${NINTENDO_SDK_ROOT}/Include	
	${NINTENDO_SDK_ROOT}/Common/Configs/Targets/${NX_TARGET_DEVKIT}/Include
)

# Use generator expressions to set config specific preprocessor definitions
SET(PHYSXVEHICLE_COMPILE_DEFS

	# Common to all configurations
	${PHYSX_NX_COMPILE_DEFS};

	$<$<CONFIG:debug>:${PHYSX_NX_DEBUG_COMPILE_DEFS};>
	$<$<CONFIG:checked>:${PHYSX_NX_CHECKED_COMPILE_DEFS};>
	$<$<CONFIG:profile>:${PHYSX_NX_PROFILE_COMPILE_DEFS};>
	$<$<CONFIG:release>:${PHYSX_NX_RELEASE_COMPILE_DEFS};>
)

# include common PhysXVehicle settings
INCLUDE(../common/PhysXVehicle.cmake)

FILE(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/PhysXVehicle.vcxproj.user" INPUT  "${CMAKE_MODULE_PATH}/NX/Microsoft.Cpp.${NX_TARGET_DEVKIT}.user.props" CONDITION  1)