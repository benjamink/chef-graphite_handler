#
# Copyright Peter Donald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['chef_client']['handler']['graphite']['host'] && node['chef_client']['handler']['graphite']['port']
  include_recipe "chef_handler"

  chef_gem "simple-graphite"

  cookbook_file "#{Chef::Config[:file_cache_path]}/chef-handler-graphite.rb" do
    source "chef-handler-graphite.rb"
    mode "0600"
  end

  chef_handler "GraphiteReporting" do
    source "#{Chef::Config[:file_cache_path]}/chef-handler-graphite.rb"
    arguments [
                :metric_key => node['chef_client']['handler']['graphite']['prefix'],
                :graphite_host => node['chef_client']['handler']['graphite']['host'],
                :graphite_port => node['chef_client']['handler']['graphite']['port']
              ]
    action :enable
  end
end
