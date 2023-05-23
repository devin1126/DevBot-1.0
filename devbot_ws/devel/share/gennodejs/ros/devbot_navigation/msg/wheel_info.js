// Auto-generated. Do not edit!

// (in-package devbot_navigation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class wheel_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.wheel_volt_R = null;
      this.wheel_volt_L = null;
      this.wheel_cmd_R = null;
      this.wheel_cmd_L = null;
      this.wheel_vel_R = null;
      this.wheel_vel_L = null;
    }
    else {
      if (initObj.hasOwnProperty('wheel_volt_R')) {
        this.wheel_volt_R = initObj.wheel_volt_R
      }
      else {
        this.wheel_volt_R = 0;
      }
      if (initObj.hasOwnProperty('wheel_volt_L')) {
        this.wheel_volt_L = initObj.wheel_volt_L
      }
      else {
        this.wheel_volt_L = 0;
      }
      if (initObj.hasOwnProperty('wheel_cmd_R')) {
        this.wheel_cmd_R = initObj.wheel_cmd_R
      }
      else {
        this.wheel_cmd_R = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_cmd_L')) {
        this.wheel_cmd_L = initObj.wheel_cmd_L
      }
      else {
        this.wheel_cmd_L = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_vel_R')) {
        this.wheel_vel_R = initObj.wheel_vel_R
      }
      else {
        this.wheel_vel_R = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_vel_L')) {
        this.wheel_vel_L = initObj.wheel_vel_L
      }
      else {
        this.wheel_vel_L = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type wheel_info
    // Serialize message field [wheel_volt_R]
    bufferOffset = _serializer.int64(obj.wheel_volt_R, buffer, bufferOffset);
    // Serialize message field [wheel_volt_L]
    bufferOffset = _serializer.int64(obj.wheel_volt_L, buffer, bufferOffset);
    // Serialize message field [wheel_cmd_R]
    bufferOffset = _serializer.float64(obj.wheel_cmd_R, buffer, bufferOffset);
    // Serialize message field [wheel_cmd_L]
    bufferOffset = _serializer.float64(obj.wheel_cmd_L, buffer, bufferOffset);
    // Serialize message field [wheel_vel_R]
    bufferOffset = _serializer.float64(obj.wheel_vel_R, buffer, bufferOffset);
    // Serialize message field [wheel_vel_L]
    bufferOffset = _serializer.float64(obj.wheel_vel_L, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type wheel_info
    let len;
    let data = new wheel_info(null);
    // Deserialize message field [wheel_volt_R]
    data.wheel_volt_R = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [wheel_volt_L]
    data.wheel_volt_L = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [wheel_cmd_R]
    data.wheel_cmd_R = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_cmd_L]
    data.wheel_cmd_L = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_vel_R]
    data.wheel_vel_R = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_vel_L]
    data.wheel_vel_L = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'devbot_navigation/wheel_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da1f1150c07550c7f87dd0a67c7a0fac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 wheel_volt_R
    int64 wheel_volt_L
    float64 wheel_cmd_R
    float64 wheel_cmd_L
    float64 wheel_vel_R
    float64 wheel_vel_L
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new wheel_info(null);
    if (msg.wheel_volt_R !== undefined) {
      resolved.wheel_volt_R = msg.wheel_volt_R;
    }
    else {
      resolved.wheel_volt_R = 0
    }

    if (msg.wheel_volt_L !== undefined) {
      resolved.wheel_volt_L = msg.wheel_volt_L;
    }
    else {
      resolved.wheel_volt_L = 0
    }

    if (msg.wheel_cmd_R !== undefined) {
      resolved.wheel_cmd_R = msg.wheel_cmd_R;
    }
    else {
      resolved.wheel_cmd_R = 0.0
    }

    if (msg.wheel_cmd_L !== undefined) {
      resolved.wheel_cmd_L = msg.wheel_cmd_L;
    }
    else {
      resolved.wheel_cmd_L = 0.0
    }

    if (msg.wheel_vel_R !== undefined) {
      resolved.wheel_vel_R = msg.wheel_vel_R;
    }
    else {
      resolved.wheel_vel_R = 0.0
    }

    if (msg.wheel_vel_L !== undefined) {
      resolved.wheel_vel_L = msg.wheel_vel_L;
    }
    else {
      resolved.wheel_vel_L = 0.0
    }

    return resolved;
    }
};

module.exports = wheel_info;
