#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: openssl
# Resource:: generate_cert
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

actions :add, :remove, :default => :add

def initialize(*args)
  super
  @action = :add
end

attribute :name, :kind_of => [String, NilClass], :name_attribute => true, :default => nil
attribute :cookbook, :kind_of => [String, NilClass], :default => nil
