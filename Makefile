# Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

-include Makefile.local

default:
	$(MAKE) -C docker $@
	$(MAKE) -C pkg-cbmc $@
	$(MAKE) -C pkg-batch $@
	$(MAKE) -C pkg-viewer $@
	$(MAKE) -C template $@

install: login
	$(MAKE) -C docker $@
	$(MAKE) -C pkg-cbmc $@
	$(MAKE) -C pkg-batch $@
	$(MAKE) -C pkg-viewer $@
	$(MAKE) -C template $@

update: login
	$(MAKE) -C docker install
	$(MAKE) -C pkg-cbmc install
	$(MAKE) -C pkg-batch install
	$(MAKE) -C pkg-viewer install
	$(MAKE) -C template $@

clean:
	$(RM) *~
	$(MAKE) -C bin $@
	$(MAKE) -C docker $@
	$(MAKE) -C pkg-cbmc $@
	$(MAKE) -C pkg-batch $@
	$(MAKE) -C pkg-viewer $@
	$(MAKE) -C template $@

veryclean: clean

login:
	@echo Generating ECR login command ...
	$(eval LOGINCMD = $(shell aws ecr get-login --no-include-email --region $(AWSREGION)))
	@echo ... done.
	@test "$(LOGINCMD)" || ( echo "Could not obtain login from AWS ECR"; exit 1 )
	@echo Executing generated ECR login command
	$(LOGINCMD)

.PHONY: default install clean veryclean login

