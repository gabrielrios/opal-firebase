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


  # Based on
  # https://github.com/opal/opal-jquery/blob/master/opal/opal-jquery/element.rb#L279
  def on(event_type, &callback)
    wrapper = proc {|snapshot|
      snapshot = DataSnapshot.new(`snapshot`)
      callback.call(snapshot)
    }.to_n

    `#@native.on(#{event_type}, #{wrapper})`
  end
end
