require './gen-rb/action_service'
require './db_helper'

class ActionServiceHandler

	def initialize
		@db_helper = DBHelper.new 'localhost', 'root', 'hackantonio'
	end

	def register_aciton new_action
		@db_helper.register_action new_action
	end

	def update_action update_me
		@db_helper.update_action update_me
	end

	def remove_action remove_me
		@db_helper.remove_action remove_me.id
	end

	def get_action action_id
		@db_helper.get_action action_id
	end

	def get_all_actions
		@db_helper.get_all_actions
	end
end
