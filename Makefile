GRADLEW           ?= ./gradlew


help: Makefile
	@echo
	@echo " Choose a command to run in Osaka:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


## gradlew: Run Gradle Command
gradlew:
	@echo ">> ============= Run Gradle Command ============= <<"
	$(GRADLEW) ${ARGS}


## assemble: Gradle assemble code task
assemble:
	@echo ">> ============= Gradle assemble code task ============= <<"
	$(GRADLEW) assemble --info


## check: Gradle check code task
check:
	@echo ">> ============= Gradle check code task ============= <<"
	$(GRADLEW) check --info


## test: Runs the unit tests.
test:
	@echo ">> ============= Runs the unit tests ============= <<"
	$(GRADLEW) test --info


## build: Gradle build jar task
build:
	@echo ">> ============= Gradle build jar task ============= <<"
	$(GRADLEW) build --info


## build_scan: Gradle build jar and scan report task
build_scan:
	@echo ">> ============= Gradle build jar and scan report task ============= <<"
	$(GRADLEW) build --scan


## clean: Deletes the build directory.
clean:
	@echo ">> ============= Deletes the build directory ============= <<"
	$(GRADLEW) clean


## dependencies: Displays all dependencies declared in root project
dependencies:
	@echo ">> ============= Displays all dependencies declared in root project ============= <<"
	$(GRADLEW) dependencies


## javadoc: Generates Javadoc API documentation for the main source code
javadoc:
	@echo ">> ============= Generates Javadoc API documentation for the main source code ============= <<"
	$(GRADLEW) javadoc


## properties: Displays the properties of root project
properties:
	@echo ">> ============= Displays the properties of root project ============= <<"
	$(GRADLEW) properties


## tasks: Displays the tasks runnable from root project
tasks:
	@echo ">> ============= Displays the tasks runnable from root project ============= <<"
	$(GRADLEW) tasks


## run: Run the application
run:
	$(GRADLEW) bootrun


## build: Build the application
build:
	$(GRADLEW) build


## ci: Run all CI tests.
ci: check test build
	@echo "\n==> All quality checks passed"


.PHONY: help
