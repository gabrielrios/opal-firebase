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

  # Authenticates a Firebase client to Firebase.
  def auth
  end

  # Unauthenticates a Firebase client from Firebase.
  def unauth
  end

  # Get a Firebase reference to a child location.
  def child
  end

  # Get a Firebase reference for the parent location.
  def parent
  end

  # Get a Firebase reference for the root of the Firebase.
  def root
  end

  # Get the last token of this location's full URL.
  def name
  end

  # Get the absolute URL corresponding to this location.
  def toString
  end

  # Write data into your Firebase.
  # TODO: Callback
  def set(value, &callback)
    `#@native.set(#{value.to_n})`
  end

  # Modify existing data in your Firebase.
  def update
  end

  # Delete data from your Firebase.
  def remove
  end

  # Add data to a list using a unique name.
  def push(value, &callback)
    `#@native.push(#{value.to_n})`
  end

  # Write data into your Firebase using a specific priority.
  def set_with_priority
  end

  # Update the priority of data in your Firebase.
  def priority=
  end

  # Atomically modify data.
  def transaction
  end

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

  # Remove a callback attached with on #.
  def off
  end

  # Attach a callback that will only be triggered once.
  def once
  end

  # Create a Query limited to a maximum number of children.
  def limit
  end

  # Create a Query with the specified starting point.
  def start_at
  end

  # Create a Query with the specified ending point.
  def end_at
  end
end
