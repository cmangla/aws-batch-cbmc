# Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

-include ../Makefile.local

default:
	@echo Nothing to make for Cloud Formation template

install:
	aws cloudformation create-stack \
		--stack-name cbmc \
		--template-body file://cbmc.yaml \
		--capabilities CAPABILITY_IAM

update:
	aws cloudformation update-stack \
		--stack-name cbmc \
		--template-body file://cbmc.yaml \
		--capabilities CAPABILITY_IAM

clean:
	$(RM) *~

.PHONY: default install update clean

