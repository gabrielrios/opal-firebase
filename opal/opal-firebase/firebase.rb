# NOTE: should pass the to_n here
class Firebase
  include Native

  attr_accessor :url

  def initialize(url)
    @url = url
    super(ref)
  end

  def ref
    `new Firebase(#{url})`
  end

  # TODO: Callback
  def set(value, &callback)
    `#@native.set(#{value.to_n})`
  end

  def push(value, &callback)
    `#@native.push(#{value.to_n})`
  end


  # TODO
  def on(event_type, &callback)
    `#@native.on(#{event_type})`
  end
end
