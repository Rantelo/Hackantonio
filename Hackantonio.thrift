enum Response {
    SUCCESS=1,
    FAILURE=2,
    NO_NEED=3,
    NOT_FOUND=4
}

enum Command {
    ON=1,
    OFF=2
}

struct Device {
    1:i32 id,
    2:string ip,
    3:string name
}

struct Action {
    1:i32 id,
    2:i32 device_id,
    3:Command command
    4:string date_time
}

service DeviceService {
    Response register_device(1:Device new_device),
    Response update_device(1:Device updated_device),
    Response remove_device(1:Device remove_me),

    Device get_device(1:i32 id),
    list<Device> get_all_devices()
}

service ActionService {
    Response register_action(1:Action new_action),
    Response update_action(1:Action updated_action),
    Response remove_action(1:Action remove_me),

    Action get_action(1:i32 id),
    list<Action> get_actions_for_device(1:i32 device_id),
    map<i32, list<Action>> get_all_actions()
}
