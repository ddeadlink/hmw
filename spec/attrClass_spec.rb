require 'rspec'
require_relative '../lib/node'

describe AttrClass do

  let(:attr_class) { AttrClass.new 'some-class' }

  context 'attrClass instance' do

    it 'return attrClass name' do
        expect(attr_class.name).to eq :class
    end

    it 'return attrClass value' do
        expect(attr_class.value).to eq ["some-class"]
    end

    it '.append' do
        expect(attr_class.append('other')).to eq attr_class.value
    end

  end

end
