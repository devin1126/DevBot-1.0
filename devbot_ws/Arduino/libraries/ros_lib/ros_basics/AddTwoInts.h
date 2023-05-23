#ifndef _ROS_SERVICE_AddTwoInts_h
#define _ROS_SERVICE_AddTwoInts_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_basics
{

static const char ADDTWOINTS[] = "ros_basics/AddTwoInts";

  class AddTwoIntsRequest : public ros::Msg
  {
    public:
      typedef int64_t _num1_type;
      _num1_type num1;
      typedef int64_t _num2_type;
      _num2_type num2;

    AddTwoIntsRequest():
      num1(0),
      num2(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_num1;
      u_num1.real = this->num1;
      *(outbuffer + offset + 0) = (u_num1.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_num1.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_num1.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_num1.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_num1.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_num1.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_num1.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_num1.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->num1);
      union {
        int64_t real;
        uint64_t base;
      } u_num2;
      u_num2.real = this->num2;
      *(outbuffer + offset + 0) = (u_num2.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_num2.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_num2.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_num2.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_num2.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_num2.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_num2.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_num2.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->num2);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_num1;
      u_num1.base = 0;
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_num1.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->num1 = u_num1.real;
      offset += sizeof(this->num1);
      union {
        int64_t real;
        uint64_t base;
      } u_num2;
      u_num2.base = 0;
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_num2.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->num2 = u_num2.real;
      offset += sizeof(this->num2);
     return offset;
    }

    virtual const char * getType() override { return ADDTWOINTS; };
    virtual const char * getMD5() override { return "0b7233452eef3749ca025e90606b0956"; };

  };

  class AddTwoIntsResponse : public ros::Msg
  {
    public:
      typedef int64_t _sum_type;
      _sum_type sum;

    AddTwoIntsResponse():
      sum(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_sum;
      u_sum.real = this->sum;
      *(outbuffer + offset + 0) = (u_sum.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_sum.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_sum.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_sum.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_sum.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_sum.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_sum.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_sum.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->sum);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_sum;
      u_sum.base = 0;
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_sum.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->sum = u_sum.real;
      offset += sizeof(this->sum);
     return offset;
    }

    virtual const char * getType() override { return ADDTWOINTS; };
    virtual const char * getMD5() override { return "b88405221c77b1878a3cbbfff53428d7"; };

  };

  class AddTwoInts {
    public:
    typedef AddTwoIntsRequest Request;
    typedef AddTwoIntsResponse Response;
  };

}
#endif
