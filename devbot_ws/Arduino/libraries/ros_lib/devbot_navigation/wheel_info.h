#ifndef _ROS_my_navigation_pkg_wheel_info_h
#define _ROS_my_navigation_pkg_wheel_info_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace my_navigation_pkg
{

  class wheel_info : public ros::Msg
  {
    public:
      typedef int64_t _wheel_volt_R_type;
      _wheel_volt_R_type wheel_volt_R;
      typedef int64_t _wheel_volt_L_type;
      _wheel_volt_L_type wheel_volt_L;
      typedef float _wheel_cmd_R_type;
      _wheel_cmd_R_type wheel_cmd_R;
      typedef float _wheel_cmd_L_type;
      _wheel_cmd_L_type wheel_cmd_L;
      typedef float _wheel_vel_R_type;
      _wheel_vel_R_type wheel_vel_R;
      typedef float _wheel_vel_L_type;
      _wheel_vel_L_type wheel_vel_L;

    wheel_info():
      wheel_volt_R(0),
      wheel_volt_L(0),
      wheel_cmd_R(0),
      wheel_cmd_L(0),
      wheel_vel_R(0),
      wheel_vel_L(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_wheel_volt_R;
      u_wheel_volt_R.real = this->wheel_volt_R;
      *(outbuffer + offset + 0) = (u_wheel_volt_R.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_wheel_volt_R.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_wheel_volt_R.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_wheel_volt_R.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_wheel_volt_R.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_wheel_volt_R.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_wheel_volt_R.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_wheel_volt_R.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->wheel_volt_R);
      union {
        int64_t real;
        uint64_t base;
      } u_wheel_volt_L;
      u_wheel_volt_L.real = this->wheel_volt_L;
      *(outbuffer + offset + 0) = (u_wheel_volt_L.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_wheel_volt_L.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_wheel_volt_L.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_wheel_volt_L.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_wheel_volt_L.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_wheel_volt_L.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_wheel_volt_L.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_wheel_volt_L.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->wheel_volt_L);
      offset += serializeAvrFloat64(outbuffer + offset, this->wheel_cmd_R);
      offset += serializeAvrFloat64(outbuffer + offset, this->wheel_cmd_L);
      offset += serializeAvrFloat64(outbuffer + offset, this->wheel_vel_R);
      offset += serializeAvrFloat64(outbuffer + offset, this->wheel_vel_L);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_wheel_volt_R;
      u_wheel_volt_R.base = 0;
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_wheel_volt_R.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->wheel_volt_R = u_wheel_volt_R.real;
      offset += sizeof(this->wheel_volt_R);
      union {
        int64_t real;
        uint64_t base;
      } u_wheel_volt_L;
      u_wheel_volt_L.base = 0;
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_wheel_volt_L.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->wheel_volt_L = u_wheel_volt_L.real;
      offset += sizeof(this->wheel_volt_L);
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->wheel_cmd_R));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->wheel_cmd_L));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->wheel_vel_R));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->wheel_vel_L));
     return offset;
    }

    virtual const char * getType() override { return "my_navigation_pkg/wheel_info"; };
    virtual const char * getMD5() override { return "da1f1150c07550c7f87dd0a67c7a0fac"; };

  };

}
#endif
