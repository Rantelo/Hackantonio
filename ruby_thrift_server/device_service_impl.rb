require 'thrift'
require './gen-rb/device_service'
require './db_helper.rb'

class DeviceServiceHandler
	def initialize()
		puts 'init handler'
		@db_helper = DBHelper.new("localhost", "root", "hackantonio")
	end

	def register_device new_device
		puts 'register_device'
		@db_helper.register_device new_device
	end

	def update_device update_me
		puts 'update_device'
		@db_helper.update_device update_me
	end

	def remove_device remove_me
		puts 'remove_device'
		@db_helper.remove_device remove_me.id
	end

	def get_device device_id
		puts 'get_device'
		device = @db_helper.get_device device_id
		if device.nil? || device == Response::FAILURE || device == Response::NOT_FOUND
			device = Device.new
			device.id = -1
			device
		else
			puts 'te voy a dar kuchumillulo'
			device
		end
	end

	def get_all_devices
		puts 'get_all_devices'
		ans = @db_helper.get_all_devices
		if ans.nil? || ans == Response::FAILURE
			device = Device.new
			device.id = -1
			device
		else
			puts 'te voy a dar algo'
			ans
		end
	end
end
