#
# Cookbook Name:: openssl
# Attributes:: default
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

default[:openssl][:dir]     = "/etc/ssl"
default[:openssl][:certs]   = "#{openssl[:dir]}/certs"
default[:openssl][:keys]    = "#{openssl[:dir]}/keys"
default[:openssl][:pems]    = "#{openssl[:dir]}/pems"
default[:openssl][:ssl_req] = "/C=US/ST=CA/L=San Francisco/O=Example/OU=Operations/CN=ssl_cert/emailAddress=ops@localhost"
