require 'rspec'
require_relative '../lib/node'

describe AttrPattern do

  let(:attr_pattern) { AttrPattern.new '\d [0-9]' }

  context 'AttrPattern instance' do

    it 'return AttrPattern name' do
        expect(attr_pattern.name).to eq :pattern
    end

    it 'return attrClass value' do
        expect(attr_pattern.value).to eq '\d [0-9]'
    end

    it 'fail ArgumentError' do
      expect {
        expect(attr_pattern).not_to raise_error(ArgumentError)
      }
    end

  end

end
