import cpp
from MacroInvocation mcall
where mcall.getMacroName() in ["ntohs", "ntohl", "ntohll"]
select mcall.getExpr(), "macro be called"