#!/bin/bash
eyk config:set RAILS_MASTER_KEY=804488f2ddea2d81dfeaec2c472aa1a8
eyk config:set DEIS_DOCKER_BUILD_ARGS_ENABLED=1
eyk config:set db_yml_username=obiwanuser
eyk config:set db_yml_password=4ztaxGFQuLqbbk5aSDprpYnFzoKkTeqh5HdYGtbR
eyk config:set db_yml_host=svc-rdb-obiwandb20210511132912545100000002.cgttkxlv4yiw.ap-southeast-2.rds.amazonaws.com
eyk config:set db_yml_database=obiwandb
eyk config:set RAILS_ENV=production

