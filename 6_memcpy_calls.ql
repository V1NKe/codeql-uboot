import cpp
from FunctionCall fcall
where fcall.getTarget().getName() = "memcpy"
select fcall, "function call"