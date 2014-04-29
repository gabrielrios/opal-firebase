# TODO: Tests, look at https://github.com/opal/opal-jquery/blob/master/spec/event_spec.rb
# or not if its just delegates
#
class DataSnapshot
  include Native

  def initialize(_native)
    super(_native)
  end
  #
  #  Get the Javascript object representation of the DataSnapshot.
  def val
    `#@native.val()`
  end

  # Get a Hash representantion of the data snapshot
  # TODO: is hash if its an object
  def value
    Native(val)
  end

  #  Get a DataSnapshot for the specified child location.
  def child(childPath)
    %x{ #{ DataSnapshot.new `#@native.child(childPath)` } }
  end

  #  Enumerate through the DataSnapshot’s children.
  #
  def each_child(&block)
    %x{
      #@native.forEach(function(childSnap) {
        #{block.call(DataSnapshot.new %x{childSnap})}
      })
    }
  end

  #  Return true if the specified child exists.
  def has_child?(childPath)
    `#@native.hasChild(childPath)`
  end

  #  Return true if this DataSnapshot has any children.
  def has_children?
    `#@native.hasChildren()`
  end

  #  Get the name of this DataSnapshot's location.
  def name
    `#@native.name()`
  end

  #  Get the number of children for this DataSnapshot.
  def num_children
    `#@native.numChildren()`
  end

  #  Get the Firebase reference for this DataSnapshot's location.
  def reference
    %x{ #{ Firebase.new `#@native.ref().toString()` } }
  end

  #  Get the priority of the data in this DataSnapshot.
  def priority
    `#@native.getPriority()`
  end

  def export_val # Export data as a Javascript object with priority information.
    `#@native.exportVal()`
  end

  def inspect
   "#<Firebase::Snapshot name:#{name} value:#{val}>"
  end

  def to_n
    @native
  end
end
