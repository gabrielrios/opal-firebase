class Query
  include Native

  def initialize(_native)
    super(_native)
  end

  def limit(limit)
    Query.new(%x{ #@native.limit(limit) })
  end

  def limit_to_first(limit)
    Query.new(%x{ #@native.limitToFirst(limit) })
  end

  def limit_to_last(limit)
    Query.new(%x{ #@native.limitToLast(limit) })
  end

  def once(event_type, &callback)
    wrapper = proc {|snapshot|
      snapshot = DataSnapshot.new(`snapshot`)
      callback.call(snapshot)
    }.to_n

    `#@native.once(#{event_type}, #{wrapper})`
    callback
  end

  # Attach a callback to read data and receive data changes.
  # Based on
  # https://github.com/opal/opal-jquery/blob/master/opal/opal-jquery/element.rb#L279
  def on(event_type, &callback)
    wrapper = proc{|snapshot|
      snapshot = DataSnapshot.new(%x{ snapshot })
      callback.call(snapshot)
    }.to_n

    `#@native.on(#{event_type}, #{wrapper})`
    callback
  end

  def end_at(value, key = nil)
    Query.new %x{ #@native.endAt(#{value.to_n}, #{key}) }
  end

  def start_at(value, key = nil)
    Query.new %x{ #@native.startAt(#{value.to_n}, #{key}) }
  end
end
