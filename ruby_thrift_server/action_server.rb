require 'thrift'
require './gen-rb/action_service'
require './action_service_impl'

handler = ActionServiceHandler.new
processor = ActionService::Processor.new handler
transport = Thrift::ServerSocket.new 9000
transport_factory = Thrift::BufferedTransportFactory.new
server = Thrift::ThreadedServer.new processor, transport, transport_factory

puts 'Starting Server...'
server.serve
puts 'Done...'
