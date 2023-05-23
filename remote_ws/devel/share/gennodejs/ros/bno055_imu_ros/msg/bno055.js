// Auto-generated. Do not edit!

// (in-package bno055_imu_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class bno055 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.orientation = null;
      this.body_rates = null;
      this.linear_acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('body_rates')) {
        this.body_rates = initObj.body_rates
      }
      else {
        this.body_rates = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('linear_acceleration')) {
        this.linear_acceleration = initObj.linear_acceleration
      }
      else {
        this.linear_acceleration = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type bno055
    // Serialize message field [orientation]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [body_rates]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.body_rates, buffer, bufferOffset);
    // Serialize message field [linear_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.linear_acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type bno055
    let len;
    let data = new bno055(null);
    // Deserialize message field [orientation]
    data.orientation = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [body_rates]
    data.body_rates = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_acceleration]
    data.linear_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 80;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bno055_imu_ros/bno055';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a660c7f9d8b57853fe5cf85eb92b12f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Quaternion orientation
    geometry_msgs/Vector3 body_rates
    geometry_msgs/Vector3 linear_acceleration
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new bno055(null);
    if (msg.orientation !== undefined) {
      resolved.orientation = geometry_msgs.msg.Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new geometry_msgs.msg.Quaternion()
    }

    if (msg.body_rates !== undefined) {
      resolved.body_rates = geometry_msgs.msg.Vector3.Resolve(msg.body_rates)
    }
    else {
      resolved.body_rates = new geometry_msgs.msg.Vector3()
    }

    if (msg.linear_acceleration !== undefined) {
      resolved.linear_acceleration = geometry_msgs.msg.Vector3.Resolve(msg.linear_acceleration)
    }
    else {
      resolved.linear_acceleration = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = bno055;
