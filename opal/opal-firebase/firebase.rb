# NOTE: should pass the to_n here
# TODO: Child should return a firebase instance
class Firebase < Query
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
  alias_native :authorize_with_token, :authWithCustomToken
  alias_native :unauthorize, :unauth
  alias_native :transaction, :transaction
  alias_native :parent, :parent
  alias_native :root, :root
  alias_native :name, :name
  alias_native :set, :set
  alias_native :update, :update
  alias_native :remove, :remove
  alias_native :set_with_priority, :setWithPriority
  alias_native :priority=, :setPriority
  alias_native :off, :off
  alias_native :go_online, :goOnline
  alias_native :go_offlien, :goOffline
  alias_native :on_disconnect, :onDisconnect

  def child(path)
    Firebase.new(%x{ #@native.child(#{path}).toString() })
  end

  # Add data to a list using a unique name.
  def push(value, &callback)
    Firebase.new `#@native.push(#{value.to_n}).toString()`
  end

  # Get the absolute URL corresponding to this location.
  def to_s
    url
  end

  def to_n
    @native
  end

  def inspect
    "#<Firebase url: #{url}>"
  end
end
