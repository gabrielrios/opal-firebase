class Query
  include Native

  def initialize(_native)
    super(_native)
  end

  def on(event_type, &callback)
    %x{
      var wrapper = function(snapshot) {
        snapshot = #{DataSnapshot.new `snapshot`};

        return callback.apply(null, arguments);
      }

      callback._jq_wrap = wrapper

      #@native.on(event_type, wrapper)
    }
    callback
  end
end
