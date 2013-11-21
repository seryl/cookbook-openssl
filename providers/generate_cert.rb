#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: openssl
# Provider:: generate_cert
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
  name = new_resource.name
  
  if new_resource.cookbook
    cert_path = File.join(::File.dirname(__FILE__),
      '..', '..', new_resource.cookbook, 'files', 'default', cert)
    key_path = File.join(::File.dirname(__FILE__),
      '..', '..', new_resource.cookbook, 'files', 'default', key)
  else
    cert_path = File.join(::File.dirname(__FILE__),
      '..', 'files', 'default', cert)
    key_path = File.join(::File.dirname(__FILE__),
      '..', 'files', 'default', key)
  end
  
  bash "Create SSL Certificates" do
    cwd node[:openssl][:dir]
    code <<-EOH
    umask 022
    openssl genrsa 2048 > #{node[:openssl][:keys]}/#{key}
    openssl req -subj "#{node[:openssl][:ssl_req]}" -new -x509 -nodes -sha1 -days 3650 -key #{node[:openssl][:keys]}/#{key} > #{node[:openssl][:certs]}/#{cert}
    cat #{node[:openssl][:keys]}/#{key} #{node[:openssl][:certs]}/#{cert} > #{node[:openssl][:pems]}/#{name}.pem
    EOH
    user "root"
    not_if {
      ::File.exists?("#{node[:openssl][:certs]}/#{cert}") &&
      ::File.exists?("#{node[:openssl][:keys]}/#{key}") }
  end
  
  if ::File.exists?(cert_path) && ::File.exists?(key_path)
    openssl_cert cert do
      cookbook new_resource.cookbook
    end
    openssl_key key do
      cookbook new_resource.cookbook
    end
  end
  new_resource.updated_by_last_action(true)
end

action :remove do
  openssl_cert cert do
    action :remove
  end

  openssl_key key do
    action :remove
  end
  new_resource.updated_by_last_action(true)
end

def cert
  "#{new_resource.name}.crt"
end

def key
  "#{new_resource.name}.key"
end
