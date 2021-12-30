import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        exists(MacroInvocation mc | 
            mc.getMacroName() in ["ntohs", "ntohl", "ntohll"] |
            this = mc.getExpr())
    }
}

from NetworkByteSwap ns
select ns, "network byte"