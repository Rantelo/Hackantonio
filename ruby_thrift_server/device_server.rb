require 'thrift'
require './gen-rb/device_service'
require './device_service_impl'

begin
	handler = DeviceServiceHandler.new
	processor = DeviceService::Processor.new handler
	transport = Thrift::ServerSocket.new 9001
	transport_factory = Thrift::BufferedTransportFactory.new
	server = Thrift::ThreadedServer.new processor, transport, transport_factory

	puts 'Starting Server...'
	server.serve
rescue SystemExit, Interrupt
	puts 'Bye' 
end
puts 'Done...'
