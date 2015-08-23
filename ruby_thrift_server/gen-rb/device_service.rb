#
# Autogenerated by Thrift Compiler (1.0.0-dev)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require_relative 'hackantonio_types'

module DeviceService
  class Client
    include ::Thrift::Client

    def register_device(new_device)
      send_register_device(new_device)
      return recv_register_device()
    end

    def send_register_device(new_device)
      send_message('register_device', Register_device_args, :new_device => new_device)
    end

    def recv_register_device()
      result = receive_message(Register_device_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'register_device failed: unknown result')
    end

    def update_device(updated_device)
      send_update_device(updated_device)
      return recv_update_device()
    end

    def send_update_device(updated_device)
      send_message('update_device', Update_device_args, :updated_device => updated_device)
    end

    def recv_update_device()
      result = receive_message(Update_device_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'update_device failed: unknown result')
    end

    def remove_device(remove_me)
      send_remove_device(remove_me)
      return recv_remove_device()
    end

    def send_remove_device(remove_me)
      send_message('remove_device', Remove_device_args, :remove_me => remove_me)
    end

    def recv_remove_device()
      result = receive_message(Remove_device_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'remove_device failed: unknown result')
    end

    def get_device(id)
      send_get_device(id)
      return recv_get_device()
    end

    def send_get_device(id)
      send_message('get_device', Get_device_args, :id => id)
    end

    def recv_get_device()
      result = receive_message(Get_device_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'get_device failed: unknown result')
    end

    def get_all_devices()
      send_get_all_devices()
      return recv_get_all_devices()
    end

    def send_get_all_devices()
      send_message('get_all_devices', Get_all_devices_args)
    end

    def recv_get_all_devices()
      result = receive_message(Get_all_devices_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'get_all_devices failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_register_device(seqid, iprot, oprot)
      args = read_args(iprot, Register_device_args)
      result = Register_device_result.new()
      result.success = @handler.register_device(args.new_device)
      write_result(result, oprot, 'register_device', seqid)
    end

    def process_update_device(seqid, iprot, oprot)
      args = read_args(iprot, Update_device_args)
      result = Update_device_result.new()
      result.success = @handler.update_device(args.updated_device)
      write_result(result, oprot, 'update_device', seqid)
    end

    def process_remove_device(seqid, iprot, oprot)
      args = read_args(iprot, Remove_device_args)
      result = Remove_device_result.new()
      result.success = @handler.remove_device(args.remove_me)
      write_result(result, oprot, 'remove_device', seqid)
    end

    def process_get_device(seqid, iprot, oprot)
      args = read_args(iprot, Get_device_args)
      result = Get_device_result.new()
      result.success = @handler.get_device(args.id)
      write_result(result, oprot, 'get_device', seqid)
    end

    def process_get_all_devices(seqid, iprot, oprot)
      args = read_args(iprot, Get_all_devices_args)
      result = Get_all_devices_result.new()
      result.success = @handler.get_all_devices()
      write_result(result, oprot, 'get_all_devices', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Register_device_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NEW_DEVICE = 1

    FIELDS = {
      NEW_DEVICE => {:type => ::Thrift::Types::STRUCT, :name => 'new_device', :class => ::Device}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Register_device_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success', :enum_class => ::Response}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @success.nil? || ::Response::VALID_VALUES.include?(@success)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field success!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Update_device_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    UPDATED_DEVICE = 1

    FIELDS = {
      UPDATED_DEVICE => {:type => ::Thrift::Types::STRUCT, :name => 'updated_device', :class => ::Device}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Update_device_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success', :enum_class => ::Response}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @success.nil? || ::Response::VALID_VALUES.include?(@success)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field success!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Remove_device_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    REMOVE_ME = 1

    FIELDS = {
      REMOVE_ME => {:type => ::Thrift::Types::STRUCT, :name => 'remove_me', :class => ::Device}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Remove_device_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success', :enum_class => ::Response}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @success.nil? || ::Response::VALID_VALUES.include?(@success)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field success!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_device_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1

    FIELDS = {
      ID => {:type => ::Thrift::Types::I32, :name => 'id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_device_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Device}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_all_devices_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_all_devices_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Device}}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end
