#
# Cookbook:: multifolder
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'multifolder::package'
include_recipe 'multifolder::service'
include_recipe 'multifolder::db'
include_recipe 'multifolder::wordpress'
include_recipe 'multifolder::templateexample'
include_recipe 'multifolder::templateexample2'

