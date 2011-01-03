//
// Generated by JTB 1.1.2
//

package jde.parser.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * f0 -> ArrayInitializer()
 *       | Expression()
 * </PRE>
 */
public class VariableInitializer implements Node {
   public NodeChoice f0;

   public VariableInitializer(NodeChoice n0) {
      f0 = n0;
   }

   public void accept(jde.parser.visitor.Visitor v) {
      v.visit(this);
   }
}

