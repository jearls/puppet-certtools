require 'spec_helper'
describe 'certtools' do

  context 'with defaults for all parameters' do
    it { should contain_class('certtools') }
  end
end
