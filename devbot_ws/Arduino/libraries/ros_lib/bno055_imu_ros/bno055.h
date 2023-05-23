#ifndef _ROS_bno055_imu_ros_bno055_h
#define _ROS_bno055_imu_ros_bno055_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "geometry_msgs/Quaternion.h"
#include "geometry_msgs/Vector3.h"

namespace bno055_imu_ros
{

  class bno055 : public ros::Msg
  {
    public:
      typedef geometry_msgs::Quaternion _orientation_type;
      _orientation_type orientation;
      typedef geometry_msgs::Vector3 _body_rates_type;
      _body_rates_type body_rates;
      typedef geometry_msgs::Vector3 _linear_acceleration_type;
      _linear_acceleration_type linear_acceleration;

    bno055():
      orientation(),
      body_rates(),
      linear_acceleration()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->orientation.serialize(outbuffer + offset);
      offset += this->body_rates.serialize(outbuffer + offset);
      offset += this->linear_acceleration.serialize(outbuffer + offset);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->orientation.deserialize(inbuffer + offset);
      offset += this->body_rates.deserialize(inbuffer + offset);
      offset += this->linear_acceleration.deserialize(inbuffer + offset);
     return offset;
    }

    virtual const char * getType() override { return "bno055_imu_ros/bno055"; };
    virtual const char * getMD5() override { return "4a660c7f9d8b57853fe5cf85eb92b12f"; };

  };

}
#endif
