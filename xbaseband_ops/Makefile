HIGGS_ROOT = ../../..
Q_ENGINE_REPO=$(HIGGS_ROOT)/libs/q-engine
IP_LIBRARY_REPO=$(HIGGS_ROOT)/libs/ip-library
RISCV_BASEBAND_REPO=$(HIGGS_ROOT)/libs/riscv-baseband


all: gentemplate

gentemplate: bin/templer.js templates/xbaseband.h bin/gen.js
	chmod +x bin/templer.js
	npm run build


copy:
	cp src/xbaseband.h $(RISCV_BASEBAND_REPO)/c/inc/
	cp src/xvcordic.h $(RISCV_BASEBAND_REPO)/c/inc/

