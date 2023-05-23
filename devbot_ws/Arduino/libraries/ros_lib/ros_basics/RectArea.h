#ifndef _ROS_SERVICE_RectArea_h
#define _ROS_SERVICE_RectArea_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_basics
{

static const char RECTAREA[] = "ros_basics/RectArea";

  class RectAreaRequest : public ros::Msg
  {
    public:
      typedef int64_t _length_type;
      _length_type length;
      typedef int64_t _width_type;
      _width_type width;

    RectAreaRequest():
      length(0),
      width(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_length;
      u_length.real = this->length;
      *(outbuffer + offset + 0) = (u_length.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_length.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_length.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_length.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_length.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_length.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_length.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_length.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->length);
      union {
        int64_t real;
        uint64_t base;
      } u_width;
      u_width.real = this->width;
      *(outbuffer + offset + 0) = (u_width.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_width.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_width.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_width.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_width.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_width.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_width.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_width.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->width);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_length;
      u_length.base = 0;
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_length.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->length = u_length.real;
      offset += sizeof(this->length);
      union {
        int64_t real;
        uint64_t base;
      } u_width;
      u_width.base = 0;
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_width.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->width = u_width.real;
      offset += sizeof(this->width);
     return offset;
    }

    virtual const char * getType() override { return RECTAREA; };
    virtual const char * getMD5() override { return "cfaf44ff7cf456b8da61b72c4d6665ee"; };

  };

  class RectAreaResponse : public ros::Msg
  {
    public:
      typedef int64_t _area_type;
      _area_type area;

    RectAreaResponse():
      area(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_area;
      u_area.real = this->area;
      *(outbuffer + offset + 0) = (u_area.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_area.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_area.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_area.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_area.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_area.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_area.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_area.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->area);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_area;
      u_area.base = 0;
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_area.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->area = u_area.real;
      offset += sizeof(this->area);
     return offset;
    }

    virtual const char * getType() override { return RECTAREA; };
    virtual const char * getMD5() override { return "4fc170c8c5cc725917e859b64c96817c"; };

  };

  class RectArea {
    public:
    typedef RectAreaRequest Request;
    typedef RectAreaResponse Response;
  };

}
#endif
