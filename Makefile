BUILD_DIR=build
ANTLR4_JAR=/usr/local/lib/antlr-4.9.1-complete.jar
ANTLR4_DIR=antlr4

all: build

build:
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake ../ -DANTLR_JAR_LOCATION=$(ANTLR4_JAR)
	$(MAKE) -C $(BUILD_DIR) -j 4

clean:
	@$(MAKE) -C $(BUILD_DIR) clean

test:
	./build/test/iora_test

antlr4-java:
	@mkdir -p ${ANTLR4_DIR}/java-target
	cd ${ANTLR4_DIR} && \
		java -jar ${ANTLR4_JAR} Iora.g4 -o java-target && \
		javac java-target/*.java

grun: 
	cd ${ANTLR4_DIR}/java-target && java org.antlr.v4.gui.TestRig Iora ${RULE} ${CMD} ${FILE}

NO_PHONY = /^(z):/
.PHONY: $(shell cat $(MAKEFILE_LIST) | awk -F':' '/^[a-z0-9_-]+:/ && !$(NO_PHONY) {print $$1}')
