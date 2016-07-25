require 'rspec'
require_relative '../lib/node'

describe Attribute do

  let(:attr_class) { Attribute.new :class, 'some-class' }

  context 'attribute instance' do

    it 'return attribute name' do
        expect(attr_class.name).to eq :class
    end

    it 'return attribute value' do
        expect(attr_class.value).to eq 'some-class'
    end

  end

end
