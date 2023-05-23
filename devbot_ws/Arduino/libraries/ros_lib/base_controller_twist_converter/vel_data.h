#ifndef _ROS_base_controller_twist_converter_vel_data_h
#define _ROS_base_controller_twist_converter_vel_data_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace base_controller_twist_converter
{

  class vel_data : public ros::Msg
  {
    public:
      typedef float _linear_velocity_type;
      _linear_velocity_type linear_velocity;
      typedef float _angular_velocity_type;
      _angular_velocity_type angular_velocity;

    vel_data():
      linear_velocity(0),
      angular_velocity(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += serializeAvrFloat64(outbuffer + offset, this->linear_velocity);
      offset += serializeAvrFloat64(outbuffer + offset, this->angular_velocity);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->linear_velocity));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->angular_velocity));
     return offset;
    }

    virtual const char * getType() override { return "base_controller_twist_converter/vel_data"; };
    virtual const char * getMD5() override { return "e55b2cec3678035367208627e07de350"; };

  };

}
#endif
