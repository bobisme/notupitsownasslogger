require_relative './lib/notupitsownasslogger'

begin
  raise 'you fucked up'
rescue Exception => err
  Notupitsownasslogger.fatal('hug you', exception: err.inspect)
end
