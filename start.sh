#!/bin/bash

cp /etc/collectd/configs/collectd-config.conf.tpl /etc/collectd/collectd.conf.tpl

envtpl /etc/collectd/collectd.conf.tpl

collectd -f

supervisord -n
