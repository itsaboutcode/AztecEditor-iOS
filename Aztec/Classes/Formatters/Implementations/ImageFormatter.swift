import UIKit

class ImageFormatter: StandardAttributeFormatter {
    static let htmlRepresentationKey = "Image.htmlRepresentation"

    init() {
        super.init(
            attributeKey: NSAttachmentAttributeName,
            attributeValue: ImageAttachment(identifier: NSUUID().uuidString),
            htmlRepresentationKey: ImageFormatter.htmlRepresentationKey)
    }

    override func apply(to attributes: [String : Any], andStore representation: HTMLRepresentation?) -> [String: Any] {
        let elementRepresentation = representation as? HTMLElementRepresentation

        guard representation == nil || elementRepresentation != nil else {
            fatalError("This should not be possible.  Review the logic")
        }

        return apply(to: attributes, andStore: elementRepresentation)
    }

    func apply(to attributes: [String : Any], andStore representation: HTMLElementRepresentation?) -> [String: Any] {

        if let representation = representation {
            let url: URL?

            if let urlString = representation.valueForAttribute(named: "src") {
                url = URL(string: urlString)
            } else {
                url = nil
            }

            let attachment = ImageAttachment(identifier: UUID().uuidString, url: url)

            if let elementClass = representation.valueForAttribute(named: "class") {
                let classAttributes = elementClass.components(separatedBy: " ")
                for classAttribute in classAttributes {
                    if let alignment = ImageAttachment.Alignment.fromHTML(string: classAttribute) {
                        attachment.alignment = alignment
                    }
                    if let size = ImageAttachment.Size.fromHTML(string: classAttribute) {
                        attachment.size = size
                    }
                }
            }

            attributeValue = attachment
        } else {
            attributeValue = ImageAttachment(identifier: UUID().uuidString)
        }

        return super.apply(to: attributes, andStore: representation)
    }
}
