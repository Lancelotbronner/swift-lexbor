import XCTest
import Darwin
import lexbor

public final class LexborTests: XCTestCase {

	public func testExample() {
		let html = "<div>Works fine!</div>"
		guard let document = lxb_html_document_create() else {
			XCTFail("Failed to create document")
			return
		}

		XCTAssert(html.withCString({ lxb_html_document_parse(document, $0, strlen($0)) }) == LXB_STATUS_OK.rawValue, "Could not parse the document")

		guard
			let body = document.pointer(to: \.body)?.pointee,
			let element = body.pointer(to: \.element),
			let dom = element.pointer(to: \.element)
		else {
			XCTFail("Could not retrieve dom element")
			return
		}

		var length = 0
		guard let tagName = lxb_dom_element_tag_name(dom, &length)
		else {
			XCTFail("Could not retrieve element name")
			return
		}
		print(String(cString: tagName))
		lxb_html_document_destroy(document)
	}

}
