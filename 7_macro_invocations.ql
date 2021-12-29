import cpp
from MacroInvocation mcall
where mcall.getMacro().getName() in ["ntohs", "ntohl", "ntohll"]
select mcall, "macro be called"