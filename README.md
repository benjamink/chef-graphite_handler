Description
===========

[![Build Status](https://secure.travis-ci.org/realityforge/chef-graphite_handler.png?branch=master)](http://travis-ci.org/realityforge/chef-graphite_handler)

A cookbook that a handler that sends chef run results to graphite.

Requirements
============

The `chef_handler` cookbook.

Attributes
==========

This cookbook uses the following attributes to configure how it is installed.

* `node['chef_client']['handler']['graphite']['host']` - The graphite server host.
* `node['chef_client']['handler']['graphite']['port']` - The graphite server port.
* `node['chef_client']['handler']['graphite']['prefix']` - The prefix appended to statistics sent to graphite. Defaults to `"#{node.chef_environment}.node.#{node['hostname']}.chef"`.

Usage
=====

Set the host and port properties on the node and include the "graphite_handler::default" recipe.

Credits
=======

The handler was originally written by Ian Meyer and was converted to a cookbook by Peter Donald.
