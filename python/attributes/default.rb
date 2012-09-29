#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: python
# Attribute:: default
#
# Copyright 2011, Opscode, Inc.
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

set_unless[:python][:pip][:py_version] = ''

set_unless[:python][:install_method] = 'package'

set_unless[:python][:source][:url] = 'http://www.python.org/ftp/python'
set_unless[:python][:source][:version] = '2.7.3'
set_unless[:python][:source][:checksum] = 'c57477edd6d18bd9eeca2f21add73919'
set_unless[:python][:source][:prefix_dir] = '/usr/local'

default[:python][:source][:configure_options] = %W{--prefix=#{python['prefix_dir']}}
