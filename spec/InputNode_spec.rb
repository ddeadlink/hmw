require 'rspec'
require_relative '../lib/node'

describe InputNode do

    let(:attr_class) { Attribute.new :class, 'some-class' }
    let(:node) { InputNode.new [attr_class] }

    context 'InputNode instance' do

      it 'return InputNode name' do
        expect(node.name).to eq :input
      end

      it 'return InputNode attributes' do
        expect(attr_class.render).to eq "class=\"some-class\""
      end

      it '.removeAttr' do
        node.removeAttr(attr_class)
        expect(node.render).to eq "<input >"
      end

      it 'not to raise TypeError' do
          expect {
            expect(node).not_to raise_error(TypeError)
          }
      end

      it '.render' do
        expect(node.render).to eq "<input class=\"some-class\">"
      end

    end

end
