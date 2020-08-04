# ---------------- configuration ----------------------

# if you have multiple SWI Prolog installations or an installation
# in a non-standard place, set PLLD to the appropriate plld invokation, eg
# PLLD=/usr/local/bin/plld -p /usr/local/bin/swipl

PACKNAME=sql_compiler

# Get version from pack
VERSION = v$(shell swipl -l pack.pl -g "version(V),writeln(V),halt.")

SWIPL = swipl  -p library=prolog
all: test

# note: these stubs are required for the central pack build system
check:
install:
clean:


test:
	$(SWIPL) -l tests/tests.pl -g run_tests,halt

t-%:
	$(SWIPL) -l tests/$*_test.pl -g run_tests,halt


release:
	./util/pack-release.pl cmungall/sql_compiler $(VERSION)

# --------------------
# Docker
# --------------------


show-version:
	echo $(VERSION)

IM = cmungall/sql_compiler

docker-all: docker-clean docker-build docker-run

docker-clean:
	docker kill $(IM) || echo not running ;
	docker kill $(IM) || echo not running ;
	docker rm $(IM) || echo not made 

docker-build:
	@docker build -t $(IM):$(VERSION) . \
	&& docker tag $(IM):$(VERSION) $(IM):latest


docker-run:
	docker run --name sql_compiler $(IM)

docker-publish: docker-build
	@docker push $(IM):$(VERSION) \
	&& docker push $(IM):latest