#ifndef _ROS_mpu6050_imu_ros_mpu6050_h
#define _ROS_mpu6050_imu_ros_mpu6050_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "geometry_msgs/Quaternion.h"
#include "geometry_msgs/Vector3.h"

namespace mpu6050_imu_ros
{

  class mpu6050 : public ros::Msg
  {
    public:
      typedef geometry_msgs::Quaternion _orientation_type;
      _orientation_type orientation;
      typedef geometry_msgs::Vector3 _body_rates_type;
      _body_rates_type body_rates;

    mpu6050():
      orientation(),
      body_rates()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->orientation.serialize(outbuffer + offset);
      offset += this->body_rates.serialize(outbuffer + offset);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->orientation.deserialize(inbuffer + offset);
      offset += this->body_rates.deserialize(inbuffer + offset);
     return offset;
    }

    virtual const char * getType() override { return "mpu6050_imu_ros/mpu6050"; };
    virtual const char * getMD5() override { return "d84bad830e0ca58f7358ace8e2e9beef"; };

  };

}
#endif
