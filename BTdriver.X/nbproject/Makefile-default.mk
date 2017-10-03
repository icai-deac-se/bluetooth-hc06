#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=DriverPicTrainer/adc.c DriverPicTrainer/config.c DriverPicTrainer/idle.c DriverPicTrainer/pwm.c DriverPicTrainer/uart.c DriverPicTrainer/uart2.c btconfig.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/DriverPicTrainer/adc.o ${OBJECTDIR}/DriverPicTrainer/config.o ${OBJECTDIR}/DriverPicTrainer/idle.o ${OBJECTDIR}/DriverPicTrainer/pwm.o ${OBJECTDIR}/DriverPicTrainer/uart.o ${OBJECTDIR}/DriverPicTrainer/uart2.o ${OBJECTDIR}/btconfig.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/DriverPicTrainer/adc.o.d ${OBJECTDIR}/DriverPicTrainer/config.o.d ${OBJECTDIR}/DriverPicTrainer/idle.o.d ${OBJECTDIR}/DriverPicTrainer/pwm.o.d ${OBJECTDIR}/DriverPicTrainer/uart.o.d ${OBJECTDIR}/DriverPicTrainer/uart2.o.d ${OBJECTDIR}/btconfig.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/DriverPicTrainer/adc.o ${OBJECTDIR}/DriverPicTrainer/config.o ${OBJECTDIR}/DriverPicTrainer/idle.o ${OBJECTDIR}/DriverPicTrainer/pwm.o ${OBJECTDIR}/DriverPicTrainer/uart.o ${OBJECTDIR}/DriverPicTrainer/uart2.o ${OBJECTDIR}/btconfig.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=DriverPicTrainer/adc.c DriverPicTrainer/config.c DriverPicTrainer/idle.c DriverPicTrainer/pwm.c DriverPicTrainer/uart.c DriverPicTrainer/uart2.c btconfig.c main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC802
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC802.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/DriverPicTrainer/adc.o: DriverPicTrainer/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/adc.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/adc.c  -o ${OBJECTDIR}/DriverPicTrainer/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/config.o: DriverPicTrainer/config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/config.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/config.c  -o ${OBJECTDIR}/DriverPicTrainer/config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/idle.o: DriverPicTrainer/idle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/idle.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/idle.c  -o ${OBJECTDIR}/DriverPicTrainer/idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/idle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/idle.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/pwm.o: DriverPicTrainer/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/pwm.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/pwm.c  -o ${OBJECTDIR}/DriverPicTrainer/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/uart.o: DriverPicTrainer/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/uart.c  -o ${OBJECTDIR}/DriverPicTrainer/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/uart2.o: DriverPicTrainer/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart2.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/uart2.c  -o ${OBJECTDIR}/DriverPicTrainer/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/btconfig.o: btconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/btconfig.o.d 
	@${RM} ${OBJECTDIR}/btconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  btconfig.c  -o ${OBJECTDIR}/btconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/btconfig.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/btconfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/DriverPicTrainer/adc.o: DriverPicTrainer/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/adc.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/adc.c  -o ${OBJECTDIR}/DriverPicTrainer/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/adc.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/config.o: DriverPicTrainer/config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/config.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/config.c  -o ${OBJECTDIR}/DriverPicTrainer/config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/config.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/idle.o: DriverPicTrainer/idle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/idle.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/idle.c  -o ${OBJECTDIR}/DriverPicTrainer/idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/idle.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/idle.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/pwm.o: DriverPicTrainer/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/pwm.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/pwm.c  -o ${OBJECTDIR}/DriverPicTrainer/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/pwm.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/uart.o: DriverPicTrainer/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/uart.c  -o ${OBJECTDIR}/DriverPicTrainer/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/uart.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/DriverPicTrainer/uart2.o: DriverPicTrainer/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/DriverPicTrainer" 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart2.o.d 
	@${RM} ${OBJECTDIR}/DriverPicTrainer/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DriverPicTrainer/uart2.c  -o ${OBJECTDIR}/DriverPicTrainer/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/DriverPicTrainer/uart2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/DriverPicTrainer/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/btconfig.o: btconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/btconfig.o.d 
	@${RM} ${OBJECTDIR}/btconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  btconfig.c  -o ${OBJECTDIR}/btconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/btconfig.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/btconfig.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/BTdriver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
