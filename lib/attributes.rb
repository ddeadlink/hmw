require_relative 'attribute'

class Attributes

  attr_reader :list

  def initialize(list)
    @list = {}
    list.each do |item|
      case item.class.to_s
          when 'AttrClass' then @list[item.name] = item
          when 'Attribute' then @list[item.name] = item
          when 'AttrPattern' then @list[item.name] = item
          when 'AttrId' then @list[item.name] = item
          when 'Hash' then @list[item[:name]] = process_hash(item)
      end
    end
  end

  private

  def process_hash(hash)
    case hash[:name].to_s
    when 'class' then instance = AttrClass.new(hash[:value])
    when 'id' then instance = AttrId.new(hash[:value])
    when 'pattern' then instance = AttrPattern.new(hash[:value])
    else
      instance = Attribute.new(hash[:name], hash[:value])
    end
    instance
  end

end
