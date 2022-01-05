import cpp
import semmle.code.cpp.dataflow.TaintTracking

class NetworkByteSwap extends Expr {
    NetworkByteSwap(){
      exists(MacroInvocation mi |
        mi.getMacroName() in ["ntohl", "ntohll", "noths"]  |
        this = mi.getExpr())
    }
}

class MyConfig extends TaintTracking::Configuration {
  MyConfig() {
    this = "my config"
  }

  override predicate isSource(DataFlow::Node source) {
    source.asExpr() instanceof NetworkByteSwap
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(FunctionCall fc | fc.getTarget().getName() = "memcpy" and 
    sink.asExpr() = fc.getArgument(2))
  }
}

from MyConfig mf, DataFlow::PathNode source, DataFlow::PathNode sink
where mf.hasFlowPath(source, sink)
select source, sink