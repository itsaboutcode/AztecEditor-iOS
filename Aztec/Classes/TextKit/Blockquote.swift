import Foundation

class Blockquote: ParagraphProperty {

    public override func encode(with aCoder: NSCoder) {
        encode(with: aCoder)
    }

    override public init(with representation: HTMLElementRepresentation? = nil) {
        super.init(with: representation)
    }

    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    static func ==(lhs: Blockquote, rhs: Blockquote) -> Bool {
        return true
    }
}

