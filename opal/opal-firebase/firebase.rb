# NOTE: should pass the to_n here
# TODO: Child should return a firebase instance
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

  alias_native :authorize, :auth
  alias_native :unauthorize, :unauth
  alias_native :parent, :parent
  alias_native :root, :root
  alias_native :name, :name
  alias_native :set, :set
  alias_native :update, :update
  alias_native :remove, :remove
  alias_native :push, :push
  alias_native :set_with_priority, :setWithPriority
  alias_native :priority=, :setPriority
  alias_native :transaction, :transaction
  alias_native :off, :off
  alias_native :limit, :limit
  alias_native :start_at, :startAt
  alias_native :end_at, :endAt
  alias_native :go_online, :goOnline
  alias_native :go_offlien, :goOffline
  alias_native :on_disconnect, :onDisconnect

  def child(path)
    Firebase.new(%x{ #@native.child(#{path}).toString() })
  end

  # # Write data into your Firebase.
  # # TODO: Callback
  # def set(value, &callback)
  #   `#@native.set(#{value.to_n})`
  # end

  # # Add data to a list using a unique name.
  # def push(value, &callback)
  #   `#@native.push(#{value.to_n})`
  # end

  # Attach a callback to read data and receive data changes.
  # Based on
  # https://github.com/opal/opal-jquery/blob/master/opal/opal-jquery/element.rb#L279
  def on(event_type, &callback)
    wrapper = proc {|snapshot|
      snapshot = DataSnapshot.new(`snapshot`)
      callback.call(snapshot)
    }.to_n

    `#@native.on(#{event_type}, #{wrapper})`
  end

  def once(event_type, &callback)
    puts event_type
    wrapper = proc {|snapshot|
      snapshot = DataSnapshot.new(`snapshot`)
      callback.call(snapshot)
    }.to_n

    `#@native.once(#{event_type}, #{wrapper})`
  end

  # Get the absolute URL corresponding to this location.
  def to_s
    url
  end

  def inspect
    "#<Firebase url: #{url}>"
  end
end
