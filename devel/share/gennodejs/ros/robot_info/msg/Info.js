// Auto-generated. Do not edit!

// (in-package robot_info.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.voltage = null;
      this.orientation = null;
      this.velocity = null;
      this.motor_status = null;
      this.sonar_status = null;
      this.arm_torque = null;
      this.arm_status = null;
      this.cam360_status = null;
      this.second_cam_status = null;
      this.map_status = null;
      this.ptz_camera = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('voltage')) {
        this.voltage = initObj.voltage
      }
      else {
        this.voltage = 0.0;
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('motor_status')) {
        this.motor_status = initObj.motor_status
      }
      else {
        this.motor_status = 0;
      }
      if (initObj.hasOwnProperty('sonar_status')) {
        this.sonar_status = initObj.sonar_status
      }
      else {
        this.sonar_status = [];
      }
      if (initObj.hasOwnProperty('arm_torque')) {
        this.arm_torque = initObj.arm_torque
      }
      else {
        this.arm_torque = [];
      }
      if (initObj.hasOwnProperty('arm_status')) {
        this.arm_status = initObj.arm_status
      }
      else {
        this.arm_status = 0;
      }
      if (initObj.hasOwnProperty('cam360_status')) {
        this.cam360_status = initObj.cam360_status
      }
      else {
        this.cam360_status = 0;
      }
      if (initObj.hasOwnProperty('second_cam_status')) {
        this.second_cam_status = initObj.second_cam_status
      }
      else {
        this.second_cam_status = 0;
      }
      if (initObj.hasOwnProperty('map_status')) {
        this.map_status = initObj.map_status
      }
      else {
        this.map_status = 0;
      }
      if (initObj.hasOwnProperty('ptz_camera')) {
        this.ptz_camera = initObj.ptz_camera
      }
      else {
        this.ptz_camera = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [voltage]
    bufferOffset = _serializer.float32(obj.voltage, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = _serializer.float64(obj.orientation, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    // Serialize message field [motor_status]
    bufferOffset = _serializer.int32(obj.motor_status, buffer, bufferOffset);
    // Serialize message field [sonar_status]
    bufferOffset = _arraySerializer.float64(obj.sonar_status, buffer, bufferOffset, null);
    // Serialize message field [arm_torque]
    bufferOffset = _arraySerializer.float64(obj.arm_torque, buffer, bufferOffset, null);
    // Serialize message field [arm_status]
    bufferOffset = _serializer.int32(obj.arm_status, buffer, bufferOffset);
    // Serialize message field [cam360_status]
    bufferOffset = _serializer.int32(obj.cam360_status, buffer, bufferOffset);
    // Serialize message field [second_cam_status]
    bufferOffset = _serializer.int32(obj.second_cam_status, buffer, bufferOffset);
    // Serialize message field [map_status]
    bufferOffset = _serializer.int32(obj.map_status, buffer, bufferOffset);
    // Serialize message field [ptz_camera]
    bufferOffset = _serializer.int32(obj.ptz_camera, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Info
    let len;
    let data = new Info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [voltage]
    data.voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor_status]
    data.motor_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sonar_status]
    data.sonar_status = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [arm_torque]
    data.arm_torque = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [arm_status]
    data.arm_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [cam360_status]
    data.cam360_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [second_cam_status]
    data.second_cam_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [map_status]
    data.map_status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ptz_camera]
    data.ptz_camera = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.sonar_status.length;
    length += 8 * object.arm_torque.length;
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_info/Info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e754eb821b149031ec48f77a9ecbbc4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 voltage
    float64 orientation
    float64 velocity
    int32 motor_status
    float64[] sonar_status
    float64[] arm_torque
    int32 arm_status
    int32 cam360_status
    int32 second_cam_status
    int32 map_status
    int32 ptz_camera
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.voltage !== undefined) {
      resolved.voltage = msg.voltage;
    }
    else {
      resolved.voltage = 0.0
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = msg.orientation;
    }
    else {
      resolved.orientation = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.motor_status !== undefined) {
      resolved.motor_status = msg.motor_status;
    }
    else {
      resolved.motor_status = 0
    }

    if (msg.sonar_status !== undefined) {
      resolved.sonar_status = msg.sonar_status;
    }
    else {
      resolved.sonar_status = []
    }

    if (msg.arm_torque !== undefined) {
      resolved.arm_torque = msg.arm_torque;
    }
    else {
      resolved.arm_torque = []
    }

    if (msg.arm_status !== undefined) {
      resolved.arm_status = msg.arm_status;
    }
    else {
      resolved.arm_status = 0
    }

    if (msg.cam360_status !== undefined) {
      resolved.cam360_status = msg.cam360_status;
    }
    else {
      resolved.cam360_status = 0
    }

    if (msg.second_cam_status !== undefined) {
      resolved.second_cam_status = msg.second_cam_status;
    }
    else {
      resolved.second_cam_status = 0
    }

    if (msg.map_status !== undefined) {
      resolved.map_status = msg.map_status;
    }
    else {
      resolved.map_status = 0
    }

    if (msg.ptz_camera !== undefined) {
      resolved.ptz_camera = msg.ptz_camera;
    }
    else {
      resolved.ptz_camera = 0
    }

    return resolved;
    }
};

module.exports = Info;
