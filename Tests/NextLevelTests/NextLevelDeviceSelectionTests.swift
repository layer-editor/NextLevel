import AVFoundation
import XCTest
@testable import NextLevel

final class NextLevelDeviceSelectionTests: XCTestCase {
    func testBackCameraSelectionPrefersCompositeDevicesBeforeWide() {
        XCTAssertEqual(
            AVCaptureDevice.defaultPrimaryVideoDeviceTypes(forPosition: .back),
            [
                .builtInTripleCamera,
                .builtInDualWideCamera,
                .builtInDualCamera,
                .builtInWideAngleCamera,
            ]
        )
    }

    func testFrontCameraSelectionPrefersTrueDepthBeforeWideAngle() {
        XCTAssertEqual(
            AVCaptureDevice.defaultPrimaryVideoDeviceTypes(forPosition: .front),
            [
                .builtInTrueDepthCamera,
                .builtInWideAngleCamera,
            ]
        )
    }
}
