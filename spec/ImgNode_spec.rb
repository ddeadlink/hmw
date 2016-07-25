require 'rspec'
require_relative '../lib/node'

describe ImgNode do

    let(:attr_class) { Attribute.new :class, 'some-class' }
    let(:node) { ImgNode.new [attr_class] }

    context 'ImgNode instance' do

      it 'return ImgNode name' do
        expect(node.name).to eq :img
      end

      it 'return ImgNode attributes' do
        expect(attr_class.render).to eq "class=\"some-class\""
      end

      it '.removeAttr' do
        node.removeAttr(attr_class)
        expect(node.render).to eq "<img />"
      end

      it 'not to raise TypeError' do
          expect {
            expect(node).not_to raise_error(TypeError)
          }
      end

      it '.render' do
        expect(node.render).to eq "<img class=\"some-class\"/>"
      end

    end

end
