require 'json'

# Notupitsownasslogger doesn't give a shit.
module Notupitsownasslogger
  def self.log(level, message, **kwargs)
    STDOUT.puts(
      { level: level, msg: message }.update(kwargs).to_json
    )
  end

  %i[info warn error debug].each do |level|
    define_singleton_method(level) { |*args| log(level, *args) }
  end

  def self.fatal(*args)
    log(:fatal, *args)
    exit(2)
  end
end
