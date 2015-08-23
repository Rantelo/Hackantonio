require 'ipaddress'
require 'mysql'
require './gen-rb/hackantonio_types'

class DBHelper
	def initialize(host, user, password)
		puts 'initialize'
		@db = 'hackantonio'
		@host = host
		@user = user
		@password = password
		@con = nil
	end

	def register_device(new_device)
		ans = Response::FAILURE
		if IPAddress.valid? new_device.ip
			begin
				@con = Mysql.new @host, @user, @password, @db
				@con.query("INSERT INTO Device (ip, name) VALUES('#{new_device.ip}', '#{new_device.name}')")
				ans = Response::SUCCESS
			rescue Mysql::Error => e
				puts "Error ##{e.errno} : #{e.error}"
			ensure
				@con.close if @con
			end
		elsif new_device.name.size < 3
			puts "Device name too short"
		else
			puts "Invalid IP: '#{new_device.ip}'"
		end
		return ans
	end

	def update_device(new_device)
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Device WHERE id='#{new_device.id};'")
			if q.num_rows > 0
				device_db = q.fetch_hash
				new_device.ip = device_db['ip'] unless IPAddress.valid? new_device.ip
				new_device.name = device_db['name'] unless new_device.name.length >= 2

				@con.query("UPDATE Device SET ip='#{new_device.ip}', name='#{new_device.name}' WHERE id=#{new_device.id};")
				ans = Response::SUCCESS
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def remove_device(id)
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			@con.query("DELETE FROM Action WHERE device_id=#{id}")
			@con.query("DELETE FROM Device WHERE id=#{id}")
			ans = Response::SUCCESS
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def get_device(id)
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Device WHERE id=#{id};")
			if q.num_rows > 0
				device_db = q.fetch_hash
				ans = hash_to_device device_db
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def get_all_devices()
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Device;")
			
			if q.num_rows > 0
				ans = Array.new()
				q.each do |row|
					ans.push(array_to_device row)
				end
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error #{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	# Action
	def register_action(new_action)
		ans = Response::FAILURE
		if device_exist? new_action.device_id
			begin
				@con = Mysql.new @host, @user, @password, @db
				@con.query("INSERT INTO Action (device_id, date_time, command) VALUES( 
																						  #{new_action.device_id}, 
																						 '#{new_action.date_time}',
																						  #{new_action.command});")
				ans = Response::SUCCESSS
			rescue Mysql::Error => e
				puts "Error ##{e.errno} : #{e.error}"
			ensure
				@con.close if @con
			end
		else
			puts "Invalid Device ID: '#{new_action.device_id}'"
		end
		return ans
	end

	def update_action(new_action)
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Action WHERE id='#{new_action.id};'")
			if q.num_rows > 0
				action_db = q.fetch_hash
				new_action.device_id = action_db['device_id'] unless device_exist? new_action.device_id
				new_action.command   = action_db['command']   unless (1..2).include? new_action.command

				@con.query("UPDATE Device SET ip='#{new_device.ip}', name='#{new_device.name}' WHERE id=#{new_device.id};")
				ans = Response::SUCCESS
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def remove_action(id)
		ans = 2
		begin
			@con = Mysql.new @host, @user, @password, @db
			@con.query("DELETE FROM Action WHERE id=#{id};")
			ans = 1
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def get_action(id)
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Action WHERE id=#{id};")
			if q.num_rows > 0
				action_db = q.fetch_hash
				ans = hash_to_action action_db
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def get_actions_for_device(device_id)
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Action WHERE device_id=#{device_id};")
			
			if q.num_rows > 0
				ans = Array.new()
				q.each do |row|
					ans.push(array_to_action row)
				end
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end

	def get_all_actions()
		ans = Response::FAILURE
		begin
			@con = Mysql.new @host, @user, @password, @db
			q = @con.query("SELECT * FROM Action;")
			
			if q.num_rows > 0
				ans = Array.new()
				q.each do |row|
					ans.push(array_to_action row)
				end
			else
				ans = Response::NOT_FOUND
			end
		rescue Mysql::Error => e
			puts "Error ##{e.errno} : #{e.error}"
		ensure
			@con.close if @con
		end
		return ans
	end


	private
	def hash_to_device hash
		ans = Device.new()
		ans.id   = hash['id'].to_i
		ans.ip   = hash['ip']
		ans.name = hash['name']
		ans
 	end
	
	def array_to_device array
		ans = Device.new()
		ans.id   = array[0].to_i
		ans.ip   = array[1]
		ans.name = array[2]
		ans
 	end

 	def hash_to_action hash
		ans = Action.new()
		ans.id        = hash['id'].to_i
		ans.device_id = hash['device_id'].to_i
		ans.date_time = hash['date_time']
		ans.command   = hash['command'].to_i
		ans
 	end
	
	def array_to_action array
		ans = Action.new()
		ans.id        = array[0].to_i
		ans.device_id = array[1].to_i
		ans.date_tiem = array[2]
		ans.command   = array[3].to_i
		ans
 	end

 	def device_exist? id
 		@con.query("SELECT * FROM Device WHERE id=#{id};").num_rows > 0
 	end
end
