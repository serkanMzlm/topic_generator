#ifndef __DYNAMIC_TOPIC__
#define __DYNAMIC_TOPIC__

#include "rclcpp/rclcpp.hpp"
@[for inc in includes]@
#include "@(inc).hpp"
@[end for]@
#define P2F(X) (1/X)

@[for sub_name in subscriptions ]@

@[end for]@

typedef struct{
    rclcpp::Publisher<rangeMsg>::SharedPtr range;
}Pub_t;

typedef struct{
    rclcpp::Subscription<rangeMsg>::SharedPtr range;
}Sub_t;

typedef struct{
    rclcpp::TimerBase::SharedPtr range;
}Time_t;

class DynamicTopic: public rclcpp::Node{
public:
    DynamicTopic();
    void pubRangeCallback();
    void subRangeCallback(const rangeMsg);

private:
    Pub_t pub;
    Sub_t sub;
    Time_t timer;
};

#endif