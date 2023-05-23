#ifndef _ROS_devbot_teleop_CMD_h
#define _ROS_devbot_teleop_CMD_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace devbot_teleop
{

  class CMD : public ros::Msg
  {
    public:
      typedef const char* _direction_type;
      _direction_type direction;

    CMD():
      direction("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      uint32_t length_direction = strlen(this->direction);
      varToArr(outbuffer + offset, length_direction);
      offset += 4;
      memcpy(outbuffer + offset, this->direction, length_direction);
      offset += length_direction;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      uint32_t length_direction;
      arrToVar(length_direction, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_direction; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_direction-1]=0;
      this->direction = (char *)(inbuffer + offset-1);
      offset += length_direction;
     return offset;
    }

    virtual const char * getType() override { return "devbot_teleop/CMD"; };
    virtual const char * getMD5() override { return "326e9417def5db9a05a2704a4d8de15e"; };

  };

}
#endif
