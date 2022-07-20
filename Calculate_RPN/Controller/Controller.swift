class Controller {
    let model: CalcModel
    
    init(viewer: Viewer) {
        print("i'm controller object")
        model = CalcModel(viewer: viewer)
    }
    
    func CalcResult(label: String) {
        print("i'm controller object")
        model.getAnswer(exp: label)

    }
}

