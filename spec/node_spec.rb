require 'rspec'
require_relative '../lib/node'

describe Node do

    let(:attr_class) { Attribute.new :class, 'some-class' }
    let(:childNode) { Node.new :div, [attr_class] }
    let(:node) { Node.new :div, [attr_class] }

    context 'node instance' do

      it 'return node name' do
        expect(node.name).to eq :div
      end

      it 'return node attributes' do
        expect(attr_class.render).to eq "class=\"some-class\""
      end

      it '.appendChildren' do
        expect(node.appendChildren(childNode)).to eq node.children
      end

      it '.removeAttr' do
        node.removeAttr(attr_class)
        expect(node.render).to eq "<div ></div>"
      end

      it 'not to raise TypeError' do
          expect {
            expect(node).not_to raise_error(TypeError)
          }
      end

      it '.render' do
        expect(node.render).to eq "<div class=\"some-class\"></div>"
      end

    end

end
