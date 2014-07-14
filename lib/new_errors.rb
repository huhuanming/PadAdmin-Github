module ActiveRecord  
  
class Errors  
  
@@default_error_messages = {  
  
:inclusion => "在列表中没有包含",  
  
:exclusion => "is reserved",  
  
:invalid => "is invalid",  
  
:confirmation => "doesn't match confirmation",  
  
:accepted => "must be accepted",  
  
:empty => "can't be empty",  
  
:blank => "can't be lank",  
  
:too_long => "is too long (maximum is %d characters)",  
  
:too_short => "is too short (minimum is %d characters)",  
  
:wrong_length => "is the wrong length (should be %d characters)",  
  
:taken => "已经存在了",  
  
:not_a_number => "is not a number。Numbers ars things like 12345 ok?"  
  
}  
  
end  
  
end  