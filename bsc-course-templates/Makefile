SHELL=/bin/bash
PROJECT_TOP=config/project.toplevel
PROJECT_LIST=config/project.files
PROJECT_FORCE=config/project.force
PROJECT_DEVICE=config/project.device
PROJECT_OPTIONS=config/project.options
PROJECT_UCF=config/project.ucf
PROJECT_XILINX=config/project.xilinx
MODELSIM_INI=config/modelsim.ini

REL_PATH=.
TOPLEVEL := $(shell cat $(REL_PATH)/$(PROJECT_TOP))
PROJECT_EDF=sandbox/$(TOPLEVEL).edf
CP := $(shell which cp)

.PHONY: default clean sim sandbox %

define do_modelsim
if test ! -f $(PROJECT_LIST); then\
echo ""; echo ""; echo "ERROR: No file $(PROJECT_LIST) found!"; else\
if test ! -f $(PROJECT_FORCE); then \
echo ""; echo ""; echo "ERROR: No file $(PROJECT_FORCE) found!"; else\
echo "INFO: Performing automated simulation...";\
mkdir -p sandbox;\
cd sandbox;\
echo "PROJECT_LIST=$(PROJECT_LIST)" > Makefile.modelsim;\
echo "PROJECT_FORCE=$(PROJECT_FORCE)" >> Makefile.modelsim;\
echo "REL_PATH=.." >> Makefile.modelsim;\
cat ../Makefile.modelsim >> Makefile.modelsim;\
$(MAKE) -f Makefile.modelsim;\
fi; fi
endef #do modelsim

define do_synth
if test ! -f $(PROJECT_TOP); then\
echo ""; echo ""; echo "ERROR: No file $(PROJECT_TOP) found!"; else\
if test ! -f $(PROJECT_LIST); then\
echo ""; echo ""; echo "ERROR: No file $(PROJECT_LIST) found!"; else\
if test ! -f $(PROJECT_DEVICE); then \
echo ""; echo ""; echo "ERROR: No file $(PROJECT_DEVICE) found!"; else\
echo "INFO: Performing automated synthesis...";\
mkdir -p sandbox;\
cd sandbox;\
echo "PROJECT_TOP=$(PROJECT_TOP)" > Makefile.synthesis;\
echo "PROJECT_LIST=$(PROJECT_LIST)" >> Makefile.synthesis;\
echo "PROJECT_OPTIONS=$(PROJECT_OPTIONS)" >> Makefile.synthesis;\
echo "PROJECT_DEVICE=$(PROJECT_DEVICE)" >> Makefile.synthesis;\
echo "REL_PATH=.." >> Makefile.synthesis;\
cat ../Makefile.synthesis >> Makefile.synthesis;\
$(MAKE) -f Makefile.synthesis;\
fi; fi ; fi
endef

define make_xilinx_bit
if test ! -f $(PROJECT_TOP); then\
echo ""; echo ""; echo "ERROR: No file $(PROJECT_TOP) found!"; else\
if test ! -f $(PROJECT_UCF); then\
echo ""; echo ""; echo "ERROR: No file $(PROJECT_UCF) found!"; else\
if test ! -f $(PROJECT_DEVICE); then \
echo ""; echo ""; echo "ERROR: No file $(PROJECT_DEVICE) found!"; else\
if test ! -f $(PROJECT_XILINX); then \
echo ""; echo ""; echo "ERROR: No file $(PROJECT_XILINX) found!"; else\
echo "INFO: Performing automated xilinx bitfile generation...";\
mkdir -p sandbox;\
cd sandbox;\
echo "PROJECT_TOP=$(PROJECT_TOP)" > Makefile.xilinx;\
echo "PROJECT_UCF=$(PROJECT_UCF)" >> Makefile.xilinx;\
echo "PROJECT_XILINX=$(PROJECT_XILINX)" >> Makefile.xilinx;\
echo "PROJECT_DEVICE=$(PROJECT_DEVICE)" >> Makefile.xilinx;\
echo "REL_PATH=.." >> Makefile.xilinx;\
cat ../Makefile.xilinx >> Makefile.xilinx;\
$(MAKE) -f Makefile.xilinx;\
fi; fi ; fi ; fi
endef

define make_template
mkdir -p config
mkdir -p doc
mkdir -p sandbox
mkdir -p vhdl
endef

define make_sandbox
 if test ! -d sandbox ; then\
  mkdir -p sandbox;\
 fi;
endef

define make_config
 if test ! -f $(REL_PATH)/$(MODELSIM_INI); then\
  echo "INFO: The file $(REL_PATH)/$(MODELSIM_INI) does not exist!"; else\
  $(CP) $(REL_PATH)/$(MODELSIM_INI) sandbox/ ;\
 fi;
endef


default:
	@echo "==========================================================="
	@echo " Possible make targets are:"
	@echo ""
	@echo " clean: Remove all temporary files"
	@echo ""
	@echo " sim: Perform an automated simulation. The files"
	@echo "      project.files and project.force in the directory"
	@echo "      config/ must exist for this command to work"
	@echo ""
	@echo " synth: Perform an automated synthesis. The files"
	@echo "        project.files, project.device, and project.toplevel"
	@echo "        in the directory config/ must exist for this "
	@echo "        command to work"
	@echo ""
	@echo " xilinx_bit: Generate a Xilinx bitfile for download. The"
	@echo "             files project.ucf, project.device,"
	@echo "             project.toplevel, and project.xilinx"
	@echo "             in the directory config/ must exist for this "
	@echo "             command to work"
	@echo ""
	@echo "==========================================================="

clean: sandbox
	@cd sandbox; find -type d | grep -v CVS | grep "/" | xargs rm -rf ; find -type f | grep -v CVS | xargs rm -f

config: clean sandbox
	@$(make_config)

sandbox:
	@$(make_sandbox)

sim: sandbox config
	@$(do_modelsim)

synth: sandbox
	@$(do_synth)

xilinx_bit: $(PROJECT_EDF) sandbox
	@$(make_xilinx_bit)

template:
	@$(make_template)

$(PROJECT_EDF) :
	@$(do_synth)
