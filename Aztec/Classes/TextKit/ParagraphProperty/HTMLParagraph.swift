import Foundation

class HTMLParagraph: ParagraphProperty {
    
    override public func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }

    override public init(with representation: HTMLElementRepresentation? = nil) {
        super.init(with: representation)
    }

    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    static func ==(lhs: HTMLParagraph, rhs: HTMLParagraph) -> Bool {
        return lhs === rhs
    }
}
