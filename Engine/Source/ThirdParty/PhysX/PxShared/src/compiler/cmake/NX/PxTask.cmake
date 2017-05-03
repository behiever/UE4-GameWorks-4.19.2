#
# Build PxTask
#

SET(PXSHARED_SOURCE_DIR ${PROJECT_SOURCE_DIR}/../../../../src)

SET(LL_SOURCE_DIR ${PXSHARED_SOURCE_DIR}/task)

SET(PXTASK_PLATFORM_INCLUDES
	${NINTENDO_SDK_ROOT}/Include	
	${NINTENDO_SDK_ROOT}/Common/Configs/Targets/${NX_TARGET_DEVKIT}/Include
)

SET(PXTASK_COMPILE_DEFS 	
	# Common to all configurations
	${PHYSX_NX_COMPILE_DEFS};PX_FOUNDATION_DLL=0;

	$<$<CONFIG:debug>:${PHYSX_NX_DEBUG_COMPILE_DEFS};>
	$<$<CONFIG:checked>:${PHYSX_NX_CHECKED_COMPILE_DEFS};>
	$<$<CONFIG:profile>:${PHYSX_NX_PROFILE_COMPILE_DEFS};>
	$<$<CONFIG:release>:${PHYSX_NX_RELEASE_COMPILE_DEFS};>
)

# include PxTask common
INCLUDE(../common/PxTask.cmake)

FILE(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/PxTask.vcxproj.user" INPUT  "${CMAKE_MODULE_PATH}/NX/Microsoft.Cpp.${NX_TARGET_DEVKIT}.user.props" CONDITION  1)