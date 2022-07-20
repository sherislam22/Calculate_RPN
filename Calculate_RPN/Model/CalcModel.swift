class CalcModel {
    private let viewer: Viewer
    private let rpn: CaclEngine
    
    init(viewer: Viewer) {
        print("i'm model object init")
        self.viewer = viewer
        rpn = CaclEngine()
    }
    
    public func getAnswer(exp: String) {
        print("i'm model object ")
        let expression = rpn.ExpressionToRPN(ex: exp)
        if !expression.isEmpty {
            let answer: String = String(rpn.RPN(result: expression))
            viewer.update(result: answer)
        } else {
            viewer.update(result: "0")
        }
        
    }
}
