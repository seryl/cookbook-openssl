#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: openssl
# Provider:: cert
#
# Copyright 2011, Josh Toft
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

action :add do
  cookbook_file "#{node[:openssl][:certs]}/#{new_resource.name}.crt" do
    source "#{new_resource.name}.crt"
    owner "root"
    group "root"
    mode 00644
    if new_resource.cookbook
      cookbook new_resource.cookbook
    end
  end
  new_resource.updated_by_last_action(true)
end

action :remove do
  file "#{node[:openssl][:certs]}/#{new_resource.name}.crt" do
    action :delete
  end
  new_resource.updated_by_last_action(true)
end
