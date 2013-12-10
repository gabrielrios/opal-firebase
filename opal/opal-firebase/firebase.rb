class Firebase
  include Native
  def initialize(url)
    super(ref)
  end

  def ref
    `new Firebase(#{url})`
  end


  def on(event_type, &callback)
    `#@native.on(#{event_type}
  end
end
