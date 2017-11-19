local p = redis.call("GET", KEYS[1])
if p then
  return p
end
local free_p = redis.call("lpop", "p_id")
if free_p == nil then 
	return 'Invalid, out of parking' 
end 
redis.call("SET", KEYS[1], free_p)
return free_p

