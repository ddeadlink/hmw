require 'rspec'
require_relative '../lib/node'

describe AttrId do

  let(:attr_id) { AttrId.new '123' }

  context 'AttrId instance' do

    it 'return AttrId name' do
        expect(attr_id.name).to eq :id
    end

    it 'return attrClass value' do
        expect(attr_id.value).to eq ["123"]
    end

  end

end
