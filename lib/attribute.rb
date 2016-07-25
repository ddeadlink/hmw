class Attribute
  attr_reader :name, :value, :pattern

  def initialize(name, value)
    @name = name
    @value = value
  end

  def render
    "#{@name}=\"#{@value}\""
  end

  private

  def transform_value(value)
    case value
    when String then transformed_value = value.split(' ')
    else transformed_value = value
    end
    transformed_value
  end

end


class AttrPattern < Attribute

  PATTERN_LIST = [  '\d [0-9]',
                    '\D [^0-9]',
                    '\s',
                    '[A-Z]',
                    '[A-Za-z][А-Яа-яЁё]',
                    '[A-Za-zА-Яа-яЁё]',
                    '[0-9]{3}',
                    '[A-Za-z]{6,}',
                    '[0-9]{,3}',
                    '[0-9]{5,10}',
                    '^[a-zA-Z]',
                    '^[А-Яа-яЁё\s]+$',
                    '^[ 0-9]+$',
                    '[0-9]{6}',
                    '\d+(,\d{2})?',
                    '\d+(\.\d{2})?',
                    '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
                  ]

  def initialize(value)
    if PATTERN_LIST.include? value
        super(:pattern, value)
    else
        raise(ArgumentError, "check pattern list => #{PATTERN_LIST}") 
    end
  end

  def render
    "#{@name}=\"#{@value}\""
  end

end


class AttrClass < Attribute

  def initialize(value)
    super(:class, transform_value(value))
  end

  def append(value)
    @value << transform_value(value)
  end

  def render
    "#{@name}=\"#{@value.join(' ')}\""
  end

end


class AttrId < Attribute

  def initialize(value)
    super(:id, transform_value(value))
  end

  def render
    "#{@name}=\"#{@value.join(' ')}\""
  end

end
