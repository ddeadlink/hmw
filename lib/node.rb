require_relative "attribute"
require_relative "attributes"

class Node
  attr_reader :name, :attributes, :children

  def initialize(name, attributes, *children)
    @name = name
    @attributes = Attributes.new(attributes)
    @children = children
    checkAttr if @attributes.list.include? :pattern
  end

  def appendChildren(children)
      @children << children
  end

  def removeAttr(removable)
    raise(ArgumentError,'unexisting attribute') unless @attributes.list.include? removable.name
    @attributes.list.delete_if {|key| key == removable.name}
  end

  def render
    attributes_strings = []
    @attributes.list.each_value do |attr|
      attributes_strings.push(attr.render)
    end

    @children.map! { |child| child.render }

    "<#{@name} #{attributes_strings.join(' ')}>#{@children.join(' ')}</#{@name}>"
  end

  private

  def checkAttr
      raise(TypeError,'only input could include pattert attribute') unless self.instance_of? InputNode
  end

end


class ImgNode < Node

  def initialize(attributes)
    super(:img, attributes)
  end

  def render
    attributes_strings = []
    @attributes.list.each_value do |attr|
      attributes_strings.push(attr.render)
    end

    "<#{@name} #{attributes_strings.join(' ')}/>"
  end

end

class InputNode < Node

    def initialize(attributes)
      super(:input, attributes)
    end

    def render
      attributes_strings = []
      @attributes.list.each_value do |attr|
        attributes_strings.push(attr.render)
      end

      "<#{@name} #{attributes_strings.join(' ')}>"
    end

end
