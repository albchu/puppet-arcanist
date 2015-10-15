require 'spec_helper'
describe 'arcanist' do

  context 'with defaults for all parameters' do
    it { should contain_class('arcanist') }
  end
end
