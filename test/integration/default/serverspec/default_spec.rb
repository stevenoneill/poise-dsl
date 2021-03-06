#
# Copyright 2017, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'serverspec'
set :backend, :exec

describe file('/poise_test') do
  it { is_expected.to be_a_file }
  its(:content) { is_expected.to eq 'oneubuntutwo' }
end

describe file('/poise_test2') do
  it { is_expected.to be_a_file }
  its(:content) { is_expected.to eq 'oneubuntutwo' }
end

describe file('/poise_test_other') do
  it { is_expected.to be_a_file }
  # First message is Chef 13, second is Chef 12.
  its(:content) { is_expected.to include("undefined local variable or method `helper_one' for cookbook").or(include("No resource, method, or local variable named `helper_one' for")) }
end

describe file('/poise_test_other2') do
  it { is_expected.to be_a_file }
  its(:content) { is_expected.to include "undefined method `helper_one' for Chef::Resource::File" }
end
